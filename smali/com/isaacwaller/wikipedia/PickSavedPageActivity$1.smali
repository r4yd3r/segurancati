.class Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;
.super Ljava/lang/Object;
.source "PickSavedPageActivity.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;)Lcom/isaacwaller/wikipedia/PickSavedPageActivity;
    .locals 1
    .parameter

    .prologue
    .line 57
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;

    return-object v0
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 4
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo1"

    .prologue
    .line 61
    move-object v1, p3

    check-cast v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 62
    .local v1, menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;->this$0:Lcom/isaacwaller/wikipedia/PickSavedPageActivity;

    invoke-virtual {v2}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->getListView()Landroid/widget/ListView;

    move-result-object v2

    iget v3, v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 64
    .local v0, c:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "title"

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 65
    const v2, 0x7f0b001e

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->add(I)Landroid/view/MenuItem;

    move-result-object v2

    new-instance v3, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;

    invoke-direct {v3, p0, v0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1$1;-><init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;Ljava/util/Map;)V

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 82
    return-void
.end method
