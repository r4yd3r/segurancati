.class Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;
.super Ljava/lang/Object;
.source "BookmarksFragment.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$2;

.field private final synthetic val$c:Landroid/database/Cursor;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/BookmarksFragment$2;Landroid/database/Cursor;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$2;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->val$c:Landroid/database/Cursor;

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    .line 162
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$2;

    #getter for: Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->access$0(Lcom/isaacwaller/wikipedia/BookmarksFragment$2;)Lcom/isaacwaller/wikipedia/BookmarksFragment;

    move-result-object v0

    iget-object v0, v0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->val$c:Landroid/database/Cursor;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->val$c:Landroid/database/Cursor;

    const-string v3, "_id"

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->deleteBookmark(J)Z

    .line 163
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;->val$c:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    .line 164
    const/4 v0, 0x1

    return v0
.end method
