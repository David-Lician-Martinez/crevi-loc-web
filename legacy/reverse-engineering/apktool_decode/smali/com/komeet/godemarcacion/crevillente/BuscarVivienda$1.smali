.class Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;
.super Ljava/lang/Object;
.source "BuscarVivienda.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->cargar_partida(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;

.field private final synthetic val$items:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;[Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;->this$0:Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;

    iput-object p2, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;->val$items:[Ljava/lang/String;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "item"    # I

    .prologue
    .line 67
    iget-object v1, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;->this$0:Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;

    const v2, 0x7f0a004e

    invoke-virtual {v1, v2}, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 68
    .local v0, "textopartida":Landroid/widget/TextView;
    iget-object v1, p0, Lcom/komeet/godemarcacion/crevillente/BuscarVivienda$1;->val$items:[Ljava/lang/String;

    aget-object v1, v1, p2

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    return-void
.end method
