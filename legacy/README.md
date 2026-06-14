# Aplicación histórica y reconstrucción

Este directorio conserva el origen documental de Crevi Loc.

## `base.apk`

Es la aplicación Android histórica proporcionada por el propietario del proyecto:

- Paquete: `com.komeet.godemarcacion.crevillente`
- Versión: `2.05`
- `versionCode`: `205`
- SHA-256 del archivo: `6402cc4f6f24057da0f39ec59e2193bed33c0ef6ca8012f703147872d98d31b9`
- SHA-256 del certificado: `bc81c68cdcf83b201912a7361897de6859bf57c137621892abf74d489a857622`

Se guarda como evidencia y punto de recuperación. No es el código fuente mantenible de Crevi Loc ni se publica en Cloudflare.

## `reverse-engineering/`

Contiene los artefactos útiles recuperados durante el análisis original:

- `apktool_decode/`: recursos y smali reconstruidos por Apktool.
- `base_extracted/`: contenido extraído directamente del APK histórico.
- `jadx_out/`: fuentes Java aproximadas y recursos obtenidos con JADX.
- `output/`: documentación de reconstrucción y datasets generados.
- `partidas_extracted.json`: extracción inicial del catálogo.

El código decompilado puede ser incompleto o impreciso. Se conserva como referencia histórica; cualquier cambio futuro debe hacerse en [`../android`](../android/README.md).

Las herramientas JADX y Apktool no se guardan aquí porque son dependencias descargables y añadirían decenas de megabytes sin mejorar la recuperación del proyecto.
