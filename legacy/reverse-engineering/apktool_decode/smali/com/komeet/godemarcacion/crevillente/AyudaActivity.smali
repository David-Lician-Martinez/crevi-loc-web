.class public Lcom/komeet/godemarcacion/crevillente/AyudaActivity;
.super Landroid/app/Activity;
.source "AyudaActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public cerrar(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->finish()V

    .line 41
    const v0, 0x7f040008

    const v1, 0x7f040009

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->overridePendingTransition(II)V

    .line 42
    return-void
.end method

.method public enviaramigo(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 45
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 46
    .local v0, "sendIntent":Landroid/content/Intent;
    const-string v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 47
    const-string v1, "android.intent.extra.TEXT"

    const-string v2, "Go! Demarcaci\u00f3n\nPartidas Crevillente\n\nhttp://www.komeet.org/godemarcacion/partidascrevillente/app.apk\n\nDescargatela ya!"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 48
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 49
    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->startActivity(Landroid/content/Intent;)V

    .line 50
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 17
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->requestWindowFeature(I)Z

    .line 18
    const v0, 0x7f030017

    invoke-virtual {p0, v0}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->setContentView(I)V

    .line 20
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 24
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    .line 26
    invoke-virtual {p0}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->finish()V

    .line 28
    const v0, 0x7f040008

    const v1, 0x7f040009

    invoke-virtual {p0, v0, v1}, Lcom/komeet/godemarcacion/crevillente/AyudaActivity;->overridePendingTransition(II)V

    .line 30
    const/4 v0, 0x1

    .line 34
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
