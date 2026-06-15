# Estado actual de Crevi Loc

Última actualización documentada: 2026-06-15.

Este documento resume cómo ha quedado organizada y funcionando la aplicación después de la recuperación del proyecto, la separación web/Android y las sucesivas actualizaciones publicadas.

## Versión actual publicada

La APK publica actual es:

- `versionCode`: `12`
- `versionName`: `1.0.11`
- Ruta pública: `public/downloads/crevi-loc.apk`
- Metadata de actualización: `public/update.json`

`update.json` apunta siempre a la APK pública de Cloudflare con un parámetro `?v=<versionCode>` para evitar cachés antiguas.

Mientras sigamos corrigiendo detalles del QR, las notas de actualización deben mencionar también las partidas añadidas:

```text
Cañada Juana y Peña Sendra
```

## Estructura general

El repositorio combina tres ámbitos:

- `public/`, `src/`, `index.html` y la configuración Vite/Cloudflare forman la web.
- `android/` contiene la app Android nativa mantenible.
- `legacy/`, `assets/`, `docs/` y `signing/` contienen material de soporte, recuperación, firma y documentación.

Cloudflare solo publica el build web generado en `dist/`. En la práctica eso incluye los archivos estáticos procedentes de `public/`, especialmente:

- `public/downloads/crevi-loc.apk`
- `public/downloads/crevi-loc-web-qr.png`
- `public/update.json`
- `public/partidas.clean.json`
- `public/partidas.list.txt`

Todo lo que está fuera de `public/` no se publica como archivo estático en Cloudflare.

## Datos de ubicaciones

La web y Android comparten el mismo catálogo base:

- `public/partidas.clean.json`
- `public/partidas.list.txt`
- `android/app/src/main/assets/partidas.clean.json`
- `android/app/src/main/assets/partidas.list.txt`

Se añadieron las partidas `CAÑADA JUANA` y `PEÑA SENDRA`.

Decisión de normalización:

- Los nombres visibles conservan la `ñ`.
- Las claves internas son ASCII y estables: `canyada_juana` y `penya_sendra`.
- Las búsquedas normalizan `ñ` como `ny`, de forma que el usuario puede escribir con la ortografía española y el sistema sigue encontrando la clave interna.

Esto evita problemas entre sistemas, rutas, codificaciones o herramientas que puedan tratar peor caracteres no ASCII, sin perder la ortografía visible para el usuario.

## Web

La web permite:

- Buscar partida, número y letra opcional.
- Abrir el resultado exacto en Google Maps.
- Compartir la ubicación.
- Descargar la APK Android.
- Mostrar el QR de la web en una ventana modal.
- Descargar el QR desde esa ventana.

Los enlaces inferiores de la web son:

- `Descarga la App`
- `Mostrar QR Web`

El QR de la web se muestra en un modal centrado. El modal se puede cerrar con `Atrás` o clicando fuera, y el botón `Descargar QR` descarga el PNG normal y cuadrado.

## Android

La app Android nativa está en `android/` y usa Kotlin.

La pantalla principal incluye:

- Selector de tema claro/oscuro.
- Enlace `Compartir App` arriba a la derecha del bloque principal.
- Título `Partidas Crevillente`.
- Buscador de partida, número y letra opcional.
- Botón `Buscar`.
- Enlaces inferiores:
  - `Accede a la Web`
  - `Mostrar QR Web`
- Versión actual en pequeño, abajo a la derecha de la pantalla.

Se quitó la línea horizontal que estaba sobre los enlaces inferiores para compactar la zona baja.

### QR en Android

El QR se muestra en `dialog_qr.xml`.

Después de varios intentos con un `ImageView` estándar, se dejó una vista propia:

```kotlin
QrSquareImageView
```

Motivo:

- `ImageView` con `match_parent`, `wrap_content`, `maxWidth` y `maxHeight` puede acabar midiendo un rectángulo ancho y bajo.
- Eso deformaba visualmente el marco blanco del QR.
- `QrSquareImageView` fuerza una medición cuadrada con `setMeasuredDimension(size, size)`.

Esta es la decisión estable para el QR: mantener una caja cuadrada medida por código y no volver a depender de combinaciones frágiles de atributos XML.

La descarga del QR sigue usando el PNG original cuadrado. El redondeado solo afecta a la presentación dentro del modal.

### Compartir App

El enlace `Compartir App` prepara una copia temporal de la APK instalada desde `applicationInfo.sourceDir` y lanza un `Intent.ACTION_SEND`.

