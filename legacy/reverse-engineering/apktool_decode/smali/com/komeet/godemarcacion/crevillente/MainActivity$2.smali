.class Lcom/komeet/godemarcacion/crevillente/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/komeet/godemarcacion/crevillente/MainActivity;->actualizar(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

.field private final synthetic val$s:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/komeet/godemarcacion/crevillente/MainActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    iput-object p2, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;->val$s:Ljava/lang/String;

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5
    .param p1, "dialogo1"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 106
    new-instance v1, Landroid/app/DownloadManager$Request;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "http://www.komeet.org/godemarcacion/partidascrevillente/app"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;->val$s:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 107
    .local v1, "r":Landroid/app/DownloadManager$Request;
    sget-object v2, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ACTUALIZAR GoDemarcacion"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;->val$s:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".apk"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/DownloadManager$Request;->setDestinationInExternalPublicDir(Ljava/lang/String;Ljava/lang/String;)Landroid/app/DownloadManager$Request;

    .line 108
    invoke-virtual {v1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 109
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 110
    iget-object v2, p0, Lcom/komeet/godemarcacion/crevillente/MainActivity$2;->this$0:Lcom/komeet/godemarcacion/crevillente/MainActivity;

    const-string v3, "download"

    invoke-virtual {v2, v3}, Lcom/komeet/godemarcacion/crevillente/MainActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 111
    .local v0, "dm":Landroid/app/DownloadManager;
    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    .line 112
    return-void
.end method
