package com.alice.partidascrevillente

import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.json.JSONObject
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
    }

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

    fun openUpdateInBrowser(updateInfo: UpdateInfo) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(updateInfo.apkUrl)).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(intent)
    }

    fun unregisterReceiverSafely() {
        // no-op: retained to keep MainActivity simple
    }
}
