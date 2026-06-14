package com.komeet.godemarcacion.crevillente;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;

/* JADX INFO: loaded from: classes.dex */
public class AyudaActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(R.layout.activity_ayuda);
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode != 4) {
            return super.onKeyDown(keyCode, event);
        }
        finish();
        overridePendingTransition(R.anim.right_in, R.anim.right_out);
        return true;
    }

    public void cerrar(View v) {
        finish();
        overridePendingTransition(R.anim.right_in, R.anim.right_out);
    }

    public void enviaramigo(View v) {
        Intent sendIntent = new Intent();
        sendIntent.setAction("android.intent.action.SEND");
        sendIntent.putExtra("android.intent.extra.TEXT", "Go! Demarcación\nPartidas Crevillente\n\nhttp://www.komeet.org/godemarcacion/partidascrevillente/app.apk\n\nDescargatela ya!");
        sendIntent.setType("text/plain");
        startActivity(sendIntent);
    }
}
