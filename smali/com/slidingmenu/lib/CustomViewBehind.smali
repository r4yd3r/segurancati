.class public Lcom/slidingmenu/lib/CustomViewBehind;
.super Landroid/view/ViewGroup;
.source "CustomViewBehind.java"


# static fields
.field private static final MARGIN_THRESHOLD:I = 0x14

.field private static final TAG:Ljava/lang/String; = "CustomViewBehind"


# instance fields
.field private mChildrenEnabled:Z

.field private mContent:Landroid/view/View;

.field private mFadeDegree:F

.field private mFadeEnabled:Z

.field private final mFadePaint:Landroid/graphics/Paint;

.field private mMarginThreshold:I

.field private mMode:I

.field private mScrollScale:F

.field private mSecondaryContent:Landroid/view/View;

.field private mSecondaryShadowDrawable:Landroid/graphics/drawable/Drawable;

.field private mShadowDrawable:Landroid/graphics/drawable/Drawable;

.field private mShadowWidth:I

.field private mTransformer:Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;

.field private mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

.field private mWidthOffset:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/slidingmenu/lib/CustomViewBehind;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 139
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadePaint:Landroid/graphics/Paint;

    .line 37
    const/4 v0, 0x1

    .line 38
    const/high16 v1, 0x41a0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    .line 37
    invoke-static {v0, v1, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMarginThreshold:I

    .line 39
    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2
    .parameter "canvas"

    .prologue
    .line 107
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mTransformer:Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 109
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mTransformer:Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;

    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    invoke-virtual {v1}, Lcom/slidingmenu/lib/CustomViewAbove;->getPercentOpen()F

    move-result v1

    invoke-interface {v0, p1, v1}, Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;->transformCanvas(Landroid/graphics/Canvas;F)V

    .line 110
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 111
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 114
    :goto_0
    return-void

    .line 113
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    goto :goto_0
.end method

.method public drawFade(Landroid/view/View;Landroid/graphics/Canvas;F)V
    .locals 9
    .parameter "content"
    .parameter "canvas"
    .parameter "openPercent"

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 326
    iget-boolean v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadeEnabled:Z

    if-nez v0, :cond_0

    .line 345
    :goto_0
    return-void

    .line 327
    :cond_0
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadeDegree:F

    const/high16 v1, 0x437f

    mul-float/2addr v0, v1

    const/high16 v1, 0x3f80

    sub-float/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    mul-float/2addr v0, v1

    float-to-int v6, v0

    .line 328
    .local v6, alpha:I
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadePaint:Landroid/graphics/Paint;

    invoke-static {v6, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 329
    const/4 v7, 0x0

    .line 330
    .local v7, left:I
    const/4 v8, 0x0

    .line 331
    .local v8, right:I
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v0, :cond_2

    .line 332
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    sub-int v7, v0, v1

    .line 333
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v8

    .line 344
    :cond_1
    :goto_1
    int-to-float v1, v7

    int-to-float v3, v8

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadePaint:Landroid/graphics/Paint;

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 334
    :cond_2
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_3

    .line 335
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v7

    .line 336
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int v8, v0, v1

    .line 337
    goto :goto_1

    :cond_3
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 338
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    sub-int v7, v0, v1

    .line 339
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v8

    .line 340
    int-to-float v1, v7

    int-to-float v3, v8

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadePaint:Landroid/graphics/Paint;

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 341
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v7

    .line 342
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int v8, v0, v1

    goto :goto_1
.end method

.method public drawShadow(Landroid/view/View;Landroid/graphics/Canvas;)V
    .locals 5
    .parameter "content"
    .parameter "canvas"

    .prologue
    const/4 v4, 0x0

    .line 307
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    if-gtz v1, :cond_1

    .line 323
    :cond_0
    :goto_0
    return-void

    .line 308
    :cond_1
    const/4 v0, 0x0

    .line 309
    .local v0, left:I
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v1, :cond_3

    .line 310
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    sub-int v0, v1, v2

    .line 321
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    add-int/2addr v2, v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getHeight()I

    move-result v3

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 322
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    .line 311
    :cond_3
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_4

    .line 312
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    .line 313
    goto :goto_1

    :cond_4
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 314
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryShadowDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_5

    .line 315
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    .line 316
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryShadowDrawable:Landroid/graphics/drawable/Drawable;

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    add-int/2addr v2, v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getHeight()I

    move-result v3

    invoke-virtual {v1, v0, v4, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 317
    iget-object v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryShadowDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 319
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    sub-int v0, v1, v2

    goto :goto_1
.end method

.method public getAbsLeftBound(Landroid/view/View;)I
    .locals 2
    .parameter "content"

    .prologue
    .line 244
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 245
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    sub-int/2addr v0, v1

    .line 249
    :goto_0
    return v0

    .line 246
    :cond_1
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    .line 247
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    goto :goto_0

    .line 249
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAbsRightBound(Landroid/view/View;)I
    .locals 2
    .parameter "content"

    .prologue
    .line 253
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v0, :cond_0

    .line 254
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 258
    :goto_0
    return v0

    .line 255
    :cond_0
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 256
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 258
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getBehindWidth()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    return v0
.end method

.method public getContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    return-object v0
.end method

.method public getMenuLeft(Landroid/view/View;I)I
    .locals 2
    .parameter "content"
    .parameter "page"

    .prologue
    .line 228
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v0, :cond_0

    .line 229
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    sub-int/2addr v0, v1

    .line 240
    :goto_0
    return v0

    .line 230
    :cond_0
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 231
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 232
    :cond_1
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 233
    packed-switch p2, :pswitch_data_0

    .line 240
    :cond_2
    :pswitch_0
    const/4 v0, 0x0

    goto :goto_0

    .line 235
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0

    .line 237
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_0

    .line 233
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public getMenuPage(I)I
    .locals 4
    .parameter "page"

    .prologue
    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v3, 0x1

    .line 194
    if-le p1, v3, :cond_1

    move p1, v0

    .line 195
    :cond_0
    :goto_0
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v2, :cond_2

    if-le p1, v3, :cond_2

    .line 200
    :goto_1
    return v1

    .line 194
    :cond_1
    if-ge p1, v3, :cond_0

    move p1, v1

    goto :goto_0

    .line 197
    :cond_2
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v1, v3, :cond_3

    if-ge p1, v3, :cond_3

    move v1, v0

    .line 198
    goto :goto_1

    :cond_3
    move v1, p1

    .line 200
    goto :goto_1
.end method

.method public getMode()I
    .locals 1

    .prologue
    .line 157
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    return v0
.end method

.method public getScrollScale()F
    .locals 1

    .prologue
    .line 165
    iget v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    return v0
.end method

.method public getSecondaryContent()Landroid/view/View;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    return-object v0
.end method

.method public marginTouchAllowed(Landroid/view/View;I)Z
    .locals 6
    .parameter "content"
    .parameter "x"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 262
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 263
    .local v0, left:I
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    .line 264
    .local v1, right:I
    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v4, :cond_2

    .line 265
    if-lt p2, v0, :cond_1

    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMarginThreshold:I

    add-int/2addr v4, v0

    if-gt p2, v4, :cond_1

    .line 272
    :cond_0
    :goto_0
    return v2

    :cond_1
    move v2, v3

    .line 265
    goto :goto_0

    .line 266
    :cond_2
    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v4, v2, :cond_4

    .line 267
    if-gt p2, v1, :cond_3

    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMarginThreshold:I

    sub-int v4, v1, v4

    if-ge p2, v4, :cond_0

    :cond_3
    move v2, v3

    goto :goto_0

    .line 268
    :cond_4
    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_7

    .line 269
    if-lt p2, v0, :cond_5

    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMarginThreshold:I

    add-int/2addr v4, v0

    if-le p2, v4, :cond_0

    .line 270
    :cond_5
    if-gt p2, v1, :cond_6

    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMarginThreshold:I

    sub-int v4, v1, v4

    .line 269
    if-ge p2, v4, :cond_0

    :cond_6
    move v2, v3

    goto :goto_0

    :cond_7
    move v2, v3

    .line 272
    goto :goto_0
.end method

.method public menuClosedSlideAllowed(F)Z
    .locals 4
    .parameter "dx"

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 285
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v2, :cond_2

    .line 286
    cmpl-float v2, p1, v3

    if-lez v2, :cond_1

    .line 292
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 286
    goto :goto_0

    .line 287
    :cond_2
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v2, v0, :cond_3

    .line 288
    cmpg-float v2, p1, v3

    if-ltz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 289
    :cond_3
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    move v0, v1

    .line 292
    goto :goto_0
.end method

.method public menuOpenSlideAllowed(F)Z
    .locals 4
    .parameter "dx"

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 296
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v2, :cond_2

    .line 297
    cmpg-float v2, p1, v3

    if-gez v2, :cond_1

    .line 303
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 297
    goto :goto_0

    .line 298
    :cond_2
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v2, v0, :cond_3

    .line 299
    cmpl-float v2, p1, v3

    if-gtz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 300
    :cond_3
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    move v0, v1

    .line 303
    goto :goto_0
.end method

.method public menuOpenTouchAllowed(Landroid/view/View;II)Z
    .locals 4
    .parameter "content"
    .parameter "currPage"
    .parameter "x"

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 276
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v2, v3, :cond_2

    if-nez p2, :cond_2

    .line 277
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    if-lt p3, v2, :cond_1

    move v0, v1

    .line 281
    :cond_1
    :goto_0
    return v0

    .line 278
    :cond_2
    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-eq v2, v1, :cond_3

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-ne v2, v3, :cond_1

    if-ne p2, v3, :cond_1

    .line 279
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v2

    if-gt p3, v2, :cond_1

    move v0, v1

    goto :goto_0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 97
    const/4 v0, 0x0

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 5
    .parameter "changed"
    .parameter "l"
    .parameter "t"
    .parameter "r"
    .parameter "b"

    .prologue
    const/4 v4, 0x0

    .line 118
    sub-int v1, p4, p2

    .line 119
    .local v1, width:I
    sub-int v0, p5, p3

    .line 120
    .local v0, height:I
    iget-object v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    iget v3, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mWidthOffset:I

    sub-int v3, v1, v3

    invoke-virtual {v2, v4, v4, v3, v0}, Landroid/view/View;->layout(IIII)V

    .line 121
    iget-object v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    if-eqz v2, :cond_0

    .line 122
    iget-object v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    iget v3, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mWidthOffset:I

    sub-int v3, v1, v3

    invoke-virtual {v2, v4, v4, v3, v0}, Landroid/view/View;->layout(IIII)V

    .line 123
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    const/4 v5, 0x0

    .line 127
    invoke-static {v5, p1}, Lcom/slidingmenu/lib/CustomViewBehind;->getDefaultSize(II)I

    move-result v3

    .line 128
    .local v3, width:I
    invoke-static {v5, p2}, Lcom/slidingmenu/lib/CustomViewBehind;->getDefaultSize(II)I

    move-result v2

    .line 129
    .local v2, height:I
    invoke-virtual {p0, v3, v2}, Lcom/slidingmenu/lib/CustomViewBehind;->setMeasuredDimension(II)V

    .line 130
    iget v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mWidthOffset:I

    sub-int v4, v3, v4

    invoke-static {p1, v5, v4}, Lcom/slidingmenu/lib/CustomViewBehind;->getChildMeasureSpec(III)I

    move-result v1

    .line 131
    .local v1, contentWidth:I
    invoke-static {p2, v5, v2}, Lcom/slidingmenu/lib/CustomViewBehind;->getChildMeasureSpec(III)I

    move-result v0

    .line 132
    .local v0, contentHeight:I
    iget-object v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    invoke-virtual {v4, v1, v0}, Landroid/view/View;->measure(II)V

    .line 133
    iget-object v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    if-eqz v4, :cond_0

    .line 134
    iget-object v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    invoke-virtual {v4, v1, v0}, Landroid/view/View;->measure(II)V

    .line 135
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .parameter "e"

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mChildrenEnabled:Z

    return v0
.end method

.method public scrollBehindTo(Landroid/view/View;II)V
    .locals 5
    .parameter "content"
    .parameter "x"
    .parameter "y"

    .prologue
    const/16 v2, 0x8

    const/4 v3, 0x0

    .line 205
    const/4 v0, 0x0

    .line 206
    .local v0, vis:I
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    if-nez v1, :cond_2

    .line 207
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-lt p2, v1, :cond_0

    const/16 v0, 0x8

    .line 208
    :cond_0
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int/2addr v1, p2

    int-to-float v1, v1

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {p0, v1, p3}, Lcom/slidingmenu/lib/CustomViewBehind;->scrollTo(II)V

    .line 224
    :cond_1
    :goto_0
    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/CustomViewBehind;->setVisibility(I)V

    .line 225
    return-void

    .line 209
    :cond_2
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v4, 0x1

    if-ne v1, v4, :cond_4

    .line 210
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-gt p2, v1, :cond_3

    const/16 v0, 0x8

    .line 211
    :cond_3
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    .line 212
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    iget v3, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 211
    invoke-virtual {p0, v1, p3}, Lcom/slidingmenu/lib/CustomViewBehind;->scrollTo(II)V

    goto :goto_0

    .line 213
    :cond_4
    iget v1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 214
    iget-object v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-lt p2, v1, :cond_5

    move v1, v2

    :goto_1
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 215
    iget-object v4, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-gt p2, v1, :cond_6

    move v1, v2

    :goto_2
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    .line 216
    if-nez p2, :cond_7

    move v0, v2

    .line 217
    :goto_3
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-gt p2, v1, :cond_8

    .line 218
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    add-int/2addr v1, p2

    int-to-float v1, v1

    iget v2, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    invoke-virtual {p0, v1, p3}, Lcom/slidingmenu/lib/CustomViewBehind;->scrollTo(II)V

    goto :goto_0

    :cond_5
    move v1, v3

    .line 214
    goto :goto_1

    :cond_6
    move v1, v3

    .line 215
    goto :goto_2

    :cond_7
    move v0, v3

    .line 216
    goto :goto_3

    .line 220
    :cond_8
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    .line 221
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->getBehindWidth()I

    move-result v2

    sub-int v2, p2, v2

    int-to-float v2, v2

    iget v3, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    .line 220
    invoke-virtual {p0, v1, p3}, Lcom/slidingmenu/lib/CustomViewBehind;->scrollTo(II)V

    goto :goto_0
.end method

.method public scrollTo(II)V
    .locals 1
    .parameter "x"
    .parameter "y"

    .prologue
    .line 90
    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->scrollTo(II)V

    .line 91
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mTransformer:Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;

    if-eqz v0, :cond_0

    .line 92
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->invalidate()V

    .line 93
    :cond_0
    return-void
.end method

.method public setCanvasTransformer(Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;)V
    .locals 0
    .parameter "t"

    .prologue
    .line 46
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mTransformer:Lcom/slidingmenu/lib/SlidingMenu$CanvasTransformer;

    .line 47
    return-void
.end method

.method public setChildrenEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mChildrenEnabled:Z

    .line 86
    return-void
.end method

.method public setContent(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 59
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 60
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/CustomViewBehind;->removeView(Landroid/view/View;)V

    .line 61
    :cond_0
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    .line 62
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/CustomViewBehind;->addView(Landroid/view/View;)V

    .line 63
    return-void
.end method

.method public setCustomViewAbove(Lcom/slidingmenu/lib/CustomViewAbove;)V
    .locals 0
    .parameter "customViewAbove"

    .prologue
    .line 42
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mViewAbove:Lcom/slidingmenu/lib/CustomViewAbove;

    .line 43
    return-void
.end method

.method public setFadeDegree(F)V
    .locals 2
    .parameter "degree"

    .prologue
    .line 188
    const/high16 v0, 0x3f80

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    .line 189
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The BehindFadeDegree must be between 0.0f and 1.0f"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_1
    iput p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadeDegree:F

    .line 191
    return-void
.end method

.method public setFadeEnabled(Z)V
    .locals 0
    .parameter "b"

    .prologue
    .line 184
    iput-boolean p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mFadeEnabled:Z

    .line 185
    return-void
.end method

.method public setMode(I)V
    .locals 2
    .parameter "mode"

    .prologue
    .line 147
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 149
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mContent:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 150
    :cond_1
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 151
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 153
    :cond_2
    iput p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mMode:I

    .line 154
    return-void
.end method

.method public setScrollScale(F)V
    .locals 0
    .parameter "scrollScale"

    .prologue
    .line 161
    iput p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mScrollScale:F

    .line 162
    return-void
.end method

.method public setSecondaryContent(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 74
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/CustomViewBehind;->removeView(Landroid/view/View;)V

    .line 76
    :cond_0
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    .line 77
    iget-object v0, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/slidingmenu/lib/CustomViewBehind;->addView(Landroid/view/View;)V

    .line 78
    return-void
.end method

.method public setSecondaryShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "shadow"

    .prologue
    .line 174
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mSecondaryShadowDrawable:Landroid/graphics/drawable/Drawable;

    .line 175
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->invalidate()V

    .line 176
    return-void
.end method

.method public setShadowDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter "shadow"

    .prologue
    .line 169
    iput-object p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowDrawable:Landroid/graphics/drawable/Drawable;

    .line 170
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->invalidate()V

    .line 171
    return-void
.end method

.method public setShadowWidth(I)V
    .locals 0
    .parameter "width"

    .prologue
    .line 179
    iput p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mShadowWidth:I

    .line 180
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->invalidate()V

    .line 181
    return-void
.end method

.method public setWidthOffset(I)V
    .locals 0
    .parameter "i"

    .prologue
    .line 50
    iput p1, p0, Lcom/slidingmenu/lib/CustomViewBehind;->mWidthOffset:I

    .line 51
    invoke-virtual {p0}, Lcom/slidingmenu/lib/CustomViewBehind;->requestLayout()V

    .line 52
    return-void
.end method
