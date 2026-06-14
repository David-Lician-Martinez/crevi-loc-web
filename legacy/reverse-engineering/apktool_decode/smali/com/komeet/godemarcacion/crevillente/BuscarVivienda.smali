.class public Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;
.super Landroid/app/Activity;
.source "BuscarVivienda.java"


# instance fields
.field navegadores:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 26
    const-string v0, ""

    iput-object v0, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->navegadores:Ljava/lang/String;

    .line 25
    return-void
.end method


# virtual methods
.method public buscar(Landroid/view/View;)V
    .locals 22
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 79
    const v18, 0x7f0a004e

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->findViewById(I)Landroid/view/View;

    move-result-object v17

    check-cast v17, Landroid/widget/TextView;

    .line 80
    .local v17, "textopartida":Landroid/widget/TextView;
    const v18, 0x7f0a004b

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->findViewById(I)Landroid/view/View;

    move-result-object v16

    check-cast v16, Landroid/widget/EditText;

    .line 81
    .local v16, "textonumero":Landroid/widget/EditText;
    const v18, 0x7f0a004c

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/EditText;

    .line 83
    .local v15, "textoletra":Landroid/widget/EditText;
    invoke-virtual/range {v17 .. v17}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v18

    const-string v19, "Cargar partida..."

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_5

    invoke-virtual/range {v16 .. v16}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v18

    const-string v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_5

    .line 86
    :try_start_0
    invoke-virtual/range {v17 .. v17}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 87
    .local v3, "archivo":Ljava/lang/String;
    const-string v18, "\u00f1"

    const-string v19, "ny"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 88
    const-string v18, " "

    const-string v19, "_"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v3, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 89
    invoke-virtual/range {p0 .. p0}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    const-string v19, "raw"

    invoke-virtual/range {p0 .. p0}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->getPackageName()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v6

    .line 90
    .local v6, "cra":I
    new-instance v9, Ljava/io/InputStreamReader;

    invoke-virtual/range {p0 .. p0}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->getResources()Landroid/content/res/Resources;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 91
    .local v9, "isr":Ljava/io/InputStreamReader;
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 95
    .local v4, "br":Ljava/io/BufferedReader;
    const-string v5, "00000000000000000000"

    .line 96
    .local v5, "coordenadas":Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    .line 97
    .local v12, "numeroobtenido":I
    invoke-virtual {v15}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v10

    .line 98
    .local v10, "letraobtenida":Ljava/lang/String;
    const-string v18, ""

    move-object/from16 v0, v18

    invoke-virtual {v10, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 99
    const-string v10, "x"

    .line 100
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v11

    .local v11, "linea":Ljava/lang/String;
    if-nez v11, :cond_3

    .line 107
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .line 108
    invoke-virtual {v9}, Ljava/io/InputStreamReader;->close()V

    .line 109
    const-string v18, "00000000000000000000"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_4

    .line 111
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v18

    const v19, 0x7f0a004d

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1

    .line 113
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->navegadores:Ljava/lang/String;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->hashCode()I

    move-result v19

    sparse-switch v19, :sswitch_data_0

    .line 133
    :cond_1
    :goto_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getId()I

    move-result v18

    const v19, 0x7f0a004f

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_2

    .line 135
    new-instance v13, Landroid/content/Intent;

    invoke-direct {v13}, Landroid/content/Intent;-><init>()V

    .line 136
    .local v13, "sendIntent":Landroid/content/Intent;
    const-string v18, "android.intent.action.SEND"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const-string v18, "android.intent.extra.TEXT"

    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "Go! Demarcaci\u00f3n\n\nPTDA. "

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v17}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "x"

    const-string v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\n\nhttps://www.google.es/maps/place/"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    const-string v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v13, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    const-string v18, "text/plain"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 139
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->startActivity(Landroid/content/Intent;)V

    .line 156
    .end local v3    # "archivo":Ljava/lang/String;
    .end local v4    # "br":Ljava/io/BufferedReader;
    .end local v5    # "coordenadas":Ljava/lang/String;
    .end local v6    # "cra":I
    .end local v9    # "isr":Ljava/io/InputStreamReader;
    .end local v10    # "letraobtenida":Ljava/lang/String;
    .end local v11    # "linea":Ljava/lang/String;
    .end local v12    # "numeroobtenido":I
    .end local v13    # "sendIntent":Landroid/content/Intent;
    :cond_2
    :goto_2
    return-void

    .line 103
    .restart local v3    # "archivo":Ljava/lang/String;
    .restart local v4    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "coordenadas":Ljava/lang/String;
    .restart local v6    # "cra":I
    .restart local v9    # "isr":Ljava/io/InputStreamReader;
    .restart local v10    # "letraobtenida":Ljava/lang/String;
    .restart local v11    # "linea":Ljava/lang/String;
    .restart local v12    # "numeroobtenido":I
    :cond_3
    const/16 v18, 0x0

    const/16 v19, 0x4

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v18

    move/from16 v0, v18

    if-ne v0, v12, :cond_0

    .line 104
    const/16 v18, 0x4

    const/16 v19, 0x5

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 105
    const/16 v18, 0x6

    const/16 v19, 0x1a

    move/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 113
    :sswitch_0
    const-string v19, "maps"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 116
    new-instance v8, Landroid/content/Intent;

    const-string v18, "android.intent.action.VIEW"

    .line 117
    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "geo:0,0?q="

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "(ptda. "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v17 .. v17}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "x"

    const-string v21, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ")"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v19

    .line 116
    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-direct {v8, v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 118
    .local v8, "intent":Landroid/content/Intent;
    const-string v18, "com.google.android.apps.maps"

    const-string v19, "com.google.android.maps.MapsActivity"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 148
    .end local v3    # "archivo":Ljava/lang/String;
    .end local v4    # "br":Ljava/io/BufferedReader;
    .end local v5    # "coordenadas":Ljava/lang/String;
    .end local v6    # "cra":I
    .end local v8    # "intent":Landroid/content/Intent;
    .end local v9    # "isr":Ljava/io/InputStreamReader;
    .end local v10    # "letraobtenida":Ljava/lang/String;
    .end local v11    # "linea":Ljava/lang/String;
    .end local v12    # "numeroobtenido":I
    :catch_0
    move-exception v7

    .line 150
    .local v7, "e":Ljava/io/IOException;
    const-string v18, "Vivienda no encontrada, prueba con un numero cercano."

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 113
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v3    # "archivo":Ljava/lang/String;
    .restart local v4    # "br":Ljava/io/BufferedReader;
    .restart local v5    # "coordenadas":Ljava/lang/String;
    .restart local v6    # "cra":I
    .restart local v9    # "isr":Ljava/io/InputStreamReader;
    .restart local v10    # "letraobtenida":Ljava/lang/String;
    .restart local v11    # "linea":Ljava/lang/String;
    .restart local v12    # "numeroobtenido":I
    :sswitch_1
    :try_start_1
    const-string v19, "sygic"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 123
    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "com.sygic.aura://coordinate|"

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v19, 0xb

    const/16 v20, 0x14

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "|"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v19, 0x0

    const/16 v20, 0x9

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "|drive"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 124
    .local v14, "str":Ljava/lang/String;
    new-instance v18, Landroid/content/Intent;

    const-string v19, "android.intent.action.VIEW"

    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v20

    invoke-direct/range {v18 .. v20}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 144
    .end local v14    # "str":Ljava/lang/String;
    :cond_4
    const-string v18, "Vivienda no encontrada, prueba con un numero cercano."

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2

    .line 154
    .end local v3    # "archivo":Ljava/lang/String;
    .end local v4    # "br":Ljava/io/BufferedReader;
    .end local v5    # "coordenadas":Ljava/lang/String;
    .end local v6    # "cra":I
    .end local v9    # "isr":Ljava/io/InputStreamReader;
    .end local v10    # "letraobtenida":Ljava/lang/String;
    .end local v11    # "linea":Ljava/lang/String;
    .end local v12    # "numeroobtenido":I
    :cond_5
    const-string v18, "Si no pones una partida y un numero no sabremos donde quieres ir."

    const/16 v19, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/widget/Toast;->show()V

    goto/16 :goto_2

    .line 113
    :sswitch_data_0
    .sparse-switch
        0x330697 -> :sswitch_0
        0x68d1f9b -> :sswitch_1
    .end sparse-switch
.end method

.method public cargar_partida(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v3, 0x7f0d0000

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "items":[Ljava/lang/String;
    invoke-static {v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 62
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 64
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v2, "Selecci\u00f3n"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    .line 65
    new-instance v3, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;

    invoke-direct {v3, p0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;-><init>(Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;[Ljava/lang/String;)V

    invoke-virtual {v2, v1, v3}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 73
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 75
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 30
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->requestWindowFeature(I)Z

    .line 31
    const v1, 0x7f030018

    invoke-virtual {p0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->setContentView(I)V

    .line 33
    const-string v1, "opciones"

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 34
    .local v0, "prefs":Landroid/content/SharedPreferences;
    const-string v1, "navegadores"

    const-string v2, "maps"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->navegadores:Ljava/lang/String;

    .line 38
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 44
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->finish()V

    .line 48
    const v0, 0x7f040008

    const v1, 0x7f040009

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->overridePendingTransition(II)V

    .line 50
    const/4 v0, 0x1

    .line 54
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
