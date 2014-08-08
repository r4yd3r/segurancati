.class Lcom/isaacwaller/wikipedia/QueueFragment$1$2;
.super Ljava/lang/Object;
.source "QueueFragment.java"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/QueueFragment$1;->onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/QueueFragment$1;

.field private final synthetic val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/QueueFragment$1;Landroid/widget/AdapterView$AdapterContextMenuInfo;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;->this$1:Lcom/isaacwaller/wikipedia/QueueFragment$1;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .parameter "_item"

    .prologue
    .line 96
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;->this$1:Lcom/isaacwaller/wikipedia/QueueFragment$1;

    #getter for: Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/QueueFragment$1;->access$0(Lcom/isaacwaller/wikipedia/QueueFragment$1;)Lcom/isaacwaller/wikipedia/QueueFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;->val$menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;

    iget v1, v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    add-int/lit8 v1, v1, -0x1

    #calls: Lcom/isaacwaller/wikipedia/QueueFragment;->remove(I)V
    invoke-static {v0, v1}, Lcom/isaacwaller/wikipedia/QueueFragment;->access$1(Lcom/isaacwaller/wikipedia/QueueFragment;I)V

    .line 97
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;->this$1:Lcom/isaacwaller/wikipedia/QueueFragment$1;

    #getter for: Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/QueueFragment$1;->access$0(Lcom/isaacwaller/wikipedia/QueueFragment$1;)Lcom/isaacwaller/wikipedia/QueueFragment;

    move-result-object v0

    #calls: Lcom/isaacwaller/wikipedia/QueueFragment;->refreshList()V
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/QueueFragment;->access$2(Lcom/isaacwaller/wikipedia/QueueFragment;)V

    .line 98
    const/4 v0, 0x1

    return v0
.end method
