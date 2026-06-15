package com.alice.partidascrevillente

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.PackageInfo
import android.net.Uri
import android.os.Build
import androidx.core.content.FileProvider
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
import java.io.File
import java.net.HttpURLConnection
import java.net.URL

data class UpdateInfo(
    val versionCode: Long,
    val versionName: String,
    val apkUrl: String,
    val notes: String,
    val minSupportedVersionCode: Long,
    val publishedAt: String
)

class AppUpdateManager(private val context: Context) {
    companion object {
        const val UPDATE_JSON_URL = "https://crevi-loc-web.pages.dev/update.json"
        private const val PREFS_NAME = "update_state"
        private const val KEY_PENDING_VERSION = "pending_version"
    }

    private val preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)

    suspend fun fetchUpdateInfo(): Result<UpdateInfo> = withContext(Dispatchers.IO) {
        runCatching {
            val connection = (URL(UPDATE_JSON_URL).openConnection() as HttpURLConnection).apply {
                requestMethod = "GET"
                connectTimeout = 10000
                readTimeout = 10000
                setRequestProperty("Accept", "application/json")
            }

            try {
                connection.inputStream.bufferedReader().use { reader ->
                    val json = JSONObject(reader.readText())
                    UpdateInfo(
                        versionCode = json.getLong("versionCode"),
                        versionName = json.getString("versionName"),
                        apkUrl = json.getString("apkUrl"),
                        notes = json.optString("notes"),
                        minSupportedVersionCode = json.optLong("minSupportedVersionCode", json.getLong("versionCode")),
                        publishedAt = json.optString("publishedAt")
                    )
                }
            } finally {
                connection.disconnect()
            }
        }
    }

    fun getInstalledVersionCode(): Long {
        val packageInfo = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            context.packageManager.getPackageInfo(
                context.packageName,
                PackageManager.PackageInfoFlags.of(0)
            )
        } else {
            @Suppress("DEPRECATION")
            context.packageManager.getPackageInfo(context.packageName, 0)
        }
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            packageInfo.longVersionCode
        } else {
            @Suppress("DEPRECATION")
            packageInfo.versionCode.toLong()
        }
    }

    fun hasUpdate(updateInfo: UpdateInfo): Boolean = updateInfo.versionCode > getInstalledVersionCode()

    fun isUpdateMandatory(updateInfo: UpdateInfo): Boolean = getInstalledVersionCode() < updateInfo.minSupportedVersionCode

    suspend fun downloadUpdate(updateInfo: UpdateInfo): Result<File> = withContext(Dispatchers.IO) {
        runCatching {
            val updateDirectory = File(context.cacheDir, "updates").apply { mkdirs() }
            val target = File(updateDirectory, "crevi-loc-${updateInfo.versionCode}.apk")
            val partial = File(updateDirectory, "crevi-loc-${updateInfo.versionCode}.part.apk")
            val connection = (URL(updateInfo.apkUrl).openConnection() as HttpURLConnection).apply {
                requestMethod = "GET"
                connectTimeout = 15000
                readTimeout = 30000
            }
            try {
                check(connection.responseCode in 200..299) {
                    "HTTP ${connection.responseCode}"
                }
                connection.inputStream.use { input ->
                    partial.outputStream().use { output -> input.copyTo(output) }
                }
            } finally {
                connection.disconnect()
            }
            check(isValidUpdate(partial, updateInfo)) { "Invalid update package" }
            partial.copyTo(target, overwrite = true)
            partial.delete()
            markUpdatePending(updateInfo.versionCode)
            target
        }.onFailure {
            File(context.cacheDir, "updates/crevi-loc-${updateInfo.versionCode}.part.apk").delete()
        }
    }

    fun findValidDownloadedUpdate(updateInfo: UpdateInfo): File? {
        val target = File(context.cacheDir, "updates/crevi-loc-${updateInfo.versionCode}.apk")
        if (!isValidUpdate(target, updateInfo)) {
            target.delete()
            return null
        }
        return target
    }

    fun markUpdatePending(versionCode: Long) {
        preferences.edit().putLong(KEY_PENDING_VERSION, versionCode).apply()
    }

    fun wasUpdatePending(updateInfo: UpdateInfo): Boolean =
        preferences.getLong(KEY_PENDING_VERSION, -1L) == updateInfo.versionCode

    private fun isValidUpdate(file: File, updateInfo: UpdateInfo): Boolean {
        if (!file.isFile || file.length() <= 0L) return false
        val archiveInfo = packageArchiveInfo(file) ?: return false
        val archiveVersion = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            archiveInfo.longVersionCode
        } else {
            @Suppress("DEPRECATION")
            archiveInfo.versionCode.toLong()
        }
        if (archiveInfo.packageName != context.packageName || archiveVersion != updateInfo.versionCode) {
            return false
        }
        val archiveSignatures = packageSignatures(archiveInfo)
        return archiveSignatures.isNotEmpty() &&
            archiveSignatures == packageSignatures(installedPackageInfo())
    }

    private fun packageArchiveInfo(file: File): PackageInfo? {
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            PackageManager.GET_SIGNING_CERTIFICATES
        } else {
            @Suppress("DEPRECATION")
            PackageManager.GET_SIGNATURES
        }
        return context.packageManager.getPackageArchiveInfo(file.absolutePath, flags)
    }

    private fun installedPackageInfo(): PackageInfo {
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            PackageManager.GET_SIGNING_CERTIFICATES
        } else {
            @Suppress("DEPRECATION")
            PackageManager.GET_SIGNATURES
        }
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            context.packageManager.getPackageInfo(
                context.packageName,
                PackageManager.PackageInfoFlags.of(flags.toLong())
            )
        } else {
            @Suppress("DEPRECATION")
            context.packageManager.getPackageInfo(context.packageName, flags)
        }
    }

    private fun packageSignatures(packageInfo: PackageInfo): Set<String> {
        val signatures = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            packageInfo.signingInfo?.apkContentsSigners.orEmpty()
        } else {
            @Suppress("DEPRECATION")
            packageInfo.signatures.orEmpty()
        }
        return signatures.map { it.toCharsString() }.toSet()
    }

    fun openInstaller(apkFile: File) {
        val apkUri = FileProvider.getUriForFile(
            context,
            "${context.packageName}.fileprovider",
            apkFile
        )
        val intent = Intent(Intent.ACTION_INSTALL_PACKAGE, apkUri).apply {
            setDataAndType(apkUri, "application/vnd.android.package-archive")
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(intent)
    }

    fun cleanupDownloadedUpdate() {
        val updateDirectory = File(context.cacheDir, "updates")
        updateDirectory.listFiles()?.forEach { apk ->
            if (apk.name.endsWith(".part.apk")) {
                apk.delete()
                return@forEach
            }
            val archiveInfo = context.packageManager.getPackageArchiveInfo(apk.absolutePath, 0)
            val archiveVersion = archiveInfo?.let {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) it.longVersionCode
                else @Suppress("DEPRECATION") it.versionCode.toLong()
            }
            if (archiveVersion == null || archiveVersion <= getInstalledVersionCode()) apk.delete()
        }
        if (preferences.getLong(KEY_PENDING_VERSION, -1L) <= getInstalledVersionCode()) {
            preferences.edit().remove(KEY_PENDING_VERSION).apply()
        }
    }

    fun unregisterReceiverSafely() {
        // no-op: retained to keep MainActivity simple
    }
}
