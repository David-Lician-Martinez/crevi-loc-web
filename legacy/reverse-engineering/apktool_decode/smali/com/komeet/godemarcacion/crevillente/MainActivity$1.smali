.class Lcom/komeet/godemarcacion/crevillente/MainActivity$1;
.super Landroid/webkit/WebViewClient;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/komeet/godemarcacion/crevillente/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

.field private final synthetic val$textoversion:Landroid/widget/TextView;

.field private final synthetic val$webview:Landroid/webkit/WebView;


# direct methods
.method constructor <init>(Lcom/komeet/godemarcacion/crevillente/MainActivity;Landroid/webkit/WebView;Landroid/widget/TextView;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iput-object p2, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$webview:Landroid/webkit/WebView;

    iput-object p3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$textoversion:Landroid/widget/TextView;

    .line 54
    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 6
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 57
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$webview:Landroid/webkit/WebView;

    invoke-super {p0, v3, p2}, Landroid/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 59
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$webview:Landroid/webkit/WebView;

    invoke-virtual {v3}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "data":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 62
    .local v2, "json":Lorg/json/JSONObject;
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    const-string v4, "versionName"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/komeet/godemarcacion/crevillente/MainActivity;->nuevaversion:Ljava/lang/String;

    .line 64
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v3, v3, Lcom/komeet/godemarcacion/crevillente/MainActivity;->versionactual:Ljava/lang/String;

    iget-object v4, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v4, v4, Lcom/komeet/godemarcacion/crevillente/MainActivity;->nuevaversion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 67
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$textoversion:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Actualizaci\u00f3n disponible v"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v5, v5, Lcom/komeet/godemarcacion/crevillente/MainActivity;->nuevaversion:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v4, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v4, v4, Lcom/komeet/godemarcacion/crevillente/MainActivity;->nuevaversion:Ljava/lang/String;

    const-string v5, "mejoras"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->actualizar(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .end local v2    # "json":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 72
    .restart local v2    # "json":Lorg/json/JSONObject;
    :cond_0
    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->val$textoversion:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "v"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v5, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$1;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iget-object v5, v5, Lcom/komeet/godemarcacion/crevillente/MainActivity;->versionactual:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 74
    .end local v2    # "json":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 76
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
