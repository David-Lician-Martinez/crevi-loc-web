package com.komeet.godemarcacion.crevillente;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.DownloadManager;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends Activity {
    String nuevaversion;
    String versionactual;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(R.layout.activity_main);
        final WebView webview = (WebView) findViewById(R.id.webView1);
        final TextView textoversion = (TextView) findViewById(R.id.textoversion);
        try {
            this.versionactual = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
        }
        SharedPreferences prefs = getSharedPreferences("opciones", 0);
        Boolean buscaractualizaciones = Boolean.valueOf(prefs.getBoolean("buscaractualizaciones", true));
        if (buscaractualizaciones.booleanValue()) {
            textoversion.setText("Comprobando actualizaciones...");
            webview.clearCache(true);
            webview.setWebViewClient(new WebViewClient() { // from class: com.komeet.godemarcacion.crevillente.MainActivity.1
                @Override // android.webkit.WebViewClient
                public void onPageFinished(WebView view, String url) {
                    super.onPageFinished(webview, url);
                    String data = webview.getTitle();
                    try {
                        JSONObject json = new JSONObject(data);
                        MainActivity.this.nuevaversion = json.getString("versionName");
                        if (!MainActivity.this.versionactual.equalsIgnoreCase(MainActivity.this.nuevaversion)) {
                            textoversion.setText("Actualización disponible v" + MainActivity.this.nuevaversion);
                            MainActivity.this.actualizar(MainActivity.this.nuevaversion, json.getString("mejoras"));
                        } else {
                            textoversion.setText("v" + MainActivity.this.versionactual);
                        }
                    } catch (JSONException e2) {
                        e2.printStackTrace();
                    }
                }
            });
            webview.loadUrl("http://www.komeet.org/godemarcacion/partidascrevillente/autoupdate_info.php");
            return;
        }
        textoversion.setText("v" + this.versionactual);
    }

    public void buscar_vivienda(View v) {
        startActivity(new Intent(this, (Class<?>) BuscarVivienda.class));
        overridePendingTransition(R.anim.left_in, R.anim.left_out);
    }

    @TargetApi(11)
    public void actualizar(final String s, String h) {
        AlertDialog.Builder dialogo1 = new AlertDialog.Builder(this);
        dialogo1.setTitle("Actualización encontrada");
        dialogo1.setMessage("Se ha encontrado una nueva actualización.\n\nMEJORAS:\n" + h.replace("-", "\n-") + "\n\nQuieres actualizar?");
        dialogo1.setCancelable(false);
        dialogo1.setPositiveButton("Actualizar ahora", new DialogInterface.OnClickListener() { // from class: com.komeet.godemarcacion.crevillente.MainActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogo12, int id) {
                DownloadManager.Request r = new DownloadManager.Request(Uri.parse("http://www.komeet.org/godemarcacion/partidascrevillente/app" + s + ".apk"));
                r.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, "ACTUALIZAR GoDemarcacion" + s + ".apk");
                r.allowScanningByMediaScanner();
                r.setNotificationVisibility(1);
                DownloadManager dm = (DownloadManager) MainActivity.this.getSystemService("download");
                dm.enqueue(r);
            }
        });
        dialogo1.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() { // from class: com.komeet.godemarcacion.crevillente.MainActivity.3
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogo12, int id) {
                dialogo12.cancel();
            }
        });
        dialogo1.show();
    }

    public void opciones(View v) {
        startActivity(new Intent(this, (Class<?>) OpcionesActivity.class));
        overridePendingTransition(R.anim.left_in, R.anim.left_out);
    }

    public void ayuda(View v) {
        startActivity(new Intent(this, (Class<?>) AyudaActivity.class));
        overridePendingTransition(R.anim.left_in, R.anim.left_out);
    }
}
