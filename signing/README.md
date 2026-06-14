# Firma de publicación

Esta carpeta contiene, solo en cada máquina autorizada, los secretos necesarios para firmar actualizaciones oficiales de Crevi Loc.

Archivos locales esperados:

- `release-keystore.jks`
- `keystore.properties`

[`keystore.properties.example`](keystore.properties.example) documenta el formato sin contener credenciales reales.

Ambos están excluidos de Git y nunca deben copiarse a `public/`, GitHub, Cloudflare, una incidencia o un mensaje. El certificado oficial tiene esta huella SHA-256:

```text
D3:46:33:BC:EC:7D:03:34:83:EA:92:92:EB:8E:4E:4C:
B9:E7:A7:23:A2:88:C7:30:C9:63:25:2E:F7:FB:38:D9
```

Debe existir al menos una copia de seguridad privada, cifrada y probada de los dos archivos. Perder el keystore o sus contraseñas impediría publicar actualizaciones instalables sobre la aplicación actual.

Consulta [`docs/RECOVERY.md`](../docs/RECOVERY.md) para el procedimiento de recuperación.
