# Crevi Loc

Repositorio principal de Crevi Loc. Reúne la web desplegada en Cloudflare Pages, el proyecto Android nativo, la aplicación histórica de la que se recuperaron los datos y la documentación necesaria para publicar y recuperar el sistema.

El repositorio está preparado para trabajar desde Windows sin depender de la máquina virtual donde se reconstruyó originalmente la aplicación.

## Qué contiene

```text
.
|-- android/                 # Proyecto Android nativo en Kotlin
|-- assets/                  # Fuentes gráficas que no se publican directamente
|-- docs/                    # Publicación, recuperación y planes técnicos
|-- legacy/                  # APK histórica y material de ingeniería inversa
|-- public/                  # Archivos estáticos que Vite copia al despliegue
|   |-- downloads/
|   |   |-- crevi-loc.apk            # Única APK distribuida por Cloudflare
|   |   `-- crevi-loc-web-qr.png     # QR descargable de la web
|   |-- partidas.clean.json
|   |-- partidas.list.txt
|   `-- update.json
|-- signing/                 # Firma oficial local; secretos ignorados por Git
|-- src/                     # JavaScript y CSS de la web
|-- tests/                   # Pruebas de la web
|-- index.html
|-- package.json
|-- vite.config.js
`-- wrangler.toml
```

## Separación de responsabilidades

### Cloudflare Pages

Cloudflare publica únicamente la carpeta `dist/` generada por Vite. El build incluye:

- `index.html` y los módulos utilizados desde `src/`.
- Todo el contenido de `public/`.
- La APK actual en `public/downloads/crevi-loc.apk`.
- El QR descargable de la web.

Cloudflare no recibe `android/`, `legacy/`, `assets/`, `docs/` ni `signing/`.

### Git y GitHub

GitHub conserva el código web, el proyecto Android, la APK histórica, la documentación y el historial de cambios. Las APK publicadas se adjuntan además a GitHub Releases para conservar el binario exacto sin acumular versiones dentro del historial Git.

GitHub no recibe el keystore ni sus contraseñas.

### Ordenador local

La carpeta `signing/` contiene localmente la clave y configuración necesarias para generar una actualización oficial. Estos archivos están ignorados por Git y necesitan una copia de seguridad privada y cifrada.

## Aplicación web

La web permite buscar una partida, número y letra opcional, mostrar coordenadas, abrir Google Maps y compartir la ubicación. También ofrece enlaces para descargar la aplicación Android y el QR imprimible de la página.

```powershell
npm install
npm test
npm run dev
```

Build de producción:

```powershell
npm run build
```

La salida queda en `dist/`. Configuración de Cloudflare Pages:

- Production branch: `main`
- Build command: `npm run build`
- Build output directory: `dist`
- Node.js: 20

## Aplicación Android

El proyecto mantenible está en [`android/`](android/README.md). Usa el mismo catálogo de ubicaciones que la web y consulta `https://crevi-loc-web.pages.dev/update.json` para detectar nuevas versiones.

Los nombres visibles conservan la ortografía española, por ejemplo `CAÑADA JUANA` y `PEÑA SENDRA`. Las claves internas permanecen en ASCII (`canyada_juana` y `penya_sendra`) para ser estables entre sistemas; web y Android convierten `ñ` a `ny` antes de consultar el catálogo.

La APK distribuida actualmente se encuentra en [`public/downloads/crevi-loc.apk`](public/downloads/crevi-loc.apk). Esa ruta debe contener una sola APK para mantener reducido el despliegue gratuito de Cloudflare.

El estado funcional actual de la web, la app Android, el QR, el flujo de actualizaciones y las decisiones de diseño está resumido en [`docs/CURRENT_STATE.md`](docs/CURRENT_STATE.md).

## Publicar una actualización

El procedimiento completo está en [`docs/RELEASE_PROCESS.md`](docs/RELEASE_PROCESS.md). En resumen:

1. Sincronizar datos y modificar el código Android.
2. Incrementar `versionCode` y `versionName`.
3. Ejecutar pruebas y compilar una release firmada.
4. Verificar la firma oficial.
5. Conservar el binario exacto mediante una GitHub Release.
6. Sustituir `public/downloads/crevi-loc.apk` por la nueva APK.
7. Actualizar `public/update.json`.
8. Probar el build web, hacer commit y desplegar.

## Recuperación

Consulta [`docs/RECOVERY.md`](docs/RECOVERY.md). GitHub permite recuperar todo salvo los secretos de firma, que deben restaurarse desde una copia privada.

## Aplicación histórica

[`legacy/`](legacy/README.md) contiene `base.apk`, sus recursos extraídos, código decompilado y documentación de reconstrucción. Se conserva para trazabilidad; el desarrollo actual se realiza exclusivamente en `android/`.

## Licencia

El código propio del repositorio se distribuye bajo la licencia MIT indicada en [LICENSE](LICENSE). La aplicación histórica y sus recursos se conservan como material de referencia del propietario del proyecto.
