.class Lcom/isaacwaller/wikipedia/QueueFragment$1;
.super Ljava/lang/Object;
.source "QueueFragment.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/QueueFragment;->initList(Landroid/widget/ListView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/QueueFragment;

.field private final synthetic val$list:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/QueueFragment;Landroid/widget/ListView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->val$list:Landroid/widget/ListView;

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/QueueFragment$1;)Lcom/isaacwaller/wikipedia/QueueFragment;
    .locals 1
    .parameter

    .prologue
    .line 76
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;

    return-object v0
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 6
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo1"

    .prologue
    .line 81
    move-object v1, p3

    check-cast v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 82
    .local v1, menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;

    #getter for: Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;
    invoke-static {v3}, Lcom/isaacwaller/wikipedia/QueueFragment;->access$0(Lcom/isaacwaller/wikipedia/QueueFragment;)Lorg/json/JSONArray;

    move-result-object v3

    iget v4, v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, item:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->this$0:Lcom/isaacwaller/wikipedia/QueueFragment;

    invoke-virtual {v3}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/isaacwaller/wikipedia/HomeScreenShortcutActivity;->getArticleNameFromURL(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, title:Ljava/lang/String;
    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 86
    const v3, 0x7f0b0060

    invoke-interface {p1, v3}, Landroid/view/ContextMenu;->add(I)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v4, Lcom/isaacwaller/wikipedia/QueueFragment$1$1;

    iget-object v5, p0, Lcom/isaacwaller/wikipedia/QueueFragment$1;->val$list:Landroid/widget/ListView;

    invoke-direct {v4, p0, v5, v1}, Lcom/isaacwaller/wikipedia/QueueFragment$1$1;-><init>(Lcom/isaacwaller/wikipedia/QueueFragment$1;Landroid/widget/ListView;Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 93
    const v3, 0x7f0b001e

    invoke-interface {p1, v3}, Landroid/view/ContextMenu;->add(I)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v4, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;

    invoke-direct {v4, p0, v1}, Lcom/isaacwaller/wikipedia/QueueFragment$1$2;-><init>(Lcom/isaacwaller/wikipedia/QueueFragment$1;Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 101
    return-void
.end method
