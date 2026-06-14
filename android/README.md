# Aplicación Android

Este directorio contiene el proyecto Android nativo y mantenible de **Crevi Loc**. Fue reconstruido en Kotlin a partir de los datos recuperados de la aplicación histórica conservada en [`../legacy`](../legacy/README.md).

## Requisitos en Windows

- JDK 17
- Android SDK Platform 35
- Android Build Tools 35.0.0
- `ANDROID_HOME` apuntando al SDK
- Firma local preparada según [`../signing/README.md`](../signing/README.md) para generar releases oficiales

El Gradle Wrapper incluido fija Gradle 8.10.2; no hace falta instalar otra versión de Gradle para usar el proyecto.

## Compilar y probar

Desde PowerShell:

```powershell
cd android
./gradlew.bat testDebugUnitTest
./gradlew.bat assembleDebug
```

La APK debug se genera bajo `android/app/build/outputs/apk/debug/` y utiliza la firma debug local. No puede actualizar una instalación oficial.

## Crear una actualización oficial

1. Modifica `versionCode` y `versionName` en `app/build.gradle.kts`. Cada publicación debe usar un `versionCode` mayor que el anterior.
2. Ejecuta las pruebas.
3. Genera la release:

```powershell
cd android
./gradlew.bat clean testDebugUnitTest assembleRelease
```

4. Verifica que la APK está firmada con el certificado oficial:

```powershell
& "$env:ANDROID_HOME\build-tools\35.0.0\apksigner.bat" verify --verbose --print-certs `
  "app\build\outputs\apk\release\crevi-loc.apk"
```

La huella SHA-256 debe coincidir con la documentada en [`../signing/README.md`](../signing/README.md).

5. Sigue el flujo completo descrito en [`../docs/RELEASE_PROCESS.md`](../docs/RELEASE_PROCESS.md).

## Datos compartidos

La aplicación incluye copias empaquetadas de:

- `app/src/main/assets/partidas.clean.json`
- `app/src/main/assets/partidas.list.txt`

Cuando cambie el catálogo web, hay que sincronizar estos archivos antes de publicar una APK nueva.

## Archivos que no se versionan

Gradle genera `.gradle/`, `.kotlin/` y `app/build/`; todos están ignorados. Las APK históricas se publican como activos de GitHub Releases, no dentro del historial Git.
