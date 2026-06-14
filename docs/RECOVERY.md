# Recuperación del proyecto

## Qué recupera GitHub

Al clonar el repositorio se recuperan:

- La aplicación web y su configuración de Cloudflare.
- El proyecto Android completo y el Gradle Wrapper.
- Los datasets.
- La APK histórica y el material de ingeniería inversa.
- La documentación y el historial de código.

Las GitHub Releases recuperan las APK exactas que se distribuyeron en cada versión.

## Qué no recupera GitHub

GitHub no contiene:

- `signing/release-keystore.jks`
- `signing/keystore.properties`
- Cachés de Gradle o Node.
- Builds temporales.

Los dos archivos de firma deben mantenerse juntos en una copia privada cifrada. La copia debe poder abrirse y su huella debe comprobarse periódicamente.

## Restaurar en un Windows nuevo

1. Instala Git, Node.js 20, JDK 17 y Android SDK 35 con Build Tools 35.0.0.
2. Clona el repositorio.
3. Ejecuta `npm install` y `npm test`.
4. Restaura los dos archivos privados dentro de `signing/`.
5. Configura `ANDROID_HOME`.
6. Ejecuta desde `android/`:

```powershell
./gradlew.bat signingReport
./gradlew.bat testDebugUnitTest
./gradlew.bat assembleRelease
```

7. Verifica que el certificado release tiene SHA-256:

```text
D3:46:33:BC:EC:7D:03:34:83:EA:92:92:EB:8E:4E:4C:
B9:E7:A7:23:A2:88:C7:30:C9:63:25:2E:F7:FB:38:D9
```

## Copias recomendadas

Mantén como mínimo:

- Repositorio remoto en GitHub.
- APK publicadas en GitHub Releases.
- Una copia cifrada de `release-keystore.jks` y `keystore.properties` fuera del ordenador principal.
- Una segunda copia cifrada en otro soporte o ubicación.

No basta con conservar el certificado público de una APK: las actualizaciones oficiales requieren la clave privada original y sus contraseñas.
