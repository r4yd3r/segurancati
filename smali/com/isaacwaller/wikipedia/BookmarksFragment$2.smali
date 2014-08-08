.class Lcom/isaacwaller/wikipedia/BookmarksFragment$2;
.super Ljava/lang/Object;
.source "BookmarksFragment.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/BookmarksFragment;->initBookmarks(Landroid/widget/ListView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;

.field private final synthetic val$bookmarks:Landroid/widget/ListView;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/BookmarksFragment;Landroid/widget/ListView;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->val$bookmarks:Landroid/widget/ListView;

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/BookmarksFragment$2;)Lcom/isaacwaller/wikipedia/BookmarksFragment;
    .locals 1
    .parameter

    .prologue
    .line 146
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->this$0:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    return-object v0
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 4
    .parameter "menu"
    .parameter "v"
    .parameter "menuInfo1"

    .prologue
    .line 149
    move-object v1, p3

    check-cast v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;

    .line 150
    .local v1, menuInfo:Landroid/widget/AdapterView$AdapterContextMenuInfo;,"Landroid/widget/AdapterView$AdapterContextMenuInfo;"
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;->val$bookmarks:Landroid/widget/ListView;

    iget v3, v1, Landroid/widget/AdapterView$AdapterContextMenuInfo;->position:I

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 152
    .local v0, c:Landroid/database/Cursor;
    const-string v2, "title"

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    .line 153
    const v2, 0x7f0b0060

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->add(I)Landroid/view/MenuItem;

    move-result-object v2

    new-instance v3, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$1;

    invoke-direct {v3, p0, v1}, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$1;-><init>(Lcom/isaacwaller/wikipedia/BookmarksFragment$2;Landroid/widget/AdapterView$AdapterContextMenuInfo;)V

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 160
    const v2, 0x7f0b001e

    invoke-interface {p1, v2}, Landroid/view/ContextMenu;->add(I)Landroid/view/MenuItem;

    move-result-object v2

    new-instance v3, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;

    invoke-direct {v3, p0, v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment$2$2;-><init>(Lcom/isaacwaller/wikipedia/BookmarksFragment$2;Landroid/database/Cursor;)V

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 167
    return-void
.end method
