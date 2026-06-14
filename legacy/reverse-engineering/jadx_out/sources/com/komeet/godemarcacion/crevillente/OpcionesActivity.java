package com.komeet.godemarcacion.crevillente;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.CheckBox;
import android.widget.RadioButton;
import android.widget.RadioGroup;

/* JADX INFO: loaded from: classes.dex */
public class OpcionesActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(R.layout.activity_opciones);
        SharedPreferences prefs = getSharedPreferences("opciones", 0);
        CheckBox buscaractualizaciones = (CheckBox) findViewById(R.id.checkbuscaractualizaciones);
        buscaractualizaciones.setChecked(prefs.getBoolean("buscaractualizaciones", true));
        RadioGroup navegador = (RadioGroup) findViewById(R.id.radioGroup1);
        String navegadorstring = prefs.getString("navegadores", "maps");
        if (navegadorstring.equalsIgnoreCase("maps")) {
            RadioButton radio = (RadioButton) findViewById(R.id.radiomaps);
            navegador.check(radio.getId());
        }
        if (navegadorstring.equalsIgnoreCase("sygic")) {
            RadioButton radio2 = (RadioButton) findViewById(R.id.radiosygic);
            navegador.check(radio2.getId());
        }
        if (navegadorstring.equalsIgnoreCase("tomtom")) {
            RadioButton radio3 = (RadioButton) findViewById(R.id.radiotomtom);
            navegador.check(radio3.getId());
        }
    }

    @Override // android.app.Activity
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.opciones, menu);
        return true;
    }

    @Override // android.app.Activity
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
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

    public void cancelar(View v) {
        finish();
        overridePendingTransition(R.anim.right_in, R.anim.right_out);
    }

    public void aceptar(View v) {
        SharedPreferences prefs = getSharedPreferences("opciones", 0);
        SharedPreferences.Editor editor = prefs.edit();
        CheckBox buscaractualizaciones = (CheckBox) findViewById(R.id.checkbuscaractualizaciones);
        editor.putBoolean("buscaractualizaciones", buscaractualizaciones.isChecked());
        RadioGroup navegador = (RadioGroup) findViewById(R.id.radioGroup1);
        switch (navegador.getCheckedRadioButtonId()) {
            case R.id.radiomaps /* 2131361880 */:
                editor.putString("navegadores", "maps");
                break;
            case R.id.radiosygic /* 2131361881 */:
                editor.putString("navegadores", "sygic");
                break;
            case R.id.radiotomtom /* 2131361882 */:
                editor.putString("navegadores", "tomtom");
                break;
        }
        editor.commit();
        finish();
        overridePendingTransition(R.anim.right_in, R.anim.right_out);
    }
}
