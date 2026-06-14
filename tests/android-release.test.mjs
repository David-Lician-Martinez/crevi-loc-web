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

test('configures Android release 1.0.1 with version code 2', () => {
  assert.match(gradle, /versionCode\s*=\s*2/u);
  assert.match(gradle, /versionName\s*=\s*"1\.0\.1"/u);
});

test('includes web links that only stack on truly small Android screens', () => {
  assert.match(activityLayout, /layout="@layout\/web_links"/u);
  assert.match(compactLinks, /android:orientation="vertical"/u);
  assert.match(regularLinks, /android:orientation="horizontal"/u);
  assert.match(strings, /<string name="access_web">Accede a la Web<\/string>/u);
  assert.match(strings, /<string name="download_web_qr">Descarga el QR Web<\/string>/u);
});

test('downloads the QR into the public Downloads directory', () => {
  assert.match(mainActivity, /DownloadManager\.Request/u);
  assert.match(mainActivity, /setDestinationInExternalPublicDir\(\s*Environment\.DIRECTORY_DOWNLOADS/u);
  assert.match(manifest, /WRITE_EXTERNAL_STORAGE/u);
});

test('publishes update metadata for Android 1.0.1', () => {
  const update = JSON.parse(updateJson);
  assert.equal(update.versionCode, 2);
  assert.equal(update.versionName, '1.0.1');
  assert.equal(update.apkUrl, 'https://crevi-loc-web.pages.dev/downloads/crevi-loc.apk?v=2');
  assert.equal(
    update.notes,
    'Añadidas partidas Cañada Juana y Peña Sendra y facilitación del acceso a la web',
  );
});
