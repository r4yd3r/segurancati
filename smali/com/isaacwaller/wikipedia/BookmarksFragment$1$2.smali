.class Lcom/isaacwaller/wikipedia/BookmarksFragment$1$2;
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

.field private final synthetic val$item:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/BookmarksFragment$1;Ljava/util/Map;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$2;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$2;->val$item:Ljava/util/Map;

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "_item"

    .prologue
    .line 126
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$2;->val$item:Ljava/util/Map;

    const-string v1, "file"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->deletePage(Ljava/io/File;)V

    .line 127
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$1$2;->this$1:Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    #getter for: Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment$1;->access$0(Lcom/isaacwaller/wikipedia/BookmarksFragment$1;)Lcom/isaacwaller/wikipedia/BookmarksFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->refreshPages()V

    .line 128
    const/4 v0, 0x1

    return v0
.end method
