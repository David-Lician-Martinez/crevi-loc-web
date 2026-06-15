import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const read = (path) => readFile(new URL(path, import.meta.url), 'utf8').catch(() => '');

const [
  gradle,
  mainActivity,
  updateManager,
  manifest,
  filePaths,
  activityLayout,
  compactLinks,
  regularLinks,
  manualInstallDialog,
  strings,
  updateJson,
  qrSquareImageView,
  releaseUpdateJson,
] = await Promise.all([
  read('../android/app/build.gradle.kts'),
  read('../android/app/src/main/java/com/alice/partidascrevillente/MainActivity.kt'),
  read('../android/app/src/main/java/com/alice/partidascrevillente/AppUpdateManager.kt'),
  read('../android/app/src/main/AndroidManifest.xml'),
  read('../android/app/src/main/res/xml/file_paths.xml'),
  read('../android/app/src/main/res/layout/activity_main.xml'),
  read('../android/app/src/main/res/layout/web_links.xml'),
  read('../android/app/src/main/res/layout-sw341dp/web_links.xml'),
  read('../android/app/src/main/res/layout/dialog_manual_install.xml'),
  read('../android/app/src/main/res/values/strings.xml'),
  read('../public/update.json'),
  read('../android/app/src/main/java/com/alice/partidascrevillente/QrSquareImageView.kt'),
  read('../release-assets/crevi-loc-update.json'),
]);

test('configures Android release 1.0.12 with version code 13', () => {
  assert.match(gradle, /versionCode\s*=\s*13/u);
  assert.match(gradle, /versionName\s*=\s*"1\.0\.12"/u);
});

test('keeps bottom web links responsive and places Share App above the title', () => {
  assert.match(activityLayout, /layout="@layout\/web_links"/u);
  assert.match(compactLinks, /android:orientation="vertical"/u);
  assert.match(regularLinks, /android:orientation="horizontal"/u);
  assert.match(strings, /<string name="access_web">Accede a la Web<\/string>/u);
  assert.match(strings, /<string name="show_web_qr">Mostrar QR Web<\/string>/u);
  assert.match(strings, /<string name="share_app">Compartir App<\/string>/u);
  assert.doesNotMatch(compactLinks, /shareAppLink/u);
  assert.doesNotMatch(regularLinks, /shareAppLink/u);
  assert.ok(activityLayout.indexOf('@+id/shareAppLink') < activityLayout.indexOf('@+id/titleText'));
  assert.match(activityLayout, /android:id="@\+id\/shareAppLink"[\s\S]*android:layout_gravity="end"/u);
  assert.match(activityLayout, /android:id="@\+id\/panelContainer"[\s\S]*android:paddingTop="12dp"/u);
  assert.match(activityLayout, /android:paddingStart="22dp"/u);
  assert.match(activityLayout, /android:paddingEnd="22dp"/u);
  assert.match(activityLayout, /android:paddingBottom="12dp"/u);
  assert.match(activityLayout, /android:id="@\+id\/statusText"[\s\S]*android:layout_marginTop="8dp"[\s\S]*android:visibility="gone"/u);
  assert.doesNotMatch(activityLayout, /webLinksDivider/u);
  assert.doesNotMatch(mainActivity, /webLinksDivider/u);
  assert.match(compactLinks, /android:layout_marginTop="4dp"/u);
  assert.match(regularLinks, /android:layout_marginTop="4dp"/u);
  assert.match(mainActivity, /private fun setStatusMessage\(message: String\)/u);
  assert.match(mainActivity, /statusText\.visibility = if \(message\.isBlank\(\)\) View\.GONE else View\.VISIBLE/u);
});

