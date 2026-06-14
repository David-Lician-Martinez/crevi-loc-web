.class public Lcom/komeet/godemarcacion/crevillente/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field nuevaversion:Ljava/lang/String;

.field versionactual:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public actualizar(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "h"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 100
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 101
    .local v0, "dialogo1":Landroid/app/AlertDialog$Builder;
    const-string v1, "Actualizaci\u00f3n encontrada"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 102
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Se ha encontrado una nueva actualizaci\u00f3n.\n\nMEJORAS:\n"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "-"

    const-string v3, "\n-"

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n\nQuieres actualizar?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 103
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 104
    const-string v1, "Actualizar ahora"

    new-instance v2, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;

    invoke-direct {v2, p0, p1}, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;-><init>(Lcom/komeet/godemarcacion/crevillente/MainActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 114
    const-string v1, "Cancelar"

    new-instance v2, Lcom/komeet/godemarcacion/crevillente/MainActivity$3;

    invoke-direct {v2, p0}, Lcom/komeet/godemarcacion/crevillente/MainActivity$3;-><init>(Lcom/komeet/godemarcacion/crevillente/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 119
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 120
    return-void
.end method

.method public ayuda(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 131
    const v0, 0x7f040006

    const v1, 0x7f040007

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->overridePendingTransition(II)V

    .line 132
    return-void
.end method

.method public buscar_vivienda(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 91
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 92
    const v0, 0x7f040006

    const v1, 0x7f040007

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->overridePendingTransition(II)V

    .line 93
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 35
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 36
    invoke-virtual {p0, v7}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->requestWindowFeature(I)Z

    .line 37
    const v4, 0x7f030019

    invoke-virtual {p0, v4}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->setContentView(I)V

    .line 38
    const v4, 0x7f0a0054

    invoke-virtual {p0, v4}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/webkit/WebView;

    .line 39
    .local v3, "webview":Landroid/webkit/WebView;
    const v4, 0x7f0a0050

    invoke-virtual {p0, v4}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 42
    .local v2, "textoversion":Landroid/widget/TextView;
    :try_start_0
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    iget-object v4, v4, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v4, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity;->versionactual:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    const-string v4, "opciones"

    invoke-virtual {p0, v4, v8}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 48
    .local v1, "prefs":Landroid/content/SharedPreferences;
    const-string v4, "buscaractualizaciones"

    invoke-interface {v1, v4, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 49
    .local v0, "buscaractualizaciones":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 52
    const-string v4, "Comprobando actualizaciones..."

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    invoke-virtual {v3, v7}, Landroid/webkit/WebView;->clearCache(Z)V

    .line 54
    new-instance v4, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;

    invoke-direct {v4, p0, v3, v2}, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;-><init>(Lcom/komeet/godemarcacion/crevillente/MainActivity;Landroid/webkit/WebView;Landroid/widget/TextView;)V

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 80
    const-string v4, "http://www.komeet.org/godemarcacion/partidascrevillente/autoupdate_info.php"

    invoke-virtual {v3, v4}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 85
    :goto_1
    return-void

    .line 83
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "v"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity;->versionactual:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 44
    .end local v0    # "buscaractualizaciones":Ljava/lang/Boolean;
    .end local v1    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v4

    goto :goto_0
.end method

.method public opciones(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 124
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/komeet/godemarcacion/crevillente/OpcionesActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 125
    const v0, 0x7f040006

    const v1, 0x7f040007

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->overridePendingTransition(II)V

    .line 126
    return-void
.end method
