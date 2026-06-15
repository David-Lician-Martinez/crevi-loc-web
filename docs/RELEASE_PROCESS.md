# Publicar una nueva versión Android

Este procedimiento mantiene coordinados Android, GitHub Releases, la web de Cloudflare y el endpoint de actualización.

## 1. Preparar el proyecto

Trabaja en `android/` y sincroniza el catálogo cuando hayan cambiado los datos web:

```powershell
Copy-Item public\partidas.clean.json android\app\src\main\assets\partidas.clean.json -Force
Copy-Item public\partidas.list.txt android\app\src\main\assets\partidas.list.txt -Force
```

Modifica en `android/app/build.gradle.kts`:

```kotlin
versionCode = 2
versionName = "1.1.0"
```

`versionCode` debe ser un entero estrictamente mayor que el de cualquier APK publicada. Android y `update.json` utilizan ese valor para decidir si existe una actualización.

## 2. Probar y compilar

```powershell
cd android
./gradlew.bat clean testDebugUnitTest assembleRelease
cd ..
```

La salida esperada es:

```text
android/app/build/outputs/apk/release/crevi-loc.apk
```

## 3. Verificar identidad y firma

```powershell
$apk = "android\app\build\outputs\apk\release\crevi-loc.apk"
& "$env:ANDROID_HOME\build-tools\35.0.0\aapt.exe" dump badging $apk
& "$env:ANDROID_HOME\build-tools\35.0.0\apksigner.bat" verify --verbose --print-certs $apk
```

Comprueba:

- Paquete: `com.alice.partidascrevillente`
- `versionCode` y `versionName`: los valores nuevos
- Certificado SHA-256: `d34633bcec7d033483ea9292eb8e4e4cb9e7a723a288c730c963252ef7fb38d9`

No publiques una APK si cualquiera de esos valores es incorrecto.

## 4. Conservar el binario publicado

Cada versión distribuida debe tener:

- Un commit con el código que la generó.
- Un tag, por ejemplo `v1.1.0`.
- Una GitHub Release asociada al tag.
- La APK exacta adjunta como `crevi-loc-1.1.0.apk`.
- El metadata de fallback adjunto como `crevi-loc-update.json`.

Antes de sustituir la APK de Cloudflare, comprueba que la versión anterior ya está conservada en su GitHub Release. Si no lo está, descarga o copia primero `public/downloads/crevi-loc.apk` y adjúntala a la release correspondiente.

No guardes el histórico en `android/archive/` como sustituto de GitHub Releases. Esa carpeta está ignorada y solo sirve para trabajo local temporal.

## 5. Preparar Cloudflare

Copia la nueva APK sobre la única APK pública:

```powershell
Copy-Item `
  android\app\build\outputs\apk\release\crevi-loc.apk `
  public\downloads\crevi-loc.apk `
  -Force
```

Actualiza `public/update.json`:

```json
{
  "versionCode": 2,
  "versionName": "1.1.0",
  "apkUrl": "https://crevi-loc-web.pages.dev/downloads/crevi-loc.apk?v=2",
  "notes": "Resumen breve de los cambios",
  "minSupportedVersionCode": 1,
  "publishedAt": "2026-06-14T18:00:00Z"
}
```

El parámetro `?v=2` debe cambiar con cada publicación para evitar cachés. `publishedAt` usa UTC en formato ISO 8601.

Prepara también `release-assets/crevi-loc-update.json` para GitHub Releases. Este archivo no debe apuntar a Cloudflare; debe apuntar al nombre del asset APK dentro de la propia release:

```json
{
  "versionCode": 2,
  "versionName": "1.1.0",
  "apkAssetName": "crevi-loc-1.1.0.apk",
  "notes": "Resumen breve de los cambios",
  "minSupportedVersionCode": 1,
  "publishedAt": "2026-06-14T18:00:00Z"
}
```

La app usa este archivo solo si falla `https://crevi-loc-web.pages.dev/update.json`. En ese caso consulta la última release pública de GitHub, descarga `crevi-loc-update.json`, busca el asset `apkAssetName` y descarga esa APK.

## 6. Verificar la web

```powershell
npm test
npm run build
```

Comprueba que existen:

```text
dist/downloads/crevi-loc.apk
dist/downloads/crevi-loc-web-qr.png
dist/update.json
```

## 7. Commit, tag y despliegue

Incluye en el commit el código, los cambios de versión, `public/update.json` y la APK pública nueva. No incluyas archivos de `signing/` ni builds de Gradle.

Después de revisar y subir el commit:

1. Crea el tag de versión.
2. Crea la GitHub Release y adjunta la APK exacta y `crevi-loc-update.json`.
3. Deja que Cloudflare Pages despliegue `dist` desde `main`.
4. Prueba la descarga web y la detección de actualización desde una instalación anterior.

## Reversión

No reduzcas `versionCode`: Android no instalará una versión inferior como actualización. Para corregir una publicación defectuosa, restaura el código deseado, incrementa de nuevo `versionCode`, genera otra APK firmada y publícala como una versión nueva.