test('downloads the QR into the public Downloads directory', () => {
  assert.match(mainActivity, /DownloadManager\.Request/u);
  assert.match(mainActivity, /setDestinationInExternalPublicDir\(\s*Environment\.DIRECTORY_DOWNLOADS/u);
  assert.match(manifest, /WRITE_EXTERNAL_STORAGE/u);
});

test('publishes update metadata for Android 1.0.12', () => {
  const update = JSON.parse(updateJson);
  assert.equal(update.versionCode, 13);
  assert.equal(update.versionName, '1.0.12');
  assert.equal(update.apkUrl, 'https://crevi-loc-web.pages.dev/downloads/crevi-loc.apk?v=13');
  assert.match(update.notes, /Cañada Juana y Peña Sendra/u);
});

test('publishes robust GitHub release metadata for update fallback', () => {
  const releaseUpdate = JSON.parse(releaseUpdateJson);
  assert.equal(releaseUpdate.versionCode, 13);
  assert.equal(releaseUpdate.versionName, '1.0.12');
  assert.equal(releaseUpdate.apkAssetName, 'crevi-loc.apk');
  assert.match(releaseUpdate.notes, /Cañada Juana y Peña Sendra/u);
  assert.doesNotMatch(releaseUpdateJson, /crevi-loc-web\.pages\.dev\/downloads\/crevi-loc\.apk/u);
});

test('falls back to public GitHub Releases when Cloudflare update metadata fails', () => {
  assert.match(updateManager, /GITHUB_LATEST_RELEASE_URL\s*=\s*"https:\/\/api\.github\.com\/repos\/David-Lician-Martinez\/crevi-loc-web\/releases\/latest"/u);
  assert.match(updateManager, /GITHUB_UPDATE_ASSET_NAME\s*=\s*"crevi-loc-update\.json"/u);
  assert.match(updateManager, /fetchCloudflareUpdateInfo\(\)/u);
  assert.match(updateManager, /fetchGitHubReleaseUpdateInfo\(\)/u);
  assert.match(updateManager, /recoverCatching\s*\{\s*fetchGitHubReleaseUpdateInfo\(\)\s*\}/u);
  assert.match(updateManager, /apkAssetName/u);
  assert.match(updateManager, /browser_download_url/u);
  assert.match(updateManager, /User-Agent/u);
});

test('downloads updates privately and opens the Android installer', () => {
  assert.match(updateManager, /context\.cacheDir/u);
  assert.match(updateManager, /FileProvider\.getUriForFile/u);
  assert.match(updateManager, /application\/vnd\.android\.package-archive/u);
  assert.match(updateManager, /Intent\.ACTION_INSTALL_PACKAGE/u);
  assert.match(manifest, /REQUEST_INSTALL_PACKAGES/u);
  assert.match(filePaths, /<cache-path/u);
});

test('cleans temporary update APKs after installation', () => {
  assert.match(updateManager, /cleanupDownloadedUpdate/u);
  assert.match(mainActivity, /updateManager\.cleanupDownloadedUpdate\(\)/u);
  assert.match(updateManager, /apk\.name\.endsWith\("\.part\.apk"\)/u);
});

test('resumes a valid pending update and remembers missing pending downloads', () => {
  assert.match(updateManager, /findValidDownloadedUpdate/u);
  assert.match(updateManager, /markUpdatePending/u);
  assert.match(updateManager, /wasUpdatePending/u);
  assert.match(updateManager, /packageName\s*!=\s*context\.packageName/u);
  assert.match(mainActivity, /showPendingInstallDialog/u);
  assert.match(mainActivity, /showPendingDownloadDialog/u);
  assert.match(strings, /<string name="continue_installation">Continuar instalación<\/string>/u);
  assert.match(strings, /<string name="download_update">Descargar actualización<\/string>/u);
});

test('starts the normal update without the manual installation dialog', () => {
  assert.match(mainActivity, /private fun startUpdate\(updateInfo: UpdateInfo\)\s*\{\s*downloadAndInstallUpdate\(updateInfo\)\s*\}/u);
});

test('offers a web fallback only after a private download failure', () => {
  assert.match(mainActivity, /\.onFailure\s*\{\s*showDownloadFailureDialog\(updateInfo\)/u);
  assert.match(mainActivity, /showWebDownloadWarning/u);
  assert.match(mainActivity, /openWebDestination\(updateInfo\.apkUrl\)/u);
  assert.match(strings, /<string name="download_from_web">Descargar desde la web<\/string>/u);
  assert.match(strings, /Tras la descarga tendrás que instalar la aplicación manualmente desde la carpeta de Descargas\./u);
});

test('shares a temporary copy of the installed APK', () => {
  assert.match(mainActivity, /applicationInfo\.sourceDir/u);
  assert.match(mainActivity, /Intent\.ACTION_SEND/u);
  assert.match(mainActivity, /application\/vnd\.android\.package-archive/u);
  assert.match(mainActivity, /FileProvider\.getUriForFile/u);
  assert.match(mainActivity, /shareAppLink/u);
});

test('adds scrollable bottom clearance above smartphone navigation', () => {
  assert.match(activityLayout, /android:id="@\+id\/scrollBottomClearance"/u);
  assert.match(activityLayout, /android:layout_height="32dp"/u);
});

test('shows the QR in an Android dialog with explicit back and download actions', () => {
  assert.match(mainActivity, /setContentView\(R\.layout\.dialog_qr\)/u);
  assert.match(mainActivity, /setCanceledOnTouchOutside\(true\)/u);
  assert.match(mainActivity, /qrDialogBack/u);
  assert.match(mainActivity, /qrDialogDownload/u);
});

test('shows the QR in a measured square view to avoid rectangular display', async () => {
  const qrDialog = await read('../android/app/src/main/res/layout/dialog_qr.xml');
  const qrBackground = await read('../android/app/src/main/res/drawable/qr_display_background.xml');
  assert.match(qrDialog, /<com\.alice\.partidascrevillente\.QrSquareImageView/u);
  assert.match(qrDialog, /android:layout_width="match_parent"/u);
  assert.match(qrDialog, /android:layout_height="wrap_content"/u);
  assert.match(qrDialog, /android:maxHeight="320dp"/u);
  assert.match(qrDialog, /android:maxWidth="320dp"/u);
  assert.match(qrDialog, /android:layout_gravity="center_horizontal"/u);
  assert.match(qrDialog, /android:adjustViewBounds="true"/u);
  assert.doesNotMatch(qrDialog, /<ImageView/u);
  assert.match(qrDialog, /@drawable\/qr_display_background/u);
  assert.match(qrDialog, /android:clipToOutline="true"/u);
  assert.match(qrBackground, /<corners android:radius="16dp"/u);
  assert.match(qrSquareImageView, /class QrSquareImageView/u);
  assert.match(qrSquareImageView, /override fun onMeasure/u);
  assert.match(qrSquareImageView, /setMeasuredDimension\(size, size\)/u);
});

test('uses the styled manual-installation warning only for the web fallback', () => {
  assert.doesNotMatch(mainActivity, /AlertDialog\.Builder/u);
  assert.match(mainActivity, /private fun showWebDownloadWarning/u);
  assert.match(mainActivity, /setContentView\(R\.layout\.dialog_manual_install\)/u);
  assert.match(mainActivity, /manualInstallDialogRoot/u);
  assert.match(mainActivity, /panel_bg_dark/u);
  assert.match(mainActivity, /panel_bg_light/u);
  assert.match(manualInstallDialog, /@string\/manual_install_message/u);
  assert.match(manualInstallDialog, /@drawable\/primary_button_bg/u);
  assert.match(strings, /Tras la descarga tendrás que instalar la aplicación manualmente desde la carpeta de Descargas\./u);
});

test('shows the current app version at the bottom right', () => {
  assert.match(activityLayout, /@\+id\/versionText/u);
  assert.match(activityLayout, /android:layout_marginEnd="24dp"/u);
  assert.match(mainActivity, /versionText\.text\s*=\s*"v\$\{BuildConfig\.VERSION_NAME\}"/u);
  assert.match(mainActivity, /versionText\.setTextColor\(Color\.WHITE\)/u);
  assert.match(mainActivity, /versionText\.setTextColor\(Color\.BLACK\)/u);
});

test('matches the Android navigation bar to the selected theme', () => {
  assert.match(mainActivity, /window\.navigationBarColor\s*=\s*Color\.BLACK/u);
  assert.match(mainActivity, /isAppearanceLightNavigationBars\s*=\s*false/u);
  assert.match(mainActivity, /isAppearanceLightNavigationBars\s*=\s*true/u);
});
