import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

const read = (path) => readFile(new URL(path, import.meta.url), 'utf8').catch(() => '');

const [gradle, mainActivity, manifest, activityLayout, compactLinks, regularLinks, strings, updateJson] = await Promise.all([
  read('../android/app/build.gradle.kts'),
  read('../android/app/src/main/java/com/alice/partidascrevillente/MainActivity.kt'),
  read('../android/app/src/main/AndroidManifest.xml'),
  read('../android/app/src/main/res/layout/activity_main.xml'),
  read('../android/app/src/main/res/layout/web_links.xml'),
  read('../android/app/src/main/res/layout-sw341dp/web_links.xml'),
  read('../android/app/src/main/res/values/strings.xml'),
  read('../public/update.json'),
]);

test('configures Android release 1.0.3 with version code 4', () => {
  assert.match(gradle, /versionCode\s*=\s*4/u);
  assert.match(gradle, /versionName\s*=\s*"1\.0\.3"/u);
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

test('publishes update metadata for Android 1.0.3', () => {
  const update = JSON.parse(updateJson);
  assert.equal(update.versionCode, 4);
  assert.equal(update.versionName, '1.0.3');
  assert.equal(update.apkUrl, 'https://crevi-loc-web.pages.dev/downloads/crevi-loc.apk?v=4');
  assert.equal(
    update.notes,
    'Añadida la visualización del QR Web y corregido el acceso a la web',
  );
});

test('shows the QR in an Android dialog with explicit back and download actions', () => {
  assert.match(mainActivity, /setContentView\(R\.layout\.dialog_qr\)/u);
  assert.match(mainActivity, /setCanceledOnTouchOutside\(true\)/u);
  assert.match(mainActivity, /qrDialogBack/u);
  assert.match(mainActivity, /qrDialogDownload/u);
});

test('explains manual installation before downloading an update', () => {
  assert.match(mainActivity, /AlertDialog\.Builder/u);
  assert.match(mainActivity, /manual_install_message/u);
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
