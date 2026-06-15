import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const read = (path) => readFile(new URL(path, import.meta.url), 'utf8').catch(() => '');

const [gradle, mainActivity, manifest, activityLayout, compactLinks, regularLinks, manualInstallDialog, strings, updateJson] = await Promise.all([
  read('../android/app/build.gradle.kts'),
  read('../android/app/src/main/java/com/alice/partidascrevillente/MainActivity.kt'),
  read('../android/app/src/main/AndroidManifest.xml'),
  read('../android/app/src/main/res/layout/activity_main.xml'),
  read('../android/app/src/main/res/layout/web_links.xml'),
  read('../android/app/src/main/res/layout-sw341dp/web_links.xml'),
  read('../android/app/src/main/res/layout/dialog_manual_install.xml'),
  read('../android/app/src/main/res/values/strings.xml'),
  read('../public/update.json'),
]);

test('configures Android release 1.0.4 with version code 5', () => {
  assert.match(gradle, /versionCode\s*=\s*5/u);
  assert.match(gradle, /versionName\s*=\s*"1\.0\.4"/u);
});

test('includes web links that only stack on truly small Android screens', () => {
  assert.match(activityLayout, /layout="@layout\/web_links"/u);
  assert.match(compactLinks, /android:orientation="vertical"/u);
  assert.match(regularLinks, /android:orientation="horizontal"/u);
  assert.match(strings, /<string name="access_web">Accede a la Web<\/string>/u);
  assert.match(strings, /<string name="show_web_qr">Mostrar QR Web<\/string>/u);
});

test('downloads the QR into the public Downloads directory', () => {
  assert.match(mainActivity, /DownloadManager\.Request/u);
  assert.match(mainActivity, /setDestinationInExternalPublicDir\(\s*Environment\.DIRECTORY_DOWNLOADS/u);
  assert.match(manifest, /WRITE_EXTERNAL_STORAGE/u);
});

test('publishes update metadata for Android 1.0.4', () => {
  const update = JSON.parse(updateJson);
  assert.equal(update.versionCode, 5);
  assert.equal(update.versionName, '1.0.4');
  assert.equal(update.apkUrl, 'https://crevi-loc-web.pages.dev/downloads/crevi-loc.apk?v=5');
  assert.equal(
    update.notes,
    'Mejorado el desplazamiento inferior para facilitar el acceso a los enlaces web',
  );
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

test('rounds only the displayed QR container', async () => {
  const qrDialog = await read('../android/app/src/main/res/layout/dialog_qr.xml');
  const qrBackground = await read('../android/app/src/main/res/drawable/qr_display_background.xml');
  assert.match(qrDialog, /@drawable\/qr_display_background/u);
  assert.match(qrDialog, /android:clipToOutline="true"/u);
  assert.match(qrBackground, /<corners android:radius="16dp"/u);
});

test('explains manual installation before downloading an update', () => {
  assert.doesNotMatch(mainActivity, /AlertDialog\.Builder/u);
  assert.match(mainActivity, /setContentView\(R\.layout\.dialog_manual_install\)/u);
  assert.match(mainActivity, /manualInstallDialogRoot/u);
  assert.match(mainActivity, /panel_bg_dark/u);
  assert.match(mainActivity, /panel_bg_light/u);
  assert.match(manualInstallDialog, /@string\/manual_install_message/u);
  assert.match(manualInstallDialog, /@drawable\/primary_button_bg/u);
  assert.match(strings, /Tras descargarse la aplicación, deberás instalarla manualmente desde la carpeta de Descargas\./u);
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
