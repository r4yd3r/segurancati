.class public Lcom/isaacwaller/wikipedia/ExpandedListView;
.super Landroid/widget/ListView;
.source "ExpandedListView.java"


# instance fields
.field private old_count:I

.field private params:Landroid/view/ViewGroup$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 11
    const/4 v0, 0x0

    iput v0, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->old_count:I

    .line 15
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4
    .parameter "canvas"

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->getCount()I

    move-result v1

    iget v2, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->old_count:I

    if-eq v1, v2, :cond_1

    .line 20
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->getCount()I

    move-result v1

    iput v1, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->old_count:I

    .line 21
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->params:Landroid/view/ViewGroup$LayoutParams;

    .line 22
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->getCount()I

    move-result v2

    iget v3, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->old_count:I

    if-lez v3, :cond_0

    invoke-virtual {p0, v0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    :cond_0
    mul-int/2addr v0, v2

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 23
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/ExpandedListView;->params:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p0, v0}, Lcom/isaacwaller/wikipedia/ExpandedListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/ListView;->onDraw(Landroid/graphics/Canvas;)V

    .line 27
    return-void
.end method
