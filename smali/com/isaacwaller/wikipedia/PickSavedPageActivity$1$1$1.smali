.class Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1$1;
.super Ljava/lang/Object;
.source "PickSavedPageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->onMenuItemClick(Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1$1;->this$2:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 72
    :try_start_0
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1$1;->this$2:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;

    #getter for: Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->this$1:Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;->access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;)Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

    move-result-object v1

    #getter for: Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;)Lcom/isaacwaller/wikipedia/PickSavedPageActivity;

    move-result-object v1

    #calls: Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->reloadData()V
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    return-void

    .line 73
    :catch_0
    move-exception v0

    .line 74
    .local v0, e:Ljava/io/FileNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
