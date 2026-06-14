.class Landroid/support/v7/app/ActionBarActivityDelegateBase;
.super Landroid/support/v7/app/ActionBarActivityDelegate;
.source "ActionBarActivityDelegateBase.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;,
        Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;,
        Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;,
        Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarActivityDelegateBase"


# instance fields
.field private mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

.field mActionMode:Landroid/support/v7/view/ActionMode;

.field mActionModePopup:Landroid/widget/PopupWindow;

.field mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

.field private mClosingActionMenu:Z

.field private mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

.field private mEnableDefaultActionBarUp:Z

.field private mFeatureIndeterminateProgress:Z

.field private mFeatureProgress:Z

.field private mInvalidatePanelMenuFeatures:I

.field private mInvalidatePanelMenuPosted:Z

.field private final mInvalidatePanelMenuRunnable:Ljava/lang/Runnable;

.field private mPanelMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;

.field private mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

.field private mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

.field mShowActionModePopup:Ljava/lang/Runnable;

.field private mStatusGuard:Landroid/view/View;

.field private mSubDecor:Landroid/view/ViewGroup;

.field private mSubDecorInstalled:Z

.field private mTempRect1:Landroid/graphics/Rect;

.field private mTempRect2:Landroid/graphics/Rect;

.field private mTitleToSet:Ljava/lang/CharSequence;

.field private mToolbarListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

