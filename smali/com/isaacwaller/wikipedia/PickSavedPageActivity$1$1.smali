.class Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;
.super Ljava/lang/Object;
.source "PickSavedPageActivity.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

.field private final synthetic val$c:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;Ljava/util/Map;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->this$1:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->val$c:Ljava/util/Map;

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;)Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;
    .locals 1
    .parameter

    .prologue
    .line 65
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->this$1:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

    return-object v0
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "item"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->val$c:Ljava/util/Map;

    const-string v1, "file"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->deletePage(Ljava/io/File;)V

    .line 69
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->this$1:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

    #getter for: Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;)Lcom/isaacwaller/wikipedia/PickSavedPageActivity;

    move-result-object v0

    new-instance v1, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1$1;

    invoke-direct {v1, p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1$1;-><init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;)V

    invoke-virtual {v0, v1}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 79
    const/4 v0, 0x1

    return v0
.end method