Esto permite compartir la app por las aplicaciones disponibles del dispositivo, por ejemplo WhatsApp, Bluetooth u otras opciones del sistema, sin depender estrictamente de la web.

## Flujo de actualización Android

La app consulta:

```text
https://crevi-loc-web.pages.dev/update.json
```

Si `versionCode` remoto es mayor que el instalado, muestra la ventana de actualización.

Flujo principal:

1. El usuario pulsa `Actualizar`.
2. La APK se descarga al almacenamiento privado/cache de la app.
3. La app abre el instalador de Android para que el usuario confirme manualmente la instalación.
4. Tras instalarse, la app limpia APK temporales antiguas.

Flujo de instalación pendiente:

- Si el usuario cancela el instalador o vuelve atrás, la app recuerda que hay una instalación pendiente.
- Al volver a la app, si la APK sigue en caché, ofrece continuar la instalación.
- Si la APK temporal ya no existe, ofrece descargar la actualización de nuevo.

Fallback web:

- Si la descarga privada desde la app falla, se ofrece `Descargar desde la web`.
- En ese caso sí se muestra el aviso de instalación manual desde la carpeta de Descargas.
- La descarga web usa el navegador/sistema y queda en Descargas.

La ventana antigua que avisaba siempre de instalar desde Descargas se retiró del flujo normal, porque ya no describe lo que ocurre cuando la app descarga en su caché privado.

## Firma y releases

La firma oficial está fuera de Git:

- `signing/release-keystore.jks`
- `signing/keystore.properties`

Estos archivos son necesarios para publicar actualizaciones que Android acepte como oficiales. Deben mantenerse en copias privadas cifradas.

La huella SHA-256 del certificado oficial verificado es:

```text
d34633bcec7d033483ea9292eb8e4e4cb9e7a723a288c730c963252ef7fb38d9
```

La APK actual de Cloudflare se mantiene en `public/downloads/crevi-loc.apk`. Las APK anteriores se conservan como activos de GitHub Releases, por ejemplo:

- `v1.0.8`
- `v1.0.9`
- `v1.0.10`

Así el repositorio no acumula APK históricas en cada commit, pero sigue habiendo recuperación exacta de binarios publicados.

## Flujo de publicación esperado

Para cada nueva APK:

1. Incrementar `versionCode` y `versionName` en `android/app/build.gradle.kts`.
2. Actualizar `public/update.json`.
3. Asegurar que las notas incluyen los cambios relevantes. Mientras dure esta fase, mencionar `Cañada Juana y Peña Sendra`.
4. Ejecutar pruebas.
5. Compilar `assembleRelease`.
6. Verificar paquete, versión y firma.
7. Archivar la APK pública anterior en GitHub Releases si aún no existe.
8. Copiar la nueva APK a `public/downloads/crevi-loc.apk`.
9. Commit y push.
10. Verificar Cloudflare:
    - `update.json` remoto.
    - hash remoto de la APK igual al hash local.

Comandos habituales:

```powershell
node --test tests\android-release.test.mjs

$sdkRoot = 'C:\Users\David\AppData\Local\Android\Sdk'
$env:ANDROID_HOME = $sdkRoot
$env:ANDROID_SDK_ROOT = $sdkRoot
$env:Path = "$sdkRoot\platform-tools;$sdkRoot\cmdline-tools\latest\bin;$env:Path"
cd android
.\gradlew.bat :app:testDebugUnitTest :app:assembleRelease
cd ..
```

## Verificaciones actuales

En la última publicación se verificó:

- Tests Node: `16/16`.
- Gradle: `:app:testDebugUnitTest :app:assembleRelease`.
- APK pública: `versionCode='12'`, `versionName='1.0.11'`.
- Firma v2 válida con el certificado oficial.
- Cloudflare sirviendo `update.json` y APK `1.0.11`.
- Hash local/remoto coincidente para la APK.

## Decisiones importantes

- `public/` es la frontera de lo que Cloudflare publica.
- El proyecto Android completo vive en el repo, pero no se publica en Cloudflare.
- Los secretos de firma viven localmente y no en GitHub.
- Las APK históricas se conservan en GitHub Releases.
- El QR mostrado en Android debe usar `QrSquareImageView`.
- El QR descargado debe seguir siendo el PNG cuadrado normal.
- `Accede a la Web` solo abre la web; no debe provocar descarga automática de la app.
- La app puede compartir su propia APK instalada mediante `Compartir App`.
- La descarga normal de actualizaciones usa caché privado de la app y abre el instalador Android.
- La descarga desde web queda como fallback y usa Descargas.
