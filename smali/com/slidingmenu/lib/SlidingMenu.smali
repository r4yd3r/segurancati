.class public Lcom/slidingmenu/lib/SlidingMenu;
.super Landroid/widget/RelativeLayout;
.source "SlidingMenu.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;,
        Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;,
        Lcom/slidingmenu/lib/SlidingMenu$OnClosedListener;,
        Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;,
        Lcom/slidingmenu/lib/SlidingMenu$OnOpenedListener;,
        Lcom/slidingmenu/lib/SlidingMenu$SavedState;
    }
.end annotation


# static fields
.field public static final LEFT:I = 0x0

.field public static final LEFT_RIGHT:I = 0x2

.field public static final RIGHT:I = 0x1

.field public static final SLIDING_CONTENT:I = 0x1

.field public static final SLIDING_WINDOW:I = 0x0

.field public static final TOUCHMODE_FULLSCREEN:I = 0x1

.field public static final TOUCHMODE_MARGIN:I = 0x0

.field public static final TOUCHMODE_NONE:I = 0x2


# instance fields
.field private mCloseListener:Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;

.field private mOpenListener:Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;

.field private mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

.field private mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;


# direct methods
.method public constructor <init>(Landroid/app/Activity;I)V
    .locals 1
    .parameter "activity"
    .parameter "slideStyle"

    .prologue
    .line 171
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/slidingmenu/lib/SlidingMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 172
    invoke-virtual {p0, p1, p2}, Lcom/slidingmenu/lib/SlidingMenu;->attachToActivity(Landroid/app/Activity;I)V

    .line 173
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 161
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/slidingmenu/lib/SlidingMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 162
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/slidingmenu/lib/SlidingMenu;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 183
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 21
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    .line 193
    invoke-direct/range {p0 .. p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 195
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x1

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v4, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 196
    .local v4, behindParams:Landroid/widget/RelativeLayout$LayoutParams;
    new-instance v19, Lcom/slidingmenu/lib/CustomViewBehind;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/slidingmenu/lib/CustomViewBehind;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    .line 197
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v4}, Lcom/slidingmenu/lib/SlidingMenu;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 198
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v19, -0x1

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v3, v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 199
    .local v3, aboveParams:Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v19, 0xb

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 200
    new-instance v19, Lcom/slidingmenu/lib/CustomViewAbove;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/slidingmenu/lib/CustomViewAbove;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    .line 201
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Lcom/slidingmenu/lib/SlidingMenu;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/slidingmenu/lib/CustomViewAbove;->setCustomViewBehind(Lcom/slidingmenu/lib/CustomViewBehind;)V

    .line 204
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Lcom/slidingmenu/lib/CustomViewBehind;->setCustomViewAbove(Lcom/slidingmenu/lib/CustomViewAbove;)V

    .line 205
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    move-object/from16 v19, v0

    new-instance v20, Lcom/slidingmenu/lib/SlidingMenu$1;

    invoke-direct/range {v20 .. v21}, Lcom/slidingmenu/lib/SlidingMenu$1;-><init>(Lcom/slidingmenu/lib/SlidingMenu;)V

    invoke-virtual/range {v19 .. v20}, Lcom/slidingmenu/lib/CustomViewAbove;->setOnPageChangeListener(Lcom/slidingmenu/lib/CustomViewAbove$OnPageChangeListener;)V

    .line 222
    sget-object v19, Lcom/slidingmenu/lib/R$styleable;->SlidingMenu:[I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v14

    .line 224
    .local v14, ta:Landroid/content/res/TypedArray;
    const/16 v19, 0x0

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v7

    .line 225
    .local v7, mode:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/slidingmenu/lib/SlidingMenu;->setMode(I)V

    .line 226
    const/16 v19, 0x1

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v16

    .line 227
    .local v16, viewAbove:I
    const/16 v19, -0x1

    move/from16 v0, v16

    move/from16 v1, v19

    if-eq v0, v1, :cond_0

    .line 228
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(I)V

    .line 232
    :goto_0
    const/16 v19, 0x2

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v17

    .line 233
    .local v17, viewBehind:I
    const/16 v19, -0x1

    move/from16 v0, v17

    move/from16 v1, v19

    if-eq v0, v1, :cond_1

    .line 234
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setMenu(I)V

    .line 238
    :goto_1
    const/16 v19, 0x6

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v15

    .line 239
    .local v15, touchModeAbove:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/slidingmenu/lib/SlidingMenu;->setTouchModeAbove(I)V

    .line 241
    const/16 v19, 0x3

    const/high16 v20, -0x4080

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v19

    move/from16 v0, v19

    float-to-int v8, v0

    .line 242
    .local v8, offsetBehind:I
    const/16 v19, 0x4

    const/high16 v20, -0x4080

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v19

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v18, v0

    .line 243
    .local v18, widthBehind:I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v8, v0, :cond_2

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_2

    .line 244
    new-instance v19, Ljava/lang/IllegalStateException;

    const-string v20, "Cannot set both behindOffset and behindWidth for a SlidingMenu"

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 230
    .end local v8           #offsetBehind:I
    .end local v15           #touchModeAbove:I
    .end local v17           #viewBehind:I
    .end local v18           #widthBehind:I
    :cond_0
    new-instance v19, Landroid/widget/FrameLayout;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(Landroid/view/View;)V

    goto :goto_0

    .line 236
    .restart local v17       #viewBehind:I
    :cond_1
    new-instance v19, Landroid/widget/FrameLayout;

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setMenu(Landroid/view/View;)V

    goto :goto_1

    .line 245
    .restart local v8       #offsetBehind:I
    .restart local v15       #touchModeAbove:I
    .restart local v18       #widthBehind:I
    :cond_2
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v8, v0, :cond_5

    .line 246
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindOffset(I)V

    .line 251
    :goto_2
    const/16 v19, 0x5

    const v20, 0x3ea8f5c3

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v9

    .line 252
    .local v9, scrollOffsetBehind:F
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindScrollScale(F)V

    .line 253
    const/16 v19, 0x7

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v12

    .line 254
    .local v12, shadowRes:I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v12, v0, :cond_3

    .line 255
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowDrawable(I)V

    .line 257
    :cond_3
    const/16 v19, 0x8

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v19

    move/from16 v0, v19

    float-to-int v13, v0

    .line 258
    .local v13, shadowWidth:I
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowWidth(I)V

    .line 259
    const/16 v19, 0x9

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    .line 260
    .local v6, fadeEnabled:Z
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/slidingmenu/lib/SlidingMenu;->setFadeEnabled(Z)V

    .line 261
    const/16 v19, 0xa

    const v20, 0x3f28f5c3

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    .line 262
    .local v5, fadeDeg:F
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/slidingmenu/lib/SlidingMenu;->setFadeDegree(F)V

    .line 263
    const/16 v19, 0xb

    const/16 v20, 0x0

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v10

    .line 264
    .local v10, selectorEnabled:Z
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/slidingmenu/lib/SlidingMenu;->setSelectorEnabled(Z)V

    .line 265
    const/16 v19, 0xc

    const/16 v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v14, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v11

    .line 266
    .local v11, selectorRes:I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v11, v0, :cond_4

    .line 267
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/slidingmenu/lib/SlidingMenu;->setSelectorDrawable(I)V

    .line 268
    :cond_4
    invoke-virtual {v14}, Landroid/content/res/TypedArray;->recycle()V

    .line 269
    return-void

    .line 247
    .end local v5           #fadeDeg:F
    .end local v6           #fadeEnabled:Z
    .end local v9           #scrollOffsetBehind:F
    .end local v10           #selectorEnabled:Z
    .end local v11           #selectorRes:I
    .end local v12           #shadowRes:I
    .end local v13           #shadowWidth:I
    :cond_5
    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-eq v0, v1, :cond_6

    .line 248
    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindWidth(I)V

    goto/16 :goto_2

    .line 250
    :cond_6
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindOffset(I)V

    goto/16 :goto_2
.end method

.method static synthetic access$0(Lcom/slidingmenu/lib/SlidingMenu;)Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;
    .locals 1
    .parameter

    .prologue
    .line 63
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mOpenListener:Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;

    return-object v0
.end method

.method static synthetic access$1(Lcom/slidingmenu/lib/SlidingMenu;)Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;
    .locals 1
    .parameter

    .prologue
    .line 65
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mCloseListener:Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;

    return-object v0
.end method


# virtual methods
.method public addIgnoredView(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 791
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->addIgnoredView(Landroid/view/View;)V

    .line 792
    return-void
.end method

.method public attachToActivity(Landroid/app/Activity;I)V
    .locals 11
    .parameter "activity"
    .parameter "slideStyle"

    .prologue
    const/4 v7, 0x1

    const/4 v10, -0x1

    const/4 v9, 0x0

    .line 272
    if-eqz p2, :cond_0

    if-eq p2, v7, :cond_0

    .line 273
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "slideStyle must be either SLIDING_WINDOW or SLIDING_CONTENT"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 275
    :cond_0
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getParent()Landroid/view/ViewParent;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 276
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "This SlidingMenu appears to already be attached"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 279
    :cond_1
    invoke-virtual {p1}, Landroid/app/Activity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    new-array v7, v7, [I

    const v8, 0x1010054

    aput v8, v7, v9

    invoke-virtual {v6, v7}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 280
    .local v0, a:Landroid/content/res/TypedArray;
    invoke-virtual {v0, v9, v9}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 281
    .local v1, background:I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 283
    packed-switch p2, :pswitch_data_0

    .line 305
    :cond_2
    :goto_0
    return-void

    .line 285
    :pswitch_0
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    .line 286
    .local v4, decor:Landroid/view/ViewGroup;
    invoke-virtual {v4, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/view/ViewGroup;

    .line 288
    .local v5, decorChild:Landroid/view/ViewGroup;
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->setBackgroundResource(I)V

    .line 289
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 290
    invoke-virtual {p0, v5}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(Landroid/view/View;)V

    .line 291
    invoke-virtual {v4, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    .line 295
    .end local v4           #decor:Landroid/view/ViewGroup;
    .end local v5           #decorChild:Landroid/view/ViewGroup;
    :pswitch_1
    const v6, 0x1020002

    invoke-virtual {p1, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 296
    .local v2, content:Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 297
    .local v3, contentParent:Landroid/view/ViewGroup;
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 298
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v6, v10, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, p0, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 299
    invoke-virtual {p0, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(Landroid/view/View;)V

    .line 301
    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    if-nez v6, :cond_2

    .line 302
    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    .line 283
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public clearIgnoredViews()V
    .locals 1

    .prologue
    .line 807
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->clearIgnoredViews()V

    .line 808
    return-void
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .locals 5
    .parameter "insets"

    .prologue
    .line 917
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 918
    .local v1, leftPadding:I
    iget v2, p1, Landroid/graphics/Rect;->right:I

    .line 919
    .local v2, rightPadding:I
    iget v3, p1, Landroid/graphics/Rect;->top:I

    .line 920
    .local v3, topPadding:I
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    .line 921
    .local v0, bottomPadding:I
    invoke-virtual {p0, v1, v3, v2, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setPadding(IIII)V

    .line 922
    const/4 v4, 0x1

    return v4
.end method

.method public getBehindOffset()I
    .locals 1

    .prologue
    .line 540
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewBehind;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v0, v0, Landroid/widget/RelativeLayout$LayoutParams;->rightMargin:I

    return v0
.end method

.method public getBehindScrollScale()F
    .locals 1

    .prologue
    .line 627
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewBehind;->getScrollScale()F

    move-result v0

    return v0
.end method

.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 332
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->getContent()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getMenu()Landroid/view/View;
    .locals 1

    .prologue
    .line 359
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewBehind;->getContent()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 424
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewBehind;->getMode()I

    move-result v0

    return v0
.end method

.method public getSecondaryMenu()Landroid/view/View;
    .locals 1

    .prologue
    .line 386
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewBehind;->getSecondaryContent()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getTouchModeAbove()I
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->getTouchMode()I

    move-result v0

    return v0
.end method

.method public isMenuShowing()Z
    .locals 2

    .prologue
    .line 522
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->getCurrentItem()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isSecondaryMenuShowing()Z
    .locals 2

    .prologue
    .line 531
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSlidingEnabled()Z
    .locals 1

    .prologue
    .line 405
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/CustomViewAbove;->isSlidingEnabled()Z

    move-result v0

    return v0
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 2
    .parameter "state"

    .prologue
    .line 897
    instance-of v1, p1, Lcom/slidingmenu/lib/SlidingMenu$SavedState;

    if-nez v1, :cond_0

    .line 898
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 910
    :goto_0
    return-void

    :cond_0
    move-object v0, p1

    .line 902
    check-cast v0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;

    .line 903
    .local v0, ss:Lcom/slidingmenu/lib/SlidingMenu$SavedState;
    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/RelativeLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 905
    #getter for: Lcom/slidingmenu/lib/SlidingMenu$SavedState;->mBehindShowing:Z
    invoke-static {v0}, Lcom/slidingmenu/lib/SlidingMenu$SavedState;->access$1(Lcom/slidingmenu/lib/SlidingMenu$SavedState;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 906
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->showMenu()V

    goto :goto_0

    .line 908
    :cond_1
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    goto :goto_0
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .prologue
    .line 887
    invoke-super {p0}, Landroid/widget/RelativeLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 888
    .local v1, superState:Landroid/os/Parcelable;
    new-instance v0, Lcom/slidingmenu/lib/SlidingMenu$SavedState;

    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->isMenuShowing()Z

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/slidingmenu/lib/SlidingMenu$SavedState;-><init>(Landroid/os/Parcelable;Z)V

    .line 889
    .local v0, ss:Lcom/slidingmenu/lib/SlidingMenu$SavedState;
    return-object v0
.end method

.method public removeIgnoredView(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 800
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->removeIgnoredView(Landroid/view/View;)V

    .line 801
    return-void
.end method

.method public setAboveOffset(I)V
    .locals 1
    .parameter "i"

    .prologue
    .line 574
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setAboveOffset(I)V

    .line 575
    return-void
.end method

.method public setAboveOffsetRes(I)V
    .locals 2
    .parameter "resID"

    .prologue
    .line 583
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v0, v1

    .line 584
    .local v0, i:I
    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setAboveOffset(I)V

    .line 585
    return-void
.end method

.method public setBehindCanvasTransformer(Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;)V
    .locals 1
    .parameter "t"

    .prologue
    .line 648
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setCanvasTransformer(Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;)V

    .line 649
    return-void
.end method

.method public setBehindOffset(I)V
    .locals 1
    .parameter "i"

    .prologue
    .line 554
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setWidthOffset(I)V

    .line 555
    return-void
.end method

.method public setBehindOffsetRes(I)V
    .locals 2
    .parameter "resID"

    .prologue
    .line 564
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v0, v1

    .line 565
    .local v0, i:I
    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindOffset(I)V

    .line 566
    return-void
.end method

.method public setBehindScrollScale(F)V
    .locals 2
    .parameter "f"

    .prologue
    .line 637
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    const/high16 v0, 0x3f80

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    .line 638
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ScrollScale must be between 0 and 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 639
    :cond_0
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setScrollScale(F)V

    .line 640
    return-void
.end method

.method public setBehindWidth(I)V
    .locals 9
    .parameter "i"

    .prologue
    .line 595
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "window"

    invoke-virtual {v7, v8}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/WindowManager;

    .line 596
    invoke-interface {v7}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    .line 598
    .local v1, display:Landroid/view/Display;
    :try_start_0
    const-class v0, Landroid/view/Display;

    .line 599
    .local v0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v7, 0x1

    new-array v5, v7, [Ljava/lang/Class;

    const/4 v7, 0x0

    const-class v8, Landroid/graphics/Point;

    aput-object v8, v5, v7

    .line 600
    .local v5, parameterTypes:[Ljava/lang/Class;
    new-instance v4, Landroid/graphics/Point;

    invoke-direct {v4}, Landroid/graphics/Point;-><init>()V

    .line 601
    .local v4, parameter:Landroid/graphics/Point;
    const-string v7, "getSize"

    invoke-virtual {v0, v7, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 602
    .local v3, method:Ljava/lang/reflect/Method;
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    invoke-virtual {v3, v1, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 603
    iget v6, v4, Landroid/graphics/Point;->x:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 607
    .end local v0           #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v3           #method:Ljava/lang/reflect/Method;
    .end local v4           #parameter:Landroid/graphics/Point;
    .end local v5           #parameterTypes:[Ljava/lang/Class;
    .local v6, width:I
    :goto_0
    sub-int v7, v6, p1

    invoke-virtual {p0, v7}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindOffset(I)V

    .line 608
    return-void

    .line 604
    .end local v6           #width:I
    :catch_0
    move-exception v2

    .line 605
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Landroid/view/Display;->getWidth()I

    move-result v6

    .restart local v6       #width:I
    goto :goto_0
.end method

.method public setBehindWidthRes(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 617
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v0, v1

    .line 618
    .local v0, i:I
    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindWidth(I)V

    .line 619
    return-void
.end method

.method public setContent(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(Landroid/view/View;)V

    .line 315
    return-void
.end method

.method public setContent(Landroid/view/View;)V
    .locals 1
    .parameter "view"

    .prologue
    .line 323
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setContent(Landroid/view/View;)V

    .line 324
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 325
    return-void
.end method

.method public setFadeDegree(F)V
    .locals 1
    .parameter "f"

    .prologue
    .line 746
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setFadeDegree(F)V

    .line 747
    return-void
.end method

.method public setFadeEnabled(Z)V
    .locals 1
    .parameter "b"

    .prologue
    .line 736
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setFadeEnabled(Z)V

    .line 737
    return-void
.end method

.method public setMenu(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 342
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setMenu(Landroid/view/View;)V

    .line 343
    return-void
.end method

.method public setMenu(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 351
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setContent(Landroid/view/View;)V

    .line 352
    return-void
.end method

.method public setMode(I)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 413
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 414
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "SlidingMenu mode must be LEFT, RIGHT, or LEFT_RIGHT"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 416
    :cond_0
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setMode(I)V

    .line 417
    return-void
.end method

.method public setOnCloseListener(Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 827
    iput-object p1, p0, Lcom/slidingmenu/lib/SlidingMenu;->mCloseListener:Lcom/slidingmenu/lib/SlidingMenu$OnCloseListener;

    .line 828
    return-void
.end method

.method public setOnClosedListener(Lcom/slidingmenu/lib/SlidingMenu$OnClosedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 845
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setOnClosedListener(Lcom/slidingmenu/lib/SlidingMenu$OnClosedListener;)V

    .line 846
    return-void
.end method

.method public setOnOpenListener(Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;)V
    .locals 0
    .parameter "listener"

    .prologue
    .line 817
    iput-object p1, p0, Lcom/slidingmenu/lib/SlidingMenu;->mOpenListener:Lcom/slidingmenu/lib/SlidingMenu$OnOpenListener;

    .line 818
    return-void
.end method

.method public setOnOpenedListener(Lcom/slidingmenu/lib/SlidingMenu$OnOpenedListener;)V
    .locals 1
    .parameter "listener"

    .prologue
    .line 836
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setOnOpenedListener(Lcom/slidingmenu/lib/SlidingMenu$OnOpenedListener;)V

    .line 837
    return-void
.end method

.method public setSecondaryMenu(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 368
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setSecondaryMenu(Landroid/view/View;)V

    .line 369
    return-void
.end method

.method public setSecondaryMenu(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 377
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setSecondaryContent(Landroid/view/View;)V

    .line 379
    return-void
.end method

.method public setSecondaryShadowDrawable(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 700
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setSecondaryShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 701
    return-void
.end method

.method public setSecondaryShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 709
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setSecondaryShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 710
    return-void
.end method

.method public setSelectedView(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 764
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setSelectedView(Landroid/view/View;)V

    .line 765
    return-void
.end method

.method public setSelectorBitmap(Landroid/graphics/Bitmap;)V
    .locals 1
    .parameter "b"

    .prologue
    .line 782
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setSelectorBitmap(Landroid/graphics/Bitmap;)V

    .line 783
    return-void
.end method

.method public setSelectorDrawable(I)V
    .locals 2
    .parameter "res"

    .prologue
    .line 773
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/CustomViewAbove;->setSelectorBitmap(Landroid/graphics/Bitmap;)V

    .line 774
    return-void
.end method

.method public setSelectorEnabled(Z)V
    .locals 2
    .parameter "b"

    .prologue
    .line 755
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/CustomViewAbove;->setSelectorEnabled(Z)V

    .line 756
    return-void
.end method

.method public setShadowDrawable(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 682
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 683
    return-void
.end method

.method public setShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .parameter "d"

    .prologue
    .line 691
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setShadowDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 692
    return-void
.end method

.method public setShadowWidth(I)V
    .locals 1
    .parameter "pixels"

    .prologue
    .line 727
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->setShadowWidth(I)V

    .line 728
    return-void
.end method

.method public setShadowWidthRes(I)V
    .locals 1
    .parameter "resId"

    .prologue
    .line 718
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowWidth(I)V

    .line 719
    return-void
.end method

.method public setSlidingEnabled(Z)V
    .locals 1
    .parameter "b"

    .prologue
    .line 396
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setSlidingEnabled(Z)V

    .line 397
    return-void
.end method

.method public setStatic(Z)V
    .locals 3
    .parameter "b"

    .prologue
    const/4 v2, 0x1

    .line 433
    if-eqz p1, :cond_0

    .line 434
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->setSlidingEnabled(Z)V

    .line 435
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/CustomViewAbove;->setCustomViewBehind(Lcom/slidingmenu/lib/CustomViewBehind;)V

    .line 436
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, v2}, Lcom/slidingmenu/lib/CustomViewAbove;->setCurrentItem(I)V

    .line 444
    :goto_0
    return-void

    .line 439
    :cond_0
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, v2}, Lcom/slidingmenu/lib/CustomViewAbove;->setCurrentItem(I)V

    .line 441
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    iget-object v1, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewBehind:Lcom/slidingmenu/lib/CustomViewBehind;

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/CustomViewAbove;->setCustomViewBehind(Lcom/slidingmenu/lib/CustomViewBehind;)V

    .line 442
    invoke-virtual {p0, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setSlidingEnabled(Z)V

    goto :goto_0
.end method

.method public setTouchModeAbove(I)V
    .locals 2
    .parameter "i"

    .prologue
    .line 668
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    if-eqz p1, :cond_0

    .line 669
    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    .line 670
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "TouchMode must be set to eitherTOUCHMODE_FULLSCREEN or TOUCHMODE_MARGIN or TOUCHMODE_NONE."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 673
    :cond_0
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v0, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setTouchMode(I)V

    .line 674
    return-void
.end method

.method public showContent()V
    .locals 1

    .prologue
    .line 484
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent(Z)V

    .line 485
    return-void
.end method

.method public showContent(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 493
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setCurrentItem(IZ)V

    .line 494
    return-void
.end method

.method public showMenu()V
    .locals 1

    .prologue
    .line 450
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->showMenu(Z)V

    .line 451
    return-void
.end method

.method public showMenu(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 459
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setCurrentItem(IZ)V

    .line 460
    return-void
.end method

.method public showSecondaryMenu()V
    .locals 1

    .prologue
    .line 467
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->showSecondaryMenu(Z)V

    .line 468
    return-void
.end method

.method public showSecondaryMenu(Z)V
    .locals 2
    .parameter "animate"

    .prologue
    .line 477
    iget-object v0, p0, Lcom/slidingmenu/lib/SlidingMenu;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1}, Lcom/slidingmenu/lib/CustomViewAbove;->setCurrentItem(IZ)V

    .line 478
    return-void
.end method

.method public toggle()V
    .locals 1

    .prologue
    .line 500
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/SlidingMenu;->toggle(Z)V

    .line 501
    return-void
.end method

.method public toggle(Z)V
    .locals 1
    .parameter "animate"

    .prologue
    .line 509
    invoke-virtual {p0}, Lcom/slidingmenu/lib/SlidingMenu;->isMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 510
    invoke-virtual {p0, p1}, Lcom/slidingmenu/lib/SlidingMenu;->showContent(Z)V

    .line 514
    :goto_0
    return-void

    .line 512
    :cond_0
    invoke-virtual {p0, p1}, Lcom/slidingmenu/lib/SlidingMenu;->showMenu(Z)V

    goto :goto_0
.end method
