.class public Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;
.super Landroid/app/Activity;
.source "OpcionesActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public aceptar(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 102
    const-string v4, "opciones"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 103
    .local v3, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 105
    .local v1, "editor":Landroid/content/SharedPreferences$Editor;
    const v4, 0x7f0a0056

    invoke-virtual {p0, v4}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 106
    .local v0, "buscaractualizaciones":Landroid/widget/CheckBox;
    const-string v4, "buscaractualizaciones"

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 107
    const v4, 0x7f0a0057

    invoke-virtual {p0, v4}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/RadioGroup;

    .line 109
    .local v2, "navegador":Landroid/widget/RadioGroup;
    invoke-virtual {v2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 121
    :goto_0
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 122
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->finish()V

    .line 124
    const v4, 0x7f040008

    const v5, 0x7f040009

    invoke-virtual {p0, v4, v5}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->overridePendingTransition(II)V

    .line 126
    return-void

    .line 112
    :pswitch_0
    const-string v4, "navegadores"

    const-string v5, "maps"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 115
    :pswitch_1
    const-string v4, "navegadores"

    const-string v5, "sygic"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 118
    :pswitch_2
    const-string v4, "navegadores"

    const-string v5, "tomtom"

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 109
    nop

    :pswitch_data_0
    .packed-switch 0x7f0a0058
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public cancelar(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->finish()V

    .line 97
    const v0, 0x7f040008

    const v1, 0x7f040009

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->overridePendingTransition(II)V

    .line 98
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v9, 0x1

    .line 26
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    invoke-virtual {p0, v9}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->requestWindowFeature(I)Z

    .line 28
    const v7, 0x7f03001a

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->setContentView(I)V

    .line 30
    const-string v7, "opciones"

    const/4 v8, 0x0

    invoke-virtual {p0, v7, v8}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 31
    .local v3, "prefs":Landroid/content/SharedPreferences;
    const v7, 0x7f0a0056

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    .line 32
    .local v0, "buscaractualizaciones":Landroid/widget/CheckBox;
    const-string v7, "buscaractualizaciones"

    invoke-interface {v3, v7, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v0, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    .line 33
    const v7, 0x7f0a0057

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RadioGroup;

    .line 34
    .local v1, "navegador":Landroid/widget/RadioGroup;
    const-string v7, "navegadores"

    const-string v8, "maps"

    invoke-interface {v3, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 35
    .local v2, "navegadorstring":Ljava/lang/String;
    const-string v7, "maps"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 37
    const v7, 0x7f0a0058

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/RadioButton;

    .line 38
    .local v4, "radio":Landroid/widget/RadioButton;
    invoke-virtual {v4}, Landroid/widget/RadioButton;->getId()I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/widget/RadioGroup;->check(I)V

    .line 40
    .end local v4    # "radio":Landroid/widget/RadioButton;
    :cond_0
    const-string v7, "sygic"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 42
    const v7, 0x7f0a0059

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/RadioButton;

    .line 43
    .local v5, "radio2":Landroid/widget/RadioButton;
    invoke-virtual {v5}, Landroid/widget/RadioButton;->getId()I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/widget/RadioGroup;->check(I)V

    .line 45
    .end local v5    # "radio2":Landroid/widget/RadioButton;
    :cond_1
    const-string v7, "tomtom"

    invoke-virtual {v2, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 47
    const v7, 0x7f0a005a

    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/RadioButton;

    .line 48
    .local v6, "radio3":Landroid/widget/RadioButton;
    invoke-virtual {v6}, Landroid/widget/RadioButton;->getId()I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/widget/RadioGroup;->check(I)V

    .line 53
    .end local v6    # "radio3":Landroid/widget/RadioButton;
    :cond_2
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f0e0000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 62
    const/4 v0, 0x1

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 80
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->finish()V

    .line 84
    const v0, 0x7f040008

    const v1, 0x7f040009

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;->overridePendingTransition(II)V

    .line 86
    const/4 v0, 0x1

    .line 90
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 70
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 71
    .local v0, "id":I
    const v1, 0x7f0a005c

    if-ne v0, v1, :cond_0

    .line 72
    const/4 v1, 0x1

    .line 74
    :goto_0
    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method
