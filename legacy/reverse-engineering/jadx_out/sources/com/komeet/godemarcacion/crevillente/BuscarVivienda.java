package com.komeet.godemarcacion.crevillente;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

/* JADX INFO: loaded from: classes.dex */
public class BuscarVivienda extends Activity {
    String navegadores = "";

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        setContentView(R.layout.activity_buscar_vivienda);
        SharedPreferences prefs = getSharedPreferences("opciones", 0);
        this.navegadores = prefs.getString("navegadores", "maps");
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

    public void cargar_partida(View v) {
        final String[] items = getResources().getStringArray(R.array.partidas);
        Arrays.sort(items);
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Selección").setItems(items, new DialogInterface.OnClickListener() { // from class: com.komeet.godemarcacion.crevillente.BuscarVivienda.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int item) {
                TextView textopartida = (TextView) BuscarVivienda.this.findViewById(R.id.textpartida);
                textopartida.setText(items[item]);
            }
        });
        builder.show();
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public void buscar(View v) {
        TextView textopartida = (TextView) findViewById(R.id.textpartida);
        EditText textonumero = (EditText) findViewById(R.id.textnumero);
        EditText textoletra = (EditText) findViewById(R.id.textletra);
        if (textopartida.getText().equals("Cargar partida...") || textonumero.getText().toString().equalsIgnoreCase("")) {
            Toast.makeText(this, "Si no pones una partida y un numero no sabremos donde quieres ir.", 1).show();
            return;
        }
        try {
            String archivo = textopartida.getText().toString().toLowerCase();
            int cra = getResources().getIdentifier(archivo.replace("ñ", "ny").replace(" ", "_"), "raw", getPackageName());
            InputStreamReader isr = new InputStreamReader(getResources().openRawResource(cra));
            BufferedReader br = new BufferedReader(isr);
            String coordenadas = "00000000000000000000";
            int numeroobtenido = Integer.parseInt(textonumero.getText().toString());
            String letraobtenida = textoletra.getText().toString();
            if (letraobtenida.equalsIgnoreCase("")) {
                letraobtenida = "x";
            }
            while (true) {
                String linea = br.readLine();
                if (linea == null) {
                    break;
                } else if (Integer.parseInt(linea.substring(0, 4)) == numeroobtenido && linea.substring(4, 5).equalsIgnoreCase(letraobtenida)) {
                    coordenadas = linea.substring(6, 26);
                }
            }
            br.close();
            isr.close();
            if (coordenadas.equalsIgnoreCase("00000000000000000000")) {
                Toast.makeText(this, "Vivienda no encontrada, prueba con un numero cercano.", 1).show();
                return;
            }
            if (v.getId() == R.id.botonbuscarya) {
                String str = this.navegadores;
                switch (str.hashCode()) {
                    case 3344023:
                        if (str.equals("maps")) {
                            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("geo:0,0?q=" + coordenadas + "(ptda. " + textopartida.getText().toString() + " " + numeroobtenido + letraobtenida.replace("x", "") + ")"));
                            intent.setClassName("com.google.android.apps.maps", "com.google.android.maps.MapsActivity");
                            startActivity(intent);
                        }
                        break;
                    case 109911963:
                        if (str.equals("sygic")) {
                            String str2 = "com.sygic.aura://coordinate|" + coordenadas.substring(11, 20) + "|" + coordenadas.substring(0, 9) + "|drive";
                            startActivity(new Intent("android.intent.action.VIEW", Uri.parse(str2)));
                        }
                        break;
                }
            }
            if (v.getId() == R.id.botoncompartirlugar) {
                Intent sendIntent = new Intent();
                sendIntent.setAction("android.intent.action.SEND");
                sendIntent.putExtra("android.intent.extra.TEXT", "Go! Demarcación\n\nPTDA. " + textopartida.getText().toString() + " " + numeroobtenido + letraobtenida.replace("x", "") + "\n\nhttps://www.google.es/maps/place/" + coordenadas.replace(" ", ""));
                sendIntent.setType("text/plain");
                startActivity(sendIntent);
            }
        } catch (IOException e) {
            Toast.makeText(this, "Vivienda no encontrada, prueba con un numero cercano.", 1).show();
        }
    }
}
