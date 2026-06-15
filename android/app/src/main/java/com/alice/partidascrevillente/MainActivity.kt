package com.alice.partidascrevillente

import android.Manifest
import android.app.Dialog
import android.app.DownloadManager
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Color
import android.graphics.Paint
import android.graphics.drawable.ColorDrawable
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.view.View
import android.view.Window
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.Spinner
import android.widget.Switch
import android.widget.TextView
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import androidx.core.view.WindowInsetsControllerCompat
import androidx.lifecycle.lifecycleScope
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {
    private lateinit var partidaAdapter: ThemeAwareSpinnerAdapter
    private lateinit var updateManager: AppUpdateManager

    companion object {
        private const val PREFS_NAME = "app_prefs"
        private const val KEY_DARK_THEME = "dark_theme"
    }

    private lateinit var repository: PartidasRepository
    private lateinit var engine: SearchEngine

    private lateinit var rootContainer: View
    private lateinit var panelContainer: LinearLayout
    private lateinit var themeLabel: TextView
    private lateinit var themeSwitch: Switch
    private lateinit var titleText: TextView
    private lateinit var subtitleText: TextView
    private lateinit var partidaLabel: TextView
    private lateinit var numberLabel: TextView
    private lateinit var suffixLabel: TextView
    private lateinit var partidaSpinner: Spinner
    private lateinit var numberInput: EditText
    private lateinit var suffixInput: EditText
    private lateinit var statusText: TextView
    private lateinit var resultContainer: LinearLayout
    private lateinit var resultTitle: TextView
    private lateinit var resultCoords: TextView
    private lateinit var searchButton: Button
    private lateinit var openMapsButton: Button
    private lateinit var shareButton: Button
    private lateinit var webLinksDivider: View
    private lateinit var accessWebLink: TextView
    private lateinit var downloadQrLink: TextView
    private lateinit var versionText: TextView

    private var currentEntry: AddressEntry? = null
    private var currentPartidaDisplayName: String = ""
    private var isDarkTheme: Boolean = false

    private val storagePermissionLauncher = registerForActivityResult(
        ActivityResultContracts.RequestPermission()
    ) { granted ->
        if (granted) {
            enqueueQrDownload()
        } else {
            Toast.makeText(this, R.string.storage_permission_denied, Toast.LENGTH_LONG).show()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        updateManager = AppUpdateManager(this)

        rootContainer = findViewById(R.id.rootContainer)
        panelContainer = findViewById(R.id.panelContainer)
        themeLabel = findViewById(R.id.themeLabel)
        themeSwitch = findViewById(R.id.themeSwitch)
        titleText = findViewById(R.id.titleText)
        subtitleText = findViewById(R.id.subtitleText)
        partidaLabel = findViewById(R.id.partidaLabel)
        numberLabel = findViewById(R.id.numberLabel)
        suffixLabel = findViewById(R.id.suffixLabel)
        partidaSpinner = findViewById(R.id.partidaSpinner)
        numberInput = findViewById(R.id.numberInput)
        suffixInput = findViewById(R.id.suffixInput)
        statusText = findViewById(R.id.statusText)
        resultContainer = findViewById(R.id.resultContainer)
        resultTitle = findViewById(R.id.resultTitle)
        resultCoords = findViewById(R.id.resultCoords)
        searchButton = findViewById(R.id.searchButton)
        openMapsButton = findViewById(R.id.openMapsButton)
        shareButton = findViewById(R.id.shareButton)
        webLinksDivider = findViewById(R.id.webLinksDivider)
        accessWebLink = findViewById(R.id.accessWebLink)
        downloadQrLink = findViewById(R.id.downloadQrLink)
        versionText = findViewById(R.id.versionText)
        versionText.text = "v${BuildConfig.VERSION_NAME}"

        accessWebLink.paintFlags = accessWebLink.paintFlags or Paint.UNDERLINE_TEXT_FLAG
        downloadQrLink.paintFlags = downloadQrLink.paintFlags or Paint.UNDERLINE_TEXT_FLAG
        accessWebLink.setOnClickListener { openWebDestination(WebDestinations.WEB_URL) }
        downloadQrLink.setOnClickListener { downloadWebQr() }

        val savedDarkTheme = getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            .getBoolean(KEY_DARK_THEME, false)

        themeSwitch.setOnCheckedChangeListener(null)
        themeSwitch.isChecked = savedDarkTheme
        applyTheme(savedDarkTheme)

        themeSwitch.setOnCheckedChangeListener { _, isChecked ->
            applyTheme(isChecked)
            getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                .edit()
                .putBoolean(KEY_DARK_THEME, isChecked)
                .apply()
        }

        try {
            repository = PartidasRepository(this)
            val dataset = repository.loadDataset()
            val partidas = repository.loadPartidaDisplayNames().sorted()
            engine = SearchEngine(dataset, partidas)

            partidaAdapter = ThemeAwareSpinnerAdapter(this, partidas)
            partidaAdapter.darkTheme = isDarkTheme
            partidaSpinner.adapter = partidaAdapter
            updateSpinnerTextColor()

            searchButton.setOnClickListener {
                animateButtonPress(it) {
                    runSearch()
                }
            }

            openMapsButton.setOnClickListener {
                animateButtonPress(it) {
                    currentEntry?.let { entry ->
                        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(engine.buildMapsUrl(entry))))
                    }
                }
            }

            shareButton.setOnClickListener {
                animateButtonPress(it) {
                    currentEntry?.let { entry ->
                        val sendIntent = Intent(Intent.ACTION_SEND).apply {
                            type = "text/plain"
                            putExtra(Intent.EXTRA_TEXT, engine.buildShareText(currentPartidaDisplayName, entry))
                        }
                        startActivity(Intent.createChooser(sendIntent, "Compartir ubicación"))
                    }
                }
            }

            statusText.text = ""
            checkForUpdates()
        } catch (t: Throwable) {
            statusText.text = "Error cargando la app: ${t.message ?: t::class.java.simpleName}"
        }
    }

    override fun onDestroy() {
        updateManager.unregisterReceiverSafely()
        super.onDestroy()
    }

    private fun checkForUpdates() {
        lifecycleScope.launch {
            val updateResult = updateManager.fetchUpdateInfo()
            updateResult.onSuccess { updateInfo ->
                if (updateManager.hasUpdate(updateInfo)) {
                    showUpdateDialog(updateInfo)
                }
            }
        }
    }

    private fun showUpdateDialog(updateInfo: UpdateInfo) {
        val isMandatory = updateManager.isUpdateMandatory(updateInfo)
        val dialog = Dialog(this)
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setContentView(R.layout.dialog_update)
        dialog.window?.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        dialog.setCancelable(!isMandatory)
        dialog.setCanceledOnTouchOutside(!isMandatory)

        val root = dialog.findViewById<LinearLayout>(R.id.updateDialogRoot)
        val title = dialog.findViewById<TextView>(R.id.updateDialogTitle)
        val message = dialog.findViewById<TextView>(R.id.updateDialogMessage)
        val positiveButton = dialog.findViewById<Button>(R.id.updateDialogPositiveButton)
        val negativeButton = dialog.findViewById<Button>(R.id.updateDialogNegativeButton)

        title.text = if (isMandatory) {
            getString(R.string.update_required_title)
        } else {
            getString(R.string.update_available_title)
        }

        message.text = buildString {
            append("Nueva versión disponible: ${updateInfo.versionName}")
            if (updateInfo.notes.isNotBlank()) {
                append("\n")
                append(updateInfo.notes)
            }
            if (isMandatory) {
                append("\n\n")
                append(getString(R.string.update_required_message))
            }
        }

        if (isDarkTheme) {
            root.background = ContextCompat.getDrawable(this, R.drawable.panel_bg_dark)
            title.setTextColor(Color.parseColor("#F2F5FF"))
            message.setTextColor(Color.parseColor("#C6D0F5"))
            negativeButton.background = ContextCompat.getDrawable(this, R.drawable.secondary_button_bg_dark)
            negativeButton.setTextColor(Color.parseColor("#F2F5FF"))
        } else {
            root.background = ContextCompat.getDrawable(this, R.drawable.panel_bg_light)
            title.setTextColor(Color.parseColor("#1A2240"))
            message.setTextColor(Color.parseColor("#4E5B7D"))
            negativeButton.background = ContextCompat.getDrawable(this, R.drawable.secondary_button_bg_light)
            negativeButton.setTextColor(Color.parseColor("#33406A"))
        }

        positiveButton.setOnClickListener {
            animateButtonPress(positiveButton) {
                dialog.dismiss()
                startUpdate(updateInfo)
            }
        }

        if (isMandatory) {
            negativeButton.visibility = View.GONE
        } else {
            negativeButton.setOnClickListener {
                animateButtonPress(negativeButton) {
                    dialog.dismiss()
                }
            }
        }

        dialog.show()
    }

    private fun startUpdate(updateInfo: UpdateInfo) {
        AlertDialog.Builder(this)
            .setTitle(R.string.manual_install_title)
            .setMessage(R.string.manual_install_message)
            .setPositiveButton(R.string.manual_install_continue) { _, _ ->
                updateManager.openUpdateInBrowser(updateInfo)
            }
            .show()
    }

    private fun applyTheme(dark: Boolean) {
        isDarkTheme = dark

        if (dark) {
            window.navigationBarColor = Color.BLACK
            WindowInsetsControllerCompat(window, window.decorView)
                .isAppearanceLightNavigationBars = false
            rootContainer.setBackgroundColor(Color.parseColor("#000000"))
            panelContainer.background = ContextCompat.getDrawable(this, R.drawable.panel_bg_dark)
            themeLabel.text = "Tema oscuro"
            themeLabel.setTextColor(Color.parseColor("#C9D2FF"))
            titleText.setTextColor(Color.parseColor("#F2F5FF"))
            subtitleText.setTextColor(Color.parseColor("#B8C2EA"))
            partidaLabel.setTextColor(Color.parseColor("#DCE4FF"))
            numberLabel.setTextColor(Color.parseColor("#DCE4FF"))
            suffixLabel.setTextColor(Color.parseColor("#DCE4FF"))
            numberInput.background = ContextCompat.getDrawable(this, R.drawable.input_bg_dark)
            suffixInput.background = ContextCompat.getDrawable(this, R.drawable.input_bg_dark)
            numberInput.setTextColor(Color.parseColor("#F4F7FF"))
            suffixInput.setTextColor(Color.parseColor("#F4F7FF"))
            numberInput.setHintTextColor(Color.parseColor("#96A4CF"))
            suffixInput.setHintTextColor(Color.parseColor("#96A4CF"))
            partidaSpinner.background = ContextCompat.getDrawable(this, R.drawable.input_bg_dark)
            statusText.setTextColor(Color.parseColor("#FF9DB1"))
            resultTitle.setTextColor(Color.parseColor("#F2F5FF"))
            resultCoords.setTextColor(Color.parseColor("#C6D0F5"))
            shareButton.background = ContextCompat.getDrawable(this, R.drawable.secondary_button_bg_dark)
            shareButton.setTextColor(Color.parseColor("#F2F5FF"))
            webLinksDivider.setBackgroundColor(Color.parseColor("#3E4A78"))
            accessWebLink.setTextColor(Color.parseColor("#B8C2EA"))
            downloadQrLink.setTextColor(Color.parseColor("#B8C2EA"))
            versionText.setTextColor(Color.WHITE)
        } else {
            window.navigationBarColor = Color.WHITE
            WindowInsetsControllerCompat(window, window.decorView)
                .isAppearanceLightNavigationBars = true
            rootContainer.setBackgroundColor(Color.parseColor("#FFFFFF"))
            panelContainer.background = ContextCompat.getDrawable(this, R.drawable.panel_bg_light)
            themeLabel.text = "Tema claro"
            themeLabel.setTextColor(Color.parseColor("#4F5A78"))
            titleText.setTextColor(Color.parseColor("#1A2240"))
            subtitleText.setTextColor(Color.parseColor("#5D6888"))
            partidaLabel.setTextColor(Color.parseColor("#253055"))
            numberLabel.setTextColor(Color.parseColor("#253055"))
            suffixLabel.setTextColor(Color.parseColor("#253055"))
            numberInput.background = ContextCompat.getDrawable(this, R.drawable.input_bg_light)
            suffixInput.background = ContextCompat.getDrawable(this, R.drawable.input_bg_light)
            numberInput.setTextColor(Color.parseColor("#101528"))
            suffixInput.setTextColor(Color.parseColor("#101528"))
            numberInput.setHintTextColor(Color.parseColor("#66708A"))
            suffixInput.setHintTextColor(Color.parseColor("#66708A"))
            partidaSpinner.background = ContextCompat.getDrawable(this, R.drawable.input_bg_light)
            statusText.setTextColor(Color.parseColor("#A63A52"))
            resultTitle.setTextColor(Color.parseColor("#1A2240"))
            resultCoords.setTextColor(Color.parseColor("#4E5B7D"))
            shareButton.background = ContextCompat.getDrawable(this, R.drawable.secondary_button_bg_light)
            shareButton.setTextColor(Color.parseColor("#33406A"))
            webLinksDivider.setBackgroundColor(Color.parseColor("#C8D2FF"))
            accessWebLink.setTextColor(Color.parseColor("#5D6888"))
            downloadQrLink.setTextColor(Color.parseColor("#5D6888"))
            versionText.setTextColor(Color.BLACK)
        }

        updateSpinnerTextColor()
    }

    private fun updateSpinnerTextColor() {
        if (!::partidaAdapter.isInitialized) return
        val color = if (isDarkTheme) Color.parseColor("#F4F7FF") else Color.parseColor("#101528")
        partidaAdapter.darkTheme = isDarkTheme
        partidaAdapter.notifyDataSetChanged()
        partidaSpinner.post {
            val selectedView = partidaSpinner.selectedView as? TextView
            selectedView?.setTextColor(color)
        }
    }

    private fun animateButtonPress(view: View, onPressed: () -> Unit) {
        view.animate()
            .scaleX(0.96f)
            .scaleY(0.96f)
            .setDuration(70)
            .setInterpolator(AccelerateDecelerateInterpolator())
            .withEndAction {
                view.animate()
                    .scaleX(1f)
                    .scaleY(1f)
                    .setDuration(110)
                    .setInterpolator(AccelerateDecelerateInterpolator())
                    .start()
                onPressed()
            }
            .start()
    }

    private fun openWebDestination(url: String) {
        startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
    }

    private fun downloadWebQr() {
        val needsLegacyPermission = Build.VERSION.SDK_INT <= Build.VERSION_CODES.P &&
            ContextCompat.checkSelfPermission(
                this,
                Manifest.permission.WRITE_EXTERNAL_STORAGE
            ) != PackageManager.PERMISSION_GRANTED

        if (needsLegacyPermission) {
            storagePermissionLauncher.launch(Manifest.permission.WRITE_EXTERNAL_STORAGE)
        } else {
            enqueueQrDownload()
        }
    }

    private fun enqueueQrDownload() {
        val request = DownloadManager.Request(Uri.parse(WebDestinations.QR_URL))
            .setTitle(getString(R.string.qr_download_title))
            .setDescription(getString(R.string.qr_download_description))
            .setMimeType("image/png")
            .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
            .setDestinationInExternalPublicDir(
                Environment.DIRECTORY_DOWNLOADS,
                "crevi-loc-web-qr.png"
            )

        val downloadManager = getSystemService(Context.DOWNLOAD_SERVICE) as DownloadManager
        downloadManager.enqueue(request)
        Toast.makeText(this, R.string.qr_download_started, Toast.LENGTH_SHORT).show()
    }

    private fun runSearch() {
        if (!::engine.isInitialized) {
            statusText.text = "La app no ha cargado correctamente aún"
            return
        }

        val partida = partidaSpinner.selectedItem?.toString().orEmpty()
        val number = numberInput.text?.toString().orEmpty()
        val suffix = suffixInput.text?.toString().orEmpty()

        val input = engine.normalizeInput(partida, number, suffix)
        if (input.isFailure) {
            statusText.text = input.exceptionOrNull()?.message ?: "Entrada no válida"
            resultContainer.visibility = View.GONE
            currentEntry = null
            return
        }

        val normalized = input.getOrThrow()
        currentPartidaDisplayName = normalized.partidaDisplayName
        val result = engine.search(normalized)
        statusText.text = result.message.orEmpty()

        val entry = result.entry ?: result.candidates.firstOrNull()
        if (entry == null) {
            resultContainer.visibility = View.GONE
            currentEntry = null
            return
        }

        currentEntry = entry
        val displayNumber = entry.number.toIntOrNull()?.toString() ?: entry.number.trimStart('0').ifBlank { entry.number }
        resultTitle.text = "PTDA. ${normalized.partidaDisplayName} ${displayNumber}${if (entry.suffix == "X") "" else entry.suffix}"
        resultCoords.text = "${entry.lat}, ${entry.lng}"
        resultContainer.visibility = View.VISIBLE
    }
}