.field private mWindowDecor:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Landroid/support/v7/app/ActionBarActivity;)V
    .locals 1
    .param p1, "activity"    # Landroid/support/v7/app/ActionBarActivity;

    .prologue
    .line 134
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegate;-><init>(Landroid/support/v7/app/ActionBarActivity;)V

    .line 112
    new-instance v0, Landroid/support/v7/app/ActionBarActivityDelegateBase$1;

    invoke-direct {v0, p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase$1;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuRunnable:Ljava/lang/Runnable;

    .line 135
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/app/ActionBarActivityDelegateBase;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;

    .prologue
    .line 80
    iget v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuFeatures:I

    return v0
.end method

.method static synthetic access$002(Landroid/support/v7/app/ActionBarActivityDelegateBase;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # I

    .prologue
    .line 80
    iput p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuFeatures:I

    return p1
.end method

.method static synthetic access$100(Landroid/support/v7/app/ActionBarActivityDelegateBase;I)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # I

    .prologue
    .line 80
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->doInvalidatePanelMenu(I)V

    return-void
.end method

.method static synthetic access$202(Landroid/support/v7/app/ActionBarActivityDelegateBase;Z)Z
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # Z

    .prologue
    .line 80
    iput-boolean p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuPosted:Z

    return p1
.end method

.method static synthetic access$300(Landroid/support/v7/app/ActionBarActivityDelegateBase;I)I
    .locals 1
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # I

    .prologue
    .line 80
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->updateStatusGuard(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$600(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/view/Menu;)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .locals 1
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # Landroid/view/Menu;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->findMenuPanel(Landroid/view/Menu;)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/v7/app/ActionBarActivityDelegateBase;ILandroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/Menu;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # I
    .param p2, "x2"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p3, "x3"    # Landroid/view/Menu;

    .prologue
    .line 80
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->callOnPanelClosed(ILandroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/Menu;)V

    return-void
.end method

.method static synthetic access$800(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p2, "x2"    # Z

    .prologue
    .line 80
    invoke-direct {p0, p1, p2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    return-void
.end method

.method static synthetic access$900(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarActivityDelegateBase;
    .param p1, "x1"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->checkCloseActionMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    return-void
.end method

.method private applyFixedSizeWindow()V
    .locals 13

    .prologue
    .line 381
    iget-object v11, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    sget-object v12, Landroid/support/v7/appcompat/R$styleable;->Theme:[I

    invoke-virtual {v11, v12}, Landroid/support/v7/app/ActionBarActivity;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 383
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v5, 0x0

    .line 384
    .local v5, "mFixedWidthMajor":Landroid/util/TypedValue;
    const/4 v6, 0x0

    .line 385
    .local v6, "mFixedWidthMinor":Landroid/util/TypedValue;
    const/4 v3, 0x0

    .line 386
    .local v3, "mFixedHeightMajor":Landroid/util/TypedValue;
    const/4 v4, 0x0

    .line 388
    .local v4, "mFixedHeightMinor":Landroid/util/TypedValue;
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedWidthMajor:I

    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 389
    if-nez v5, :cond_0

    new-instance v5, Landroid/util/TypedValue;

    .end local v5    # "mFixedWidthMajor":Landroid/util/TypedValue;
    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    .line 390
    .restart local v5    # "mFixedWidthMajor":Landroid/util/TypedValue;
    :cond_0
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedWidthMajor:I

    invoke-virtual {v0, v11, v5}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 392
    :cond_1
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedWidthMinor:I

    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 393
    if-nez v6, :cond_2

    new-instance v6, Landroid/util/TypedValue;

    .end local v6    # "mFixedWidthMinor":Landroid/util/TypedValue;
    invoke-direct {v6}, Landroid/util/TypedValue;-><init>()V

    .line 394
    .restart local v6    # "mFixedWidthMinor":Landroid/util/TypedValue;
    :cond_2
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedWidthMinor:I

    invoke-virtual {v0, v11, v6}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 396
    :cond_3
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedHeightMajor:I

    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 397
    if-nez v3, :cond_4

    new-instance v3, Landroid/util/TypedValue;

    .end local v3    # "mFixedHeightMajor":Landroid/util/TypedValue;
    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 398
    .restart local v3    # "mFixedHeightMajor":Landroid/util/TypedValue;
    :cond_4
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedHeightMajor:I

    invoke-virtual {v0, v11, v3}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 400
    :cond_5
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedHeightMinor:I

    invoke-virtual {v0, v11}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 401
    if-nez v4, :cond_6

    new-instance v4, Landroid/util/TypedValue;

    .end local v4    # "mFixedHeightMinor":Landroid/util/TypedValue;
    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 402
    .restart local v4    # "mFixedHeightMinor":Landroid/util/TypedValue;
    :cond_6
    sget v11, Landroid/support/v7/appcompat/R$styleable;->Theme_windowFixedHeightMinor:I

    invoke-virtual {v0, v11, v4}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    .line 405
    :cond_7
    iget-object v11, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v11}, Landroid/support/v7/app/ActionBarActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    .line 406
    .local v7, "metrics":Landroid/util/DisplayMetrics;
    iget v11, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v12, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    if-ge v11, v12, :cond_c

    const/4 v2, 0x1

    .line 407
    .local v2, "isPortrait":Z
    :goto_0
    const/4 v10, -0x1

    .line 408
    .local v10, "w":I
    const/4 v1, -0x1

    .line 410
    .local v1, "h":I
    if-eqz v2, :cond_d

    move-object v9, v6

    .line 411
    .local v9, "tvw":Landroid/util/TypedValue;
    :goto_1
    if-eqz v9, :cond_8

    iget v11, v9, Landroid/util/TypedValue;->type:I

    if-eqz v11, :cond_8

    .line 412
    iget v11, v9, Landroid/util/TypedValue;->type:I

    const/4 v12, 0x5

    if-ne v11, v12, :cond_e

    .line 413
    invoke-virtual {v9, v7}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v11

    float-to-int v10, v11

    .line 419
    :cond_8
    :goto_2
    if-eqz v2, :cond_f

    move-object v8, v3

    .line 420
    .local v8, "tvh":Landroid/util/TypedValue;
    :goto_3
    if-eqz v8, :cond_9

    iget v11, v8, Landroid/util/TypedValue;->type:I

    if-eqz v11, :cond_9

    .line 421
    iget v11, v8, Landroid/util/TypedValue;->type:I

    const/4 v12, 0x5

    if-ne v11, v12, :cond_10

    .line 422
    invoke-virtual {v8, v7}, Landroid/util/TypedValue;->getDimension(Landroid/util/DisplayMetrics;)F

    move-result v11

    float-to-int v1, v11

    .line 428
    :cond_9
    :goto_4
    const/4 v11, -0x1

    if-ne v10, v11, :cond_a

    const/4 v11, -0x1

    if-eq v1, v11, :cond_b

    .line 429
    :cond_a
    iget-object v11, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v11}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v11

    invoke-virtual {v11, v10, v1}, Landroid/view/Window;->setLayout(II)V

    .line 432
    :cond_b
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 433
    return-void

    .line 406
    .end local v1    # "h":I
    .end local v2    # "isPortrait":Z
    .end local v8    # "tvh":Landroid/util/TypedValue;
    .end local v9    # "tvw":Landroid/util/TypedValue;
    .end local v10    # "w":I
    :cond_c
    const/4 v2, 0x0

    goto :goto_0

    .restart local v1    # "h":I
    .restart local v2    # "isPortrait":Z
    .restart local v10    # "w":I
    :cond_d
    move-object v9, v5

    .line 410
    goto :goto_1

    .line 414
    .restart local v9    # "tvw":Landroid/util/TypedValue;
    :cond_e
    iget v11, v9, Landroid/util/TypedValue;->type:I

    const/4 v12, 0x6

    if-ne v11, v12, :cond_8

    .line 415
    iget v11, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v11, v11

    iget v12, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v12, v12

    invoke-virtual {v9, v11, v12}, Landroid/util/TypedValue;->getFraction(FF)F

    move-result v11

    float-to-int v10, v11

    goto :goto_2

    :cond_f
    move-object v8, v4

    .line 419
    goto :goto_3

    .line 423
    .restart local v8    # "tvh":Landroid/util/TypedValue;
    :cond_10
    iget v11, v8, Landroid/util/TypedValue;->type:I

    const/4 v12, 0x6

    if-ne v11, v12, :cond_9

    .line 424
    iget v11, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v11, v11

    iget v12, v7, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v12, v12

    invoke-virtual {v8, v11, v12}, Landroid/util/TypedValue;->getFraction(FF)F

    move-result v11

    float-to-int v1, v11

    goto :goto_4
.end method

.method private callOnPanelClosed(ILandroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/Menu;)V
    .locals 1
    .param p1, "featureId"    # I
    .param p2, "panel"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1153
    if-nez p3, :cond_1

    .line 1155
    if-nez p2, :cond_0

    .line 1156
    if-ltz p1, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    .line 1157
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    aget-object p2, v0, p1

    .line 1161
    :cond_0
    if-eqz p2, :cond_1

    .line 1163
    iget-object p3, p2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 1168
    :cond_1
    if-eqz p2, :cond_2

    iget-boolean v0, p2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    if-nez v0, :cond_2

    .line 1172
    :goto_0
    return-void

    .line 1171
    :cond_2
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    invoke-interface {v0, p1, p3}, Landroid/support/v7/internal/app/WindowCallback;->onPanelClosed(ILandroid/view/Menu;)V

    goto :goto_0
.end method

.method private checkCloseActionMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .locals 2
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 1109
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mClosingActionMenu:Z

    if-eqz v1, :cond_0

    .line 1120
    :goto_0
    return-void

    .line 1113
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mClosingActionMenu:Z

    .line 1114
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v1}, Landroid/support/v7/internal/widget/DecorContentParent;->dismissPopups()V

    .line 1115
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    .line 1116
    .local v0, "cb":Landroid/support/v7/internal/app/WindowCallback;
    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1117
    const/16 v1, 0x8

    invoke-interface {v0, v1, p1}, Landroid/support/v7/internal/app/WindowCallback;->onPanelClosed(ILandroid/view/Menu;)V

    .line 1119
    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mClosingActionMenu:Z

    goto :goto_0
.end method

.method private closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V
    .locals 3
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p2, "doCallback"    # Z

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1123
    if-eqz p2, :cond_1

    iget v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    if-nez v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorContentParent;->isOverflowMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1125
    iget-object v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {p0, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->checkCloseActionMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 1149
    :cond_0
    :goto_0
    return-void

    .line 1129
    :cond_1
    iget-boolean v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    if-eqz v0, :cond_2

    .line 1130
    if-eqz p2, :cond_2

    .line 1131
    iget v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    invoke-direct {p0, v0, p1, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->callOnPanelClosed(ILandroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/Menu;)V

    .line 1135
    :cond_2
    iput-boolean v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    .line 1136
    iput-boolean v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isHandled:Z

    .line 1137
    iput-boolean v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    .line 1140
    iput-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    .line 1144
    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshDecorView:Z

    .line 1146
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-ne v0, p1, :cond_0

    .line 1147
    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    goto :goto_0
.end method

.method private doInvalidatePanelMenu(I)V
    .locals 5
    .param p1, "featureId"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1238
    invoke-direct {p0, p1, v4}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 1239
    .local v1, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    const/4 v0, 0x0

    .line 1240
    .local v0, "savedActionViewStates":Landroid/os/Bundle;
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_1

    .line 1241
    new-instance v0, Landroid/os/Bundle;

    .end local v0    # "savedActionViewStates":Landroid/os/Bundle;
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1242
    .restart local v0    # "savedActionViewStates":Landroid/os/Bundle;
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2, v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->saveActionViewStates(Landroid/os/Bundle;)V

    .line 1243
    invoke-virtual {v0}, Landroid/os/Bundle;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 1244
    iput-object v0, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenActionViewState:Landroid/os/Bundle;

    .line 1247
    :cond_0
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1248
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->clear()V

    .line 1250
    :cond_1
    iput-boolean v4, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshMenuContent:Z

    .line 1251
    iput-boolean v4, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshDecorView:Z

    .line 1254
    const/16 v2, 0x8

    if-eq p1, v2, :cond_2

    if-nez p1, :cond_3

    :cond_2
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_3

    .line 1256
    invoke-direct {p0, v3, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 1257
    if-eqz v1, :cond_3

    .line 1258
    iput-boolean v3, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    .line 1259
    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->preparePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)Z

    .line 1262
    :cond_3
    return-void
.end method

.method private ensureToolbarListMenuPresenter()V
    .locals 5

    .prologue
    .line 1341
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mToolbarListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-nez v2, :cond_0

    .line 1343
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 1344
    .local v1, "outValue":Landroid/util/TypedValue;
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    sget v3, Landroid/support/v7/appcompat/R$attr;->panelMenuListTheme:I

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 1346
    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_1

    iget v2, v1, Landroid/util/TypedValue;->resourceId:I

    :goto_0
    invoke-direct {v0, v3, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 1351
    .local v0, "context":Landroid/content/Context;
    new-instance v2, Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    sget v3, Landroid/support/v7/appcompat/R$layout;->abc_list_menu_item_layout:I

    invoke-direct {v2, v0, v3}, Landroid/support/v7/internal/view/menu/ListMenuPresenter;-><init>(Landroid/content/Context;I)V

    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mToolbarListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    .line 1354
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "outValue":Landroid/util/TypedValue;
    :cond_0
    return-void

    .line 1346
    .restart local v1    # "outValue":Landroid/util/TypedValue;
    :cond_1
    sget v2, Landroid/support/v7/appcompat/R$style;->Theme_AppCompat_CompactMenu:I

    goto :goto_0
.end method

.method private findMenuPanel(Landroid/view/Menu;)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .locals 5
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 1175
    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .line 1176
    .local v3, "panels":[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v3, :cond_0

    array-length v0, v3

    .line 1177
    .local v0, "N":I
    :goto_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v0, :cond_2

    .line 1178
    aget-object v2, v3, v1

    .line 1179
    .local v2, "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v2, :cond_1

    iget-object v4, v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-ne v4, p1, :cond_1

    .line 1183
    .end local v2    # "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :goto_2
    return-object v2

    .line 1176
    .end local v0    # "N":I
    .end local v1    # "i":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 1177
    .restart local v0    # "N":I
    .restart local v1    # "i":I
    .restart local v2    # "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1183
    .end local v2    # "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_2
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private getCircularProgressBar()Landroid/support/v7/internal/widget/ProgressBarCompat;
    .locals 3

    .prologue
    .line 940
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    sget v2, Landroid/support/v7/appcompat/R$id;->progress_circular:I

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/internal/widget/ProgressBarCompat;

    .line 941
    .local v0, "pb":Landroid/support/v7/internal/widget/ProgressBarCompat;
    if-eqz v0, :cond_0

    .line 942
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 944
    :cond_0
    return-object v0
.end method

.method private getHorizontalProgressBar()Landroid/support/v7/internal/widget/ProgressBarCompat;
    .locals 3

    .prologue
    .line 948
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    sget v2, Landroid/support/v7/appcompat/R$id;->progress_horizontal:I

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/internal/widget/ProgressBarCompat;

    .line 949
    .local v0, "pb":Landroid/support/v7/internal/widget/ProgressBarCompat;
    if-eqz v0, :cond_0

    .line 950
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 952
    :cond_0
    return-object v0
.end method

.method private getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .locals 5
    .param p1, "featureId"    # I
    .param p2, "required"    # Z

    .prologue
    const/4 v4, 0x0

    .line 1188
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .local v0, "ar":[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v0, :cond_0

    array-length v3, v0

    if-gt v3, p1, :cond_2

    .line 1189
    :cond_0
    add-int/lit8 v3, p1, 0x1

    new-array v1, v3, [Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .line 1190
    .local v1, "nar":[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v0, :cond_1

    .line 1191
    array-length v3, v0

    invoke-static {v0, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1193
    :cond_1
    move-object v0, v1

    iput-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanels:[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .line 1196
    .end local v1    # "nar":[Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_2
    aget-object v2, v0, p1

    .line 1197
    .local v2, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-nez v2, :cond_3

    .line 1198
    new-instance v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .end local v2    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    invoke-direct {v2, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;-><init>(I)V

    .restart local v2    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    aput-object v2, v0, p1

    .line 1200
    :cond_3
    return-object v2
.end method

.method private hideProgressBars(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat;)V
    .locals 2
    .param p1, "horizontalProgressBar"    # Landroid/support/v7/internal/widget/ProgressBarCompat;
    .param p2, "spinnyProgressBar"    # Landroid/support/v7/internal/widget/ProgressBarCompat;

    .prologue
    const/4 v1, 0x4

    .line 931
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 932
    invoke-virtual {p2, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 934
    :cond_0
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 935
    invoke-virtual {p1, v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 937
    :cond_1
    return-void
.end method

.method private initializePanelContent(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)Z
    .locals 4
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .prologue
    const/4 v1, 0x0

    .line 999
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v2, :cond_1

    .line 1011
    :cond_0
    :goto_0
    return v1

    .line 1003
    :cond_1
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanelMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;

    if-nez v2, :cond_2

    .line 1004
    new-instance v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/app/ActionBarActivityDelegateBase$1;)V

    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanelMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;

    .line 1007
    :cond_2
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPanelMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelMenuPresenterCallback;

    invoke-virtual {p1, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->getListMenuView(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v0

    .line 1009
    .local v0, "menuView":Landroid/support/v7/internal/view/menu/MenuView;
    check-cast v0, Landroid/view/View;

    .end local v0    # "menuView":Landroid/support/v7/internal/view/menu/MenuView;
    iput-object v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    .line 1011
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private initializePanelDecor(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)V
    .locals 1
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .prologue
    .line 870
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mWindowDecor:Landroid/view/ViewGroup;

    iput-object v0, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->decorView:Landroid/view/ViewGroup;

    .line 871
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->setStyle(Landroid/content/Context;)V

    .line 872
    return-void
.end method

.method private initializePanelMenu(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)Z
    .locals 9
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    .prologue
    const/4 v8, 0x1

    .line 956
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    .line 959
    .local v1, "context":Landroid/content/Context;
    iget v6, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    if-eqz v6, :cond_0

    iget v6, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    const/16 v7, 0x8

    if-ne v6, v7, :cond_3

    :cond_0
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v6, :cond_3

    .line 961
    new-instance v4, Landroid/util/TypedValue;

    invoke-direct {v4}, Landroid/util/TypedValue;-><init>()V

    .line 962
    .local v4, "outValue":Landroid/util/TypedValue;
    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    .line 963
    .local v0, "baseTheme":Landroid/content/res/Resources$Theme;
    sget v6, Landroid/support/v7/appcompat/R$attr;->actionBarTheme:I

    invoke-virtual {v0, v6, v4, v8}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 965
    const/4 v5, 0x0

    .line 966
    .local v5, "widgetTheme":Landroid/content/res/Resources$Theme;
    iget v6, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v6, :cond_4

    .line 967
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    .line 968
    invoke-virtual {v5, v0}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 969
    iget v6, v4, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v5, v6, v8}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 970
    sget v6, Landroid/support/v7/appcompat/R$attr;->actionBarWidgetTheme:I

    invoke-virtual {v5, v6, v4, v8}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 977
    :goto_0
    iget v6, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v6, :cond_2

    .line 978
    if-nez v5, :cond_1

    .line 979
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    .line 980
    invoke-virtual {v5, v0}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    .line 982
    :cond_1
    iget v6, v4, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v5, v6, v8}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    .line 985
    :cond_2
    if-eqz v5, :cond_3

    .line 986
    new-instance v2, Landroid/view/ContextThemeWrapper;

    const/4 v6, 0x0

    invoke-direct {v2, v1, v6}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 987
    .end local v1    # "context":Landroid/content/Context;
    .local v2, "context":Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    move-object v1, v2

    .line 991
    .end local v0    # "baseTheme":Landroid/content/res/Resources$Theme;
    .end local v2    # "context":Landroid/content/Context;
    .end local v4    # "outValue":Landroid/util/TypedValue;
    .end local v5    # "widgetTheme":Landroid/content/res/Resources$Theme;
    .restart local v1    # "context":Landroid/content/Context;
    :cond_3
    new-instance v3, Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v3, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 992
    .local v3, "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-virtual {v3, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 993
    invoke-virtual {p1, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->setMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 995
    return v8

    .line 973
    .end local v3    # "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    .restart local v0    # "baseTheme":Landroid/content/res/Resources$Theme;
    .restart local v4    # "outValue":Landroid/util/TypedValue;
    .restart local v5    # "widgetTheme":Landroid/content/res/Resources$Theme;
    :cond_4
    sget v6, Landroid/support/v7/appcompat/R$attr;->actionBarWidgetTheme:I

    invoke-virtual {v0, v6, v4, v8}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    goto :goto_0
.end method

.method private invalidatePanelMenu(I)V
    .locals 3
    .param p1, "featureId"    # I

    .prologue
    const/4 v2, 0x1

    .line 1229
    iget v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuFeatures:I

    shl-int v1, v2, p1

    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuFeatures:I

    .line 1231
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuPosted:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mWindowDecor:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 1232
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mWindowDecor:Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuRunnable:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 1233
    iput-boolean v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuPosted:Z

    .line 1235
    :cond_0
    return-void
.end method

.method private openPanel(ILandroid/view/KeyEvent;)V
    .locals 1
    .param p1, "featureId"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 814
    if-nez p1, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorContentParent;->canShowOverflowMenu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/ViewConfigurationCompat;->hasPermanentMenuKey(Landroid/view/ViewConfiguration;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 817
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v0}, Landroid/support/v7/internal/widget/DecorContentParent;->showOverflowMenu()Z

    .line 821
    :goto_0
    return-void

    .line 819
    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->openPanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)V

    goto :goto_0
.end method

.method private openPanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)V
    .locals 9
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 825
    iget-boolean v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    if-nez v7, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 867
    :cond_0
    :goto_0
    return-void

    .line 831
    :cond_1
    iget v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    if-nez v7, :cond_2

    .line 832
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    .line 833
    .local v2, "context":Landroid/content/Context;
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 834
    .local v1, "config":Landroid/content/res/Configuration;
    iget v7, v1, Landroid/content/res/Configuration;->screenLayout:I

    and-int/lit8 v7, v7, 0xf

    const/4 v8, 0x4

    if-ne v7, v8, :cond_3

    move v4, v5

    .line 836
    .local v4, "isXLarge":Z
    :goto_1
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v7

    iget v7, v7, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/16 v8, 0xb

    if-lt v7, v8, :cond_4

    move v3, v5

    .line 839
    .local v3, "isHoneycombApp":Z
    :goto_2
    if-eqz v4, :cond_2

    if-nez v3, :cond_0

    .line 844
    .end local v1    # "config":Landroid/content/res/Configuration;
    .end local v2    # "context":Landroid/content/Context;
    .end local v3    # "isHoneycombApp":Z
    .end local v4    # "isXLarge":Z
    :cond_2
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    .line 845
    .local v0, "cb":Landroid/support/v7/internal/app/WindowCallback;
    if-eqz v0, :cond_5

    iget v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    iget-object v8, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v7, v8}, Landroid/support/v7/internal/app/WindowCallback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 847
    invoke-direct {p0, p1, v5}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    goto :goto_0

    .end local v0    # "cb":Landroid/support/v7/internal/app/WindowCallback;
    .restart local v1    # "config":Landroid/content/res/Configuration;
    .restart local v2    # "context":Landroid/content/Context;
    :cond_3
    move v4, v6

    .line 834
    goto :goto_1

    .restart local v4    # "isXLarge":Z
    :cond_4
    move v3, v6

    .line 836
    goto :goto_2

    .line 852
    .end local v1    # "config":Landroid/content/res/Configuration;
    .end local v2    # "context":Landroid/content/Context;
    .end local v4    # "isXLarge":Z
    .restart local v0    # "cb":Landroid/support/v7/internal/app/WindowCallback;
    :cond_5
    invoke-direct {p0, p1, p2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->preparePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 856
    iget-object v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->decorView:Landroid/view/ViewGroup;

    if-eqz v7, :cond_6

    iget-boolean v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshDecorView:Z

    if-eqz v7, :cond_7

    .line 857
    :cond_6
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->initializePanelDecor(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)V

    .line 861
    :cond_7
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->initializePanelContent(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->hasPanelItems()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 865
    iput-boolean v6, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isHandled:Z

    .line 866
    iput-boolean v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    goto :goto_0
.end method

.method private preparePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)Z
    .locals 8
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1015
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1105
    :cond_0
    :goto_0
    return v4

    .line 1020
    :cond_1
    iget-boolean v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    if-eqz v2, :cond_2

    move v4, v3

    .line 1021
    goto :goto_0

    .line 1024
    :cond_2
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-eq v2, p1, :cond_3

    .line 1026
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    invoke-direct {p0, v2, v4}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    .line 1029
    :cond_3
    iget v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    if-eqz v2, :cond_4

    iget v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    const/16 v5, 0x8

    if-ne v2, v5, :cond_a

    :cond_4
    move v0, v3

    .line 1032
    .local v0, "isActionBarMenu":Z
    :goto_1
    if-eqz v0, :cond_5

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_5

    .line 1035
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->setMenuPrepared()V

    .line 1039
    :cond_5
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_6

    iget-boolean v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshMenuContent:Z

    if-eqz v2, :cond_c

    .line 1040
    :cond_6
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v2, :cond_7

    .line 1041
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->initializePanelMenu(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_0

    .line 1046
    :cond_7
    if-eqz v0, :cond_9

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_9

    .line 1047
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    if-nez v2, :cond_8

    .line 1048
    new-instance v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    invoke-direct {v2, p0, v7}, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/app/ActionBarActivityDelegateBase$1;)V

    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    .line 1050
    :cond_8
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    iget-object v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    invoke-interface {v2, v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->setMenu(Landroid/view/Menu;Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 1055
    :cond_9
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1056
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v2

    iget v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    iget-object v6, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v2, v5, v6}, Landroid/support/v7/internal/app/WindowCallback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 1058
    invoke-virtual {p1, v7}, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->setMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 1060
    if-eqz v0, :cond_0

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_0

    .line 1062
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    invoke-interface {v2, v7, v3}, Landroid/support/v7/internal/widget/DecorContentParent;->setMenu(Landroid/view/Menu;Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    goto :goto_0

    .end local v0    # "isActionBarMenu":Z
    :cond_a
    move v0, v4

    .line 1029
    goto :goto_1

    .line 1068
    .restart local v0    # "isActionBarMenu":Z
    :cond_b
    iput-boolean v4, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshMenuContent:Z

    .line 1073
    :cond_c
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 1077
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenActionViewState:Landroid/os/Bundle;

    if-eqz v2, :cond_d

    .line 1078
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenActionViewState:Landroid/os/Bundle;

    invoke-virtual {v2, v5}, Landroid/support/v7/internal/view/menu/MenuBuilder;->restoreActionViewStates(Landroid/os/Bundle;)V

    .line 1079
    iput-object v7, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->frozenActionViewState:Landroid/os/Bundle;

    .line 1083
    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v2

    iget-object v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v2, v4, v7, v5}, Landroid/support/v7/internal/app/WindowCallback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v2

    if-nez v2, :cond_f

    .line 1084
    if-eqz v0, :cond_e

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_e

    .line 1087
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMenuPresenterCallback:Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionMenuPresenterCallback;

    invoke-interface {v2, v7, v3}, Landroid/support/v7/internal/widget/DecorContentParent;->setMenu(Landroid/view/Menu;Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 1089
    :cond_e
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    goto/16 :goto_0

    .line 1094
    :cond_f
    if-eqz p2, :cond_10

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v2

    :goto_2
    invoke-static {v2}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v1

    .line 1096
    .local v1, "kmap":Landroid/view/KeyCharacterMap;
    invoke-virtual {v1}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    move-result v2

    if-eq v2, v3, :cond_11

    move v2, v3

    :goto_3
    iput-boolean v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->qwertyMode:Z

    .line 1097
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-boolean v5, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->qwertyMode:Z

    invoke-virtual {v2, v5}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setQwertyMode(Z)V

    .line 1098
    iget-object v2, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 1101
    iput-boolean v3, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    .line 1102
    iput-boolean v4, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isHandled:Z

    .line 1103
    iput-object p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move v4, v3

    .line 1105
    goto/16 :goto_0

    .line 1094
    .end local v1    # "kmap":Landroid/view/KeyCharacterMap;
    :cond_10
    const/4 v2, -0x1

    goto :goto_2

    .restart local v1    # "kmap":Landroid/view/KeyCharacterMap;
    :cond_11
    move v2, v4

    .line 1096
    goto :goto_3
.end method

.method private reopenMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .locals 8
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "toggleMenuMode"    # Z

    .prologue
    const/4 v7, 0x0

    const/16 v6, 0x8

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 875
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v2, :cond_5

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->canShowOverflowMenu()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-static {v2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/view/ViewConfigurationCompat;->hasPermanentMenuKey(Landroid/view/ViewConfiguration;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->isOverflowMenuShowPending()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 879
    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    .line 881
    .local v0, "cb":Landroid/support/v7/internal/app/WindowCallback;
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->isOverflowMenuShowing()Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez p2, :cond_4

    .line 882
    :cond_1
    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 884
    iget-boolean v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuPosted:Z

    if-eqz v2, :cond_2

    iget v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuFeatures:I

    and-int/lit8 v2, v2, 0x1

    if-eqz v2, :cond_2

    .line 886
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mWindowDecor:Landroid/view/ViewGroup;

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 887
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mInvalidatePanelMenuRunnable:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    .line 890
    :cond_2
    invoke-direct {p0, v4, v5}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 894
    .local v1, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v2, :cond_3

    iget-boolean v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshMenuContent:Z

    if-nez v2, :cond_3

    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v4, v7, v2}, Landroid/support/v7/internal/app/WindowCallback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 896
    iget-object v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-interface {v0, v6, v2}, Landroid/support/v7/internal/app/WindowCallback;->onMenuOpened(ILandroid/view/Menu;)Z

    .line 897
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->showOverflowMenu()Z

    .line 916
    .end local v0    # "cb":Landroid/support/v7/internal/app/WindowCallback;
    .end local v1    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_3
    :goto_0
    return-void

    .line 901
    .restart local v0    # "cb":Landroid/support/v7/internal/app/WindowCallback;
    :cond_4
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v2}, Landroid/support/v7/internal/widget/DecorContentParent;->hideOverflowMenu()Z

    .line 902
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_3

    .line 903
    invoke-direct {p0, v4, v5}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 904
    .restart local v1    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v3, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2, v6, v3}, Landroid/support/v7/app/ActionBarActivity;->onPanelClosed(ILandroid/view/Menu;)V

    goto :goto_0

    .line 910
    .end local v0    # "cb":Landroid/support/v7/internal/app/WindowCallback;
    .end local v1    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_5
    invoke-direct {p0, v4, v5}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 912
    .restart local v1    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    iput-boolean v5, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->refreshDecorView:Z

    .line 913
    invoke-direct {p0, v1, v4}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    .line 915
    invoke-direct {p0, v1, v7}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->openPanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)V

    goto :goto_0
.end method

.method private showProgressBars(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat;)V
    .locals 3
    .param p1, "horizontalProgressBar"    # Landroid/support/v7/internal/widget/ProgressBarCompat;
    .param p2, "spinnyProgressBar"    # Landroid/support/v7/internal/widget/ProgressBarCompat;

    .prologue
    const/4 v2, 0x0

    .line 920
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 921
    invoke-virtual {p2, v2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 924
    :cond_0
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getProgress()I

    move-result v0

    const/16 v1, 0x2710

    if-ge v0, v1, :cond_1

    .line 925
    invoke-virtual {p1, v2}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 927
    :cond_1
    return-void
.end method

.method private updateProgressBars(I)V
    .locals 8
    .param p1, "value"    # I

    .prologue
    const/16 v7, 0x8

    const/16 v6, 0x2710

    const/4 v4, 0x0

    .line 775
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getCircularProgressBar()Landroid/support/v7/internal/widget/ProgressBarCompat;

    move-result-object v0

    .line 776
    .local v0, "circularProgressBar":Landroid/support/v7/internal/widget/ProgressBarCompat;
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getHorizontalProgressBar()Landroid/support/v7/internal/widget/ProgressBarCompat;

    move-result-object v1

    .line 778
    .local v1, "horizontalProgressBar":Landroid/support/v7/internal/widget/ProgressBarCompat;
    const/4 v5, -0x1

    if-ne p1, v5, :cond_4

    .line 779
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    if-eqz v5, :cond_1

    .line 780
    invoke-virtual {v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->getProgress()I

    move-result v2

    .line 781
    .local v2, "level":I
    invoke-virtual {v1}, Landroid/support/v7/internal/widget/ProgressBarCompat;->isIndeterminate()Z

    move-result v5

    if-nez v5, :cond_0

    if-ge v2, v6, :cond_3

    :cond_0
    move v3, v4

    .line 783
    .local v3, "visibility":I
    :goto_0
    invoke-virtual {v1, v3}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 785
    .end local v2    # "level":I
    .end local v3    # "visibility":I
    :cond_1
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    if-eqz v5, :cond_2

    .line 786
    invoke-virtual {v0, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 811
    :cond_2
    :goto_1
    return-void

    .line 781
    .restart local v2    # "level":I
    :cond_3
    const/4 v3, 0x4

    goto :goto_0

    .line 788
    .end local v2    # "level":I
    :cond_4
    const/4 v5, -0x2

    if-ne p1, v5, :cond_6

    .line 789
    iget-boolean v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    if-eqz v4, :cond_5

    .line 790
    invoke-virtual {v1, v7}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    .line 792
    :cond_5
    iget-boolean v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    if-eqz v4, :cond_2

    .line 793
    invoke-virtual {v0, v7}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setVisibility(I)V

    goto :goto_1

    .line 795
    :cond_6
    const/4 v5, -0x3

    if-ne p1, v5, :cond_7

    .line 796
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setIndeterminate(Z)V

    goto :goto_1

    .line 797
    :cond_7
    const/4 v5, -0x4

    if-ne p1, v5, :cond_8

    .line 798
    invoke-virtual {v1, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setIndeterminate(Z)V

    goto :goto_1

    .line 799
    :cond_8
    if-ltz p1, :cond_2

    if-gt p1, v6, :cond_2

    .line 803
    add-int/lit8 v4, p1, 0x0

    invoke-virtual {v1, v4}, Landroid/support/v7/internal/widget/ProgressBarCompat;->setProgress(I)V

    .line 805
    if-ge p1, v6, :cond_9

    .line 806
    invoke-direct {p0, v1, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->showProgressBars(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat;)V

    goto :goto_1

    .line 808
    :cond_9
    invoke-direct {p0, v1, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->hideProgressBars(Landroid/support/v7/internal/widget/ProgressBarCompat;Landroid/support/v7/internal/widget/ProgressBarCompat;)V

    goto :goto_1
.end method

.method private updateStatusGuard(I)I
    .locals 12
    .param p1, "insetTop"    # I

    .prologue
    const/4 v11, -0x1

    const/4 v7, 0x0

    .line 1271
    const/4 v6, 0x0

    .line 1273
    .local v6, "showStatusGuard":Z
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    if-eqz v8, :cond_3

    .line 1274
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v8}, Landroid/support/v7/internal/widget/ActionBarContextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    instance-of v8, v8, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v8, :cond_3

    .line 1275
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v8}, Landroid/support/v7/internal/widget/ActionBarContextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 1277
    .local v3, "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    const/4 v4, 0x0

    .line 1279
    .local v4, "mlpChanged":Z
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v8}, Landroid/support/v7/internal/widget/ActionBarContextView;->isShown()Z

    move-result v8

    if-eqz v8, :cond_8

    .line 1280
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTempRect1:Landroid/graphics/Rect;

    if-nez v8, :cond_0

    .line 1281
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTempRect1:Landroid/graphics/Rect;

    .line 1282
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    iput-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTempRect2:Landroid/graphics/Rect;

    .line 1284
    :cond_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTempRect1:Landroid/graphics/Rect;

    .line 1285
    .local v0, "insets":Landroid/graphics/Rect;
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTempRect2:Landroid/graphics/Rect;

    .line 1286
    .local v1, "localInsets":Landroid/graphics/Rect;
    invoke-virtual {v0, v7, p1, v7, v7}, Landroid/graphics/Rect;->set(IIII)V

    .line 1288
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    invoke-static {v8, v0, v1}, Landroid/support/v7/internal/widget/ViewUtils;->computeFitSystemWindows(Landroid/view/View;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    .line 1289
    iget v8, v1, Landroid/graphics/Rect;->top:I

    if-nez v8, :cond_5

    move v5, p1

    .line 1290
    .local v5, "newMargin":I
    :goto_0
    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eq v8, v5, :cond_1

    .line 1291
    const/4 v4, 0x1

    .line 1292
    iput p1, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 1294
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    if-nez v8, :cond_6

    .line 1295
    new-instance v8, Landroid/view/View;

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v8, v9}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    .line 1296
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v9}, Landroid/support/v7/app/ActionBarActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    sget v10, Landroid/support/v7/appcompat/R$color;->abc_input_method_navigation_guard:I

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getColor(I)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1298
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    new-instance v10, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v10, v11, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9, v11, v10}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 1312
    :cond_1
    :goto_1
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    if-eqz v8, :cond_7

    const/4 v6, 0x1

    .line 1318
    :goto_2
    iget-boolean v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionMode:Z

    if-nez v8, :cond_2

    if-eqz v6, :cond_2

    .line 1319
    const/4 p1, 0x0

    .line 1328
    .end local v0    # "insets":Landroid/graphics/Rect;
    .end local v1    # "localInsets":Landroid/graphics/Rect;
    .end local v5    # "newMargin":I
    :cond_2
    :goto_3
    if-eqz v4, :cond_3

    .line 1329
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v8, v3}, Landroid/support/v7/internal/widget/ActionBarContextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1333
    .end local v3    # "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v4    # "mlpChanged":Z
    :cond_3
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    if-eqz v8, :cond_4

    .line 1334
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    if-eqz v6, :cond_9

    :goto_4
    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1337
    :cond_4
    return p1

    .restart local v0    # "insets":Landroid/graphics/Rect;
    .restart local v1    # "localInsets":Landroid/graphics/Rect;
    .restart local v3    # "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    .restart local v4    # "mlpChanged":Z
    :cond_5
    move v5, v7

    .line 1289
    goto :goto_0

    .line 1302
    .restart local v5    # "newMargin":I
    :cond_6
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 1303
    .local v2, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v8, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v8, p1, :cond_1

    .line 1304
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 1305
    iget-object v8, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mStatusGuard:Landroid/view/View;

    invoke-virtual {v8, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_1

    .end local v2    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_7
    move v6, v7

    .line 1312
    goto :goto_2

    .line 1323
    .end local v0    # "insets":Landroid/graphics/Rect;
    .end local v1    # "localInsets":Landroid/graphics/Rect;
    .end local v5    # "newMargin":I
    :cond_8
    iget v8, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    if-eqz v8, :cond_2

    .line 1324
    const/4 v4, 0x1

    .line 1325
    iput v7, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    goto :goto_3

    .line 1334
    .end local v3    # "mlp":Landroid/view/ViewGroup$MarginLayoutParams;
    .end local v4    # "mlpChanged":Z
    :cond_9
    const/16 v7, 0x8

    goto :goto_4
.end method


# virtual methods
.method public addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 243
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureSubDecor()V

    .line 244
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 245
    .local v0, "contentParent":Landroid/view/ViewGroup;
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 246
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportContentChanged()V

    .line 247
    return-void
.end method

.method public createSupportActionBar()Landroid/support/v7/app/ActionBar;
    .locals 3

    .prologue
    .line 155
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureSubDecor()V

    .line 156
    new-instance v0, Landroid/support/v7/internal/app/WindowDecorActionBar;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-boolean v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionBar:Z

    invoke-direct {v0, v1, v2}, Landroid/support/v7/internal/app/WindowDecorActionBar;-><init>(Landroid/support/v7/app/ActionBarActivity;Z)V

    .line 157
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mEnableDefaultActionBarUp:Z

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setDefaultDisplayHomeAsUpEnabled(Z)V

    .line 158
    return-object v0
.end method

.method createView(Ljava/lang/String;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 752
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_1

    .line 755
    const/4 v0, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 768
    :cond_1
    const/4 v0, 0x0

    :goto_1
    return-object v0

    .line 755
    :sswitch_0
    const-string v1, "EditText"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :sswitch_1
    const-string v1, "Spinner"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :sswitch_2
    const-string v1, "CheckBox"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "RadioButton"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :sswitch_4
    const-string v1, "CheckedTextView"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    .line 757
    :pswitch_0
    new-instance v0, Landroid/support/v7/internal/widget/TintEditText;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, p2}, Landroid/support/v7/internal/widget/TintEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 759
    :pswitch_1
    new-instance v0, Landroid/support/v7/internal/widget/TintSpinner;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, p2}, Landroid/support/v7/internal/widget/TintSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 761
    :pswitch_2
    new-instance v0, Landroid/support/v7/internal/widget/TintCheckBox;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, p2}, Landroid/support/v7/internal/widget/TintCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 763
    :pswitch_3
    new-instance v0, Landroid/support/v7/internal/widget/TintRadioButton;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, p2}, Landroid/support/v7/internal/widget/TintRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 765
    :pswitch_4
    new-instance v0, Landroid/support/v7/internal/widget/TintCheckedTextView;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, p2}, Landroid/support/v7/internal/widget/TintCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_1

    .line 755
    nop

    :sswitch_data_0
    .sparse-switch
        -0x56c015e7 -> :sswitch_4
        -0x1440b607 -> :sswitch_1
        0x2e46a6ed -> :sswitch_3
        0x5f7507c3 -> :sswitch_2
        0x63577677 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method final ensureSubDecor()V
    .locals 11

    .prologue
    const v10, 0x1020002

    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 255
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecorInstalled:Z

    if-nez v5, :cond_6

    .line 256
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mHasActionBar:Z

    if-eqz v5, :cond_8

    .line 262
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 263
    .local v2, "outValue":Landroid/util/TypedValue;
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v5}, Landroid/support/v7/app/ActionBarActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    sget v6, Landroid/support/v7/appcompat/R$attr;->actionBarTheme:I

    invoke-virtual {v5, v6, v2, v9}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 266
    iget v5, v2, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_7

    .line 267
    new-instance v4, Landroid/view/ContextThemeWrapper;

    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget v6, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-direct {v4, v5, v6}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 273
    .local v4, "themedContext":Landroid/content/Context;
    :goto_0
    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Landroid/support/v7/appcompat/R$layout;->abc_screen_toolbar:I

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    .line 276
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    sget v6, Landroid/support/v7/appcompat/R$id;->decor_content_parent:I

    invoke-virtual {v5, v6}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/support/v7/internal/widget/DecorContentParent;

    iput-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    .line 278
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->setWindowCallback(Landroid/support/v7/internal/app/WindowCallback;)V

    .line 283
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionBar:Z

    if-eqz v5, :cond_0

    .line 284
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    const/16 v6, 0x9

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->initFeature(I)V

    .line 286
    :cond_0
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    if-eqz v5, :cond_1

    .line 287
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    const/4 v6, 0x2

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->initFeature(I)V

    .line 289
    :cond_1
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    if-eqz v5, :cond_2

    .line 290
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    const/4 v6, 0x5

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->initFeature(I)V

    .line 336
    .end local v2    # "outValue":Landroid/util/TypedValue;
    .end local v4    # "themedContext":Landroid/content/Context;
    :cond_2
    :goto_1
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    invoke-static {v5}, Landroid/support/v7/internal/widget/ViewUtils;->makeOptionalFitsSystemWindows(Landroid/view/View;)V

    .line 339
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    invoke-virtual {v5, v6}, Landroid/support/v7/app/ActionBarActivity;->superSetContentView(Landroid/view/View;)V

    .line 343
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v5, v10}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 344
    .local v1, "decorContent":Landroid/view/View;
    const/4 v5, -0x1

    invoke-virtual {v1, v5}, Landroid/view/View;->setId(I)V

    .line 345
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    sget v6, Landroid/support/v7/appcompat/R$id;->action_bar_activity_content:I

    invoke-virtual {v5, v6}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 346
    .local v0, "abcContent":Landroid/view/View;
    invoke-virtual {v0, v10}, Landroid/view/View;->setId(I)V

    .line 350
    instance-of v5, v1, Landroid/widget/FrameLayout;

    if-eqz v5, :cond_3

    .line 351
    check-cast v1, Landroid/widget/FrameLayout;

    .end local v1    # "decorContent":Landroid/view/View;
    invoke-virtual {v1, v7}, Landroid/widget/FrameLayout;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 355
    :cond_3
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTitleToSet:Ljava/lang/CharSequence;

    if-eqz v5, :cond_4

    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v5, :cond_4

    .line 356
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTitleToSet:Ljava/lang/CharSequence;

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/DecorContentParent;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 357
    iput-object v7, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTitleToSet:Ljava/lang/CharSequence;

    .line 360
    :cond_4
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->applyFixedSizeWindow()V

    .line 362
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->onSubDecorInstalled()V

    .line 364
    iput-boolean v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecorInstalled:Z

    .line 371
    invoke-direct {p0, v8, v8}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v3

    .line 372
    .local v3, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v5

    if-nez v5, :cond_6

    if-eqz v3, :cond_5

    iget-object v5, v3, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-nez v5, :cond_6

    .line 373
    :cond_5
    const/16 v5, 0x8

    invoke-direct {p0, v5}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->invalidatePanelMenu(I)V

    .line 376
    .end local v0    # "abcContent":Landroid/view/View;
    .end local v3    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_6
    return-void

    .line 269
    .restart local v2    # "outValue":Landroid/util/TypedValue;
    :cond_7
    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    .restart local v4    # "themedContext":Landroid/content/Context;
    goto/16 :goto_0

    .line 293
    .end local v2    # "outValue":Landroid/util/TypedValue;
    .end local v4    # "themedContext":Landroid/content/Context;
    :cond_8
    iget-boolean v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionMode:Z

    if-eqz v5, :cond_9

    .line 294
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Landroid/support/v7/appcompat/R$layout;->abc_screen_simple_overlay_action_mode:I

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    .line 301
    :goto_2
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x15

    if-lt v5, v6, :cond_a

    .line 304
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    new-instance v6, Landroid/support/v7/app/ActionBarActivityDelegateBase$2;

    invoke-direct {v6, p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase$2;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;)V

    invoke-static {v5, v6}, Landroid/support/v4/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroid/support/v4/view/OnApplyWindowInsetsListener;)V

    goto/16 :goto_1

    .line 297
    :cond_9
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    sget v6, Landroid/support/v7/appcompat/R$layout;->abc_screen_simple:I

    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    iput-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    goto :goto_2

    .line 325
    :cond_a
    iget-object v5, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecor:Landroid/view/ViewGroup;

    check-cast v5, Landroid/support/v7/internal/widget/FitWindowsViewGroup;

    new-instance v6, Landroid/support/v7/app/ActionBarActivityDelegateBase$3;

    invoke-direct {v6, p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase$3;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;)V

    invoke-interface {v5, v6}, Landroid/support/v7/internal/widget/FitWindowsViewGroup;->setOnFitSystemWindowsListener(Landroid/support/v7/internal/widget/FitWindowsViewGroup$OnFitSystemWindowsListener;)V

    goto/16 :goto_1
.end method

.method getHomeAsUpIndicatorAttrId()I
    .locals 1

    .prologue
    .line 709
    sget v0, Landroid/support/v7/appcompat/R$attr;->homeAsUpIndicator:I

    return v0
.end method

.method public onBackPressed()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 670
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v2, :cond_1

    .line 671
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v2}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 681
    :cond_0
    :goto_0
    return v1

    .line 676
    :cond_1
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 677
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->collapseActionView()Z

    move-result v2

    if-nez v2, :cond_0

    .line 681
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 188
    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mHasActionBar:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mSubDecorInstalled:Z

    if-eqz v1, :cond_0

    .line 191
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 192
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBar;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 196
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    :cond_0
    return-void
.end method

.method public onContentChanged()V
    .locals 0

    .prologue
    .line 252
    return-void
.end method

.method onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 139
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegate;->onCreate(Landroid/os/Bundle;)V

    .line 141
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mWindowDecor:Landroid/view/ViewGroup;

    .line 143
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-static {v1}, Landroid/support/v4/app/NavUtils;->getParentActivityName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 144
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 145
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-nez v0, :cond_1

    .line 146
    iput-boolean v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mEnableDefaultActionBarUp:Z

    .line 151
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    :cond_0
    :goto_0
    return-void

    .line 148
    .restart local v0    # "ab":Landroid/support/v7/app/ActionBar;
    :cond_1
    invoke-virtual {v0, v2}, Landroid/support/v7/app/ActionBar;->setDefaultDisplayHomeAsUpEnabled(Z)V

    goto :goto_0
.end method

.method public onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 498
    if-eqz p1, :cond_0

    .line 499
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/support/v7/internal/app/WindowCallback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result v0

    .line 501
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCreatePanelView(I)Landroid/view/View;
    .locals 4
    .param p1, "featureId"    # I

    .prologue
    .line 471
    const/4 v1, 0x0

    .line 474
    .local v1, "panelView":Landroid/view/View;
    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-nez v3, :cond_1

    .line 476
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    .line 477
    .local v0, "callback":Landroid/support/v7/internal/app/WindowCallback;
    if-eqz v0, :cond_0

    .line 478
    invoke-interface {v0, p1}, Landroid/support/v7/internal/app/WindowCallback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object v1

    .line 481
    :cond_0
    if-nez v1, :cond_1

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mToolbarListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    if-nez v3, :cond_1

    .line 486
    const/4 v3, 0x1

    invoke-direct {p0, p1, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v2

    .line 487
    .local v2, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->openPanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)V

    .line 488
    iget-boolean v3, v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isOpen:Z

    if-eqz v3, :cond_1

    .line 489
    iget-object v1, v2, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->shownPanelView:Landroid/view/View;

    .line 493
    .end local v0    # "callback":Landroid/support/v7/internal/app/WindowCallback;
    .end local v2    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_1
    return-object v1
.end method

.method onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 747
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->onKeyShortcut(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method onKeyShortcut(ILandroid/view/KeyEvent;)Z
    .locals 6
    .param p1, "keyCode"    # I
    .param p2, "ev"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 716
    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-eqz v4, :cond_1

    .line 717
    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v5

    invoke-virtual {p0, v4, v5, p2, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->performPanelShortcut(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;ILandroid/view/KeyEvent;I)Z

    move-result v0

    .line 719
    .local v0, "handled":Z
    if-eqz v0, :cond_1

    .line 720
    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-eqz v3, :cond_0

    .line 721
    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    iput-boolean v2, v3, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isHandled:Z

    .line 740
    .end local v0    # "handled":Z
    :cond_0
    :goto_0
    return v2

    .line 731
    :cond_1
    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mPreparedPanel:Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    if-nez v4, :cond_2

    .line 732
    invoke-direct {p0, v3, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 733
    .local v1, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    invoke-direct {p0, v1, p2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->preparePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)Z

    .line 734
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v4

    invoke-virtual {p0, v1, v4, p2, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->performPanelShortcut(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;ILandroid/view/KeyEvent;I)Z

    move-result v0

    .line 735
    .restart local v0    # "handled":Z
    iput-boolean v3, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    .line 736
    if-nez v0, :cond_0

    .end local v0    # "handled":Z
    .end local v1    # "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :cond_2
    move v2, v3

    .line 740
    goto :goto_0
.end method

.method public onMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 547
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    .line 548
    .local v0, "cb":Landroid/support/v7/internal/app/WindowCallback;
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 549
    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getRootMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v2

    invoke-direct {p0, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->findMenuPanel(Landroid/view/Menu;)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 550
    .local v1, "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v1, :cond_0

    .line 551
    iget v2, v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->featureId:I

    invoke-interface {v0, v2, p2}, Landroid/support/v7/internal/app/WindowCallback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result v2

    .line 554
    .end local v1    # "panel":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .locals 1
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 559
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->reopenMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V

    .line 560
    return-void
.end method

.method onMenuOpened(ILandroid/view/Menu;)Z
    .locals 3
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v1, 0x1

    .line 534
    const/16 v2, 0x8

    if-ne p1, v2, :cond_1

    .line 535
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 536
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 537
    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->dispatchMenuVisibilityChanged(Z)V

    .line 541
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superOnMenuOpened(ILandroid/view/Menu;)Z

    move-result v1

    goto :goto_0
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 4
    .param p1, "featureId"    # I
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v3, 0x0

    .line 514
    invoke-direct {p0, p1, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getPanelState(IZ)Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;

    move-result-object v1

    .line 515
    .local v1, "st":Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    if-eqz v1, :cond_0

    .line 517
    invoke-direct {p0, v1, v3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    .line 520
    :cond_0
    const/16 v2, 0x8

    if-ne p1, v2, :cond_2

    .line 521
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 522
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_1

    .line 523
    invoke-virtual {v0, v3}, Landroid/support/v7/app/ActionBar;->dispatchMenuVisibilityChanged(Z)V

    .line 530
    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    :cond_1
    :goto_0
    return-void

    .line 525
    :cond_2
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 528
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2, p1, p2}, Landroid/support/v7/app/ActionBarActivity;->superOnPanelClosed(ILandroid/view/Menu;)V

    goto :goto_0
.end method

.method public onPostResume()V
    .locals 2

    .prologue
    .line 208
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 209
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 210
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setShowHideAnimationEnabled(Z)V

    .line 212
    :cond_0
    return-void
.end method

.method public onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 1
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Landroid/view/Menu;

    .prologue
    .line 506
    if-eqz p1, :cond_0

    .line 507
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v7/internal/app/WindowCallback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result v0

    .line 509
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 200
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 201
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    .line 202
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->setShowHideAnimationEnabled(Z)V

    .line 204
    :cond_0
    return-void
.end method

.method onSubDecorInstalled()V
    .locals 0

    .prologue
    .line 378
    return-void
.end method

.method public onTitleChanged(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 460
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-eqz v0, :cond_0

    .line 461
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    invoke-interface {v0, p1}, Landroid/support/v7/internal/widget/DecorContentParent;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 467
    :goto_0
    return-void

    .line 462
    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 463
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBar;->setWindowTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 465
    :cond_1
    iput-object p1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mTitleToSet:Ljava/lang/CharSequence;

    goto :goto_0
.end method

.method final performPanelShortcut(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;ILandroid/view/KeyEvent;I)Z
    .locals 2
    .param p1, "st"    # Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;
    .param p4, "flags"    # I

    .prologue
    .line 1205
    invoke-virtual {p3}, Landroid/view/KeyEvent;->isSystem()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1206
    const/4 v0, 0x0

    .line 1225
    :cond_0
    :goto_0
    return v0

    .line 1209
    :cond_1
    const/4 v0, 0x0

    .line 1213
    .local v0, "handled":Z
    iget-boolean v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->isPrepared:Z

    if-nez v1, :cond_2

    invoke-direct {p0, p1, p3}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->preparePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    iget-object v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v1, :cond_3

    .line 1215
    iget-object v1, p1, Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;->menu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, p2, p3, p4}, Landroid/support/v7/internal/view/menu/MenuBuilder;->performShortcut(ILandroid/view/KeyEvent;I)Z

    move-result v0

    .line 1218
    :cond_3
    if-eqz v0, :cond_0

    .line 1220
    and-int/lit8 v1, p4, 0x1

    if-nez v1, :cond_0

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDecorContentParent:Landroid/support/v7/internal/widget/DecorContentParent;

    if-nez v1, :cond_0

    .line 1221
    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->closePanel(Landroid/support/v7/app/ActionBarActivityDelegateBase$PanelFeatureState;Z)V

    goto :goto_0
.end method

.method public setContentView(I)V
    .locals 3
    .param p1, "resId"    # I

    .prologue
    .line 225
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureSubDecor()V

    .line 226
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 227
    .local v0, "contentParent":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 228
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 229
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportContentChanged()V

    .line 230
    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 216
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureSubDecor()V

    .line 217
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 218
    .local v0, "contentParent":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 219
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 220
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportContentChanged()V

    .line 221
    return-void
.end method

.method public setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 234
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureSubDecor()V

    .line 235
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 236
    .local v0, "contentParent":Landroid/view/ViewGroup;
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 237
    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 238
    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarActivity;->onSupportContentChanged()V

    .line 239
    return-void
.end method

.method setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V
    .locals 5
    .param p1, "toolbar"    # Landroid/support/v7/widget/Toolbar;

    .prologue
    .line 163
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 164
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    instance-of v2, v0, Landroid/support/v7/internal/app/WindowDecorActionBar;

    if-eqz v2, :cond_0

    .line 165
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "This Activity already has an action bar supplied by the window decor. Do not request Window.FEATURE_ACTION_BAR and set windowActionBar to false in your theme to use a Toolbar instead."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 168
    :cond_0
    instance-of v2, v0, Landroid/support/v7/internal/app/ToolbarActionBar;

    if-eqz v2, :cond_1

    .line 170
    check-cast v0, Landroid/support/v7/internal/app/ToolbarActionBar;

    .end local v0    # "ab":Landroid/support/v7/app/ActionBar;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/app/ToolbarActionBar;->setListMenuPresenter(Landroid/support/v7/internal/view/menu/ListMenuPresenter;)V

    .line 175
    :cond_1
    new-instance v1, Landroid/support/v7/internal/app/ToolbarActionBar;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v2}, Landroid/support/v7/app/ActionBarActivity;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v3}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    iget-object v4, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mDefaultWindowCallback:Landroid/support/v7/internal/app/WindowCallback;

    invoke-direct {v1, p1, v2, v3, v4}, Landroid/support/v7/internal/app/ToolbarActionBar;-><init>(Landroid/support/v7/widget/Toolbar;Ljava/lang/CharSequence;Landroid/view/Window;Landroid/support/v7/internal/app/WindowCallback;)V

    .line 177
    .local v1, "tbab":Landroid/support/v7/internal/app/ToolbarActionBar;
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->ensureToolbarListMenuPresenter()V

    .line 178
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mToolbarListMenuPresenter:Landroid/support/v7/internal/view/menu/ListMenuPresenter;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/app/ToolbarActionBar;->setListMenuPresenter(Landroid/support/v7/internal/view/menu/ListMenuPresenter;)V

    .line 179
    invoke-virtual {p0, v1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->setSupportActionBar(Landroid/support/v7/app/ActionBar;)V

    .line 180
    invoke-virtual {v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->getWrappedWindowCallback()Landroid/support/v7/internal/app/WindowCallback;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->setWindowCallback(Landroid/support/v7/internal/app/WindowCallback;)V

    .line 181
    invoke-virtual {v1}, Landroid/support/v7/internal/app/ToolbarActionBar;->invalidateOptionsMenu()Z

    .line 182
    return-void
.end method

.method setSupportProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 704
    add-int/lit8 v0, p1, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->updateProgressBars(I)V

    .line 705
    return-void
.end method

.method setSupportProgressBarIndeterminate(Z)V
    .locals 1
    .param p1, "indeterminate"    # Z

    .prologue
    .line 698
    if-eqz p1, :cond_0

    const/4 v0, -0x3

    :goto_0
    invoke-direct {p0, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->updateProgressBars(I)V

    .line 700
    return-void

    .line 698
    :cond_0
    const/4 v0, -0x4

    goto :goto_0
.end method

.method setSupportProgressBarIndeterminateVisibility(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 692
    if-eqz p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-direct {p0, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->updateProgressBars(I)V

    .line 694
    return-void

    .line 692
    :cond_0
    const/4 v0, -0x2

    goto :goto_0
.end method

.method setSupportProgressBarVisibility(Z)V
    .locals 1
    .param p1, "visible"    # Z

    .prologue
    .line 686
    if-eqz p1, :cond_0

    const/4 v0, -0x1

    :goto_0
    invoke-direct {p0, v0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->updateProgressBars(I)V

    .line 688
    return-void

    .line 686
    :cond_0
    const/4 v0, -0x2

    goto :goto_0
.end method

.method public startSupportActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
    .locals 4
    .param p1, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    .line 564
    if-nez p1, :cond_0

    .line 565
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "ActionMode callback can not be null."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 568
    :cond_0
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v2, :cond_1

    .line 569
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v2}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 572
    :cond_1
    new-instance v1, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper;

    invoke-direct {v1, p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/view/ActionMode$Callback;)V

    .line 574
    .local v1, "wrappedCallback":Landroid/support/v7/view/ActionMode$Callback;
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 575
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_2

    .line 576
    invoke-virtual {v0, v1}, Landroid/support/v7/app/ActionBar;->startActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    .line 577
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v2, :cond_2

    .line 578
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v2, v3}, Landroid/support/v7/app/ActionBarActivity;->onSupportActionModeStarted(Landroid/support/v7/view/ActionMode;)V

    .line 582
    :cond_2
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-nez v2, :cond_3

    .line 584
    invoke-virtual {p0, v1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->startSupportActionModeFromWindow(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    .line 587
    :cond_3
    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    return-object v2
.end method

.method startSupportActionModeFromWindow(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;
    .locals 11
    .param p1, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 600
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v6, :cond_0

    .line 601
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v6}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 604
    :cond_0
    new-instance v5, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper;

    invoke-direct {v5, p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateBase$ActionModeCallbackWrapper;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;Landroid/support/v7/view/ActionMode$Callback;)V

    .line 605
    .local v5, "wrappedCallback":Landroid/support/v7/view/ActionMode$Callback;
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v0

    .line 607
    .local v0, "context":Landroid/content/Context;
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    if-nez v6, :cond_1

    .line 608
    iget-boolean v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mIsFloating:Z

    if-eqz v6, :cond_5

    .line 609
    new-instance v6, Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-direct {v6, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    .line 610
    new-instance v6, Landroid/widget/PopupWindow;

    sget v9, Landroid/support/v7/appcompat/R$attr;->actionModePopupWindowStyle:I

    invoke-direct {v6, v0, v10, v9}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    .line 612
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6, v9}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 613
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    const/4 v9, -0x1

    invoke-virtual {v6, v9}, Landroid/widget/PopupWindow;->setWidth(I)V

    .line 615
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 616
    .local v2, "heightValue":Landroid/util/TypedValue;
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v6}, Landroid/support/v7/app/ActionBarActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    sget v9, Landroid/support/v7/appcompat/R$attr;->actionBarSize:I

    invoke-virtual {v6, v9, v2, v7}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 617
    iget v6, v2, Landroid/util/TypedValue;->data:I

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v9}, Landroid/support/v7/app/ActionBarActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v1

    .line 619
    .local v1, "height":I
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6, v1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setContentHeight(I)V

    .line 620
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    const/4 v9, -0x2

    invoke-virtual {v6, v9}, Landroid/widget/PopupWindow;->setHeight(I)V

    .line 621
    new-instance v6, Landroid/support/v7/app/ActionBarActivityDelegateBase$4;

    invoke-direct {v6, p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase$4;-><init>(Landroid/support/v7/app/ActionBarActivityDelegateBase;)V

    iput-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mShowActionModePopup:Ljava/lang/Runnable;

    .line 639
    .end local v1    # "height":I
    .end local v2    # "heightValue":Landroid/util/TypedValue;
    :cond_1
    :goto_0
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    if-eqz v6, :cond_3

    .line 640
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6}, Landroid/support/v7/internal/widget/ActionBarContextView;->killMode()V

    .line 641
    new-instance v3, Landroid/support/v7/internal/view/StandaloneActionMode;

    iget-object v9, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    if-nez v6, :cond_6

    move v6, v7

    :goto_1
    invoke-direct {v3, v0, v9, v5, v6}, Landroid/support/v7/internal/view/StandaloneActionMode;-><init>(Landroid/content/Context;Landroid/support/v7/internal/widget/ActionBarContextView;Landroid/support/v7/view/ActionMode$Callback;Z)V

    .line 643
    .local v3, "mode":Landroid/support/v7/view/ActionMode;
    invoke-virtual {v3}, Landroid/support/v7/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v6

    invoke-interface {p1, v3, v6}, Landroid/support/v7/view/ActionMode$Callback;->onCreateActionMode(Landroid/support/v7/view/ActionMode;Landroid/view/Menu;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 644
    invoke-virtual {v3}, Landroid/support/v7/view/ActionMode;->invalidate()V

    .line 645
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6, v3}, Landroid/support/v7/internal/widget/ActionBarContextView;->initForMode(Landroid/support/v7/view/ActionMode;)V

    .line 646
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6, v8}, Landroid/support/v7/internal/widget/ActionBarContextView;->setVisibility(I)V

    .line 647
    iput-object v3, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    .line 648
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModePopup:Landroid/widget/PopupWindow;

    if-eqz v6, :cond_2

    .line 649
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v6}, Landroid/support/v7/app/ActionBarActivity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    iget-object v7, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mShowActionModePopup:Ljava/lang/Runnable;

    invoke-virtual {v6, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 651
    :cond_2
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    const/16 v7, 0x20

    invoke-virtual {v6, v7}, Landroid/support/v7/internal/widget/ActionBarContextView;->sendAccessibilityEvent(I)V

    .line 654
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6}, Landroid/support/v7/internal/widget/ActionBarContextView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 655
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    invoke-virtual {v6}, Landroid/support/v7/internal/widget/ActionBarContextView;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    check-cast v6, Landroid/view/View;

    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->requestApplyInsets(Landroid/view/View;)V

    .line 661
    .end local v3    # "mode":Landroid/support/v7/view/ActionMode;
    :cond_3
    :goto_2
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v6, :cond_4

    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    if-eqz v6, :cond_4

    .line 662
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v7, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v6, v7}, Landroid/support/v7/app/ActionBarActivity;->onSupportActionModeStarted(Landroid/support/v7/view/ActionMode;)V

    .line 664
    :cond_4
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    return-object v6

    .line 629
    :cond_5
    iget-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    sget v9, Landroid/support/v7/appcompat/R$id;->action_mode_bar_stub:I

    invoke-virtual {v6, v9}, Landroid/support/v7/app/ActionBarActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/support/v7/internal/widget/ViewStubCompat;

    .line 631
    .local v4, "stub":Landroid/support/v7/internal/widget/ViewStubCompat;
    if-eqz v4, :cond_1

    .line 633
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/support/v7/internal/widget/ViewStubCompat;->setLayoutInflater(Landroid/view/LayoutInflater;)V

    .line 634
    invoke-virtual {v4}, Landroid/support/v7/internal/widget/ViewStubCompat;->inflate()Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/support/v7/internal/widget/ActionBarContextView;

    iput-object v6, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionModeView:Landroid/support/v7/internal/widget/ActionBarContextView;

    goto/16 :goto_0

    .end local v4    # "stub":Landroid/support/v7/internal/widget/ViewStubCompat;
    :cond_6
    move v6, v8

    .line 641
    goto :goto_1

    .line 658
    .restart local v3    # "mode":Landroid/support/v7/view/ActionMode;
    :cond_7
    iput-object v10, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActionMode:Landroid/support/v7/view/ActionMode;

    goto :goto_2
.end method

.method public supportInvalidateOptionsMenu()V
    .locals 2

    .prologue
    .line 592
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v0

    .line 593
    .local v0, "ab":Landroid/support/v7/app/ActionBar;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/app/ActionBar;->invalidateOptionsMenu()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 596
    :goto_0
    return-void

    .line 595
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Landroid/support/v7/app/ActionBarActivityDelegateBase;->invalidatePanelMenu(I)V

    goto :goto_0
.end method

.method public supportRequestWindowFeature(I)Z
    .locals 1
    .param p1, "featureId"    # I

    .prologue
    const/4 v0, 0x1

    .line 437
    packed-switch p1, :pswitch_data_0

    .line 454
    :pswitch_0
    iget-object v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-virtual {v0, p1}, Landroid/support/v7/app/ActionBarActivity;->requestWindowFeature(I)Z

    move-result v0

    :goto_0
    return v0

    .line 439
    :pswitch_1
    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mHasActionBar:Z

    goto :goto_0

    .line 442
    :pswitch_2
    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionBar:Z

    goto :goto_0

    .line 445
    :pswitch_3
    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mOverlayActionMode:Z

    goto :goto_0

    .line 448
    :pswitch_4
    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureProgress:Z

    goto :goto_0

    .line 451
    :pswitch_5
    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarActivityDelegateBase;->mFeatureIndeterminateProgress:Z

    goto :goto_0

    .line 437
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
