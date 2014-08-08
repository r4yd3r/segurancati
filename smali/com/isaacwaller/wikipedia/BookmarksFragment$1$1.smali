.class Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;
.super Ljava/lang/Object;
.source "BookmarksFragment.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

.field private final synthetic val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/BookmarksFragment$1;Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 6
    .parameter "_item"

    .prologue
    .line 119
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    #getter for: Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->access$0(Lcom/isaacwaller/wikipedia/BookmarksFragment$1;)Lcom/isaacwaller/wikipedia/BookmarksFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    #getter for: Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->access$0(Lcom/isaacwaller/wikipedia/BookmarksFragment$1;)Lcom/isaacwaller/wikipedia/BookmarksFragment;

    move-result-object v1

    iget-object v1, v1, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-object v2, v2, Landroid/widget/AdapterView$AdapterContextMenuInfo;->targetView:Landroid/view/View;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget v3, v3, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$1;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget-wide v4, v4, Landroid/widget/AdapterView$AdapterContextMenuInfo;->id:J

    invoke-virtual/range {v0 .. v5}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 120
    const/4 v0, 0x1

    return v0
.end method
