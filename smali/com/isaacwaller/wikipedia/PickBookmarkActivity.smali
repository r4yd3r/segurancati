.class public Lcom/isaacwaller/wikipedia/PickBookmarkActivity;
.super Landroid/app/ListActivity;
.source "PickBookmarkActivity.java"


# instance fields
.field mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    .line 19
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/4 v2, 0x2

    .line 24
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    new-instance v1, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-direct {v1, p0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    .line 27
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->open()Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->fetchBookmarks()Landroid/database/Cursor;

    move-result-object v3

    .line 29
    .local v3, c:Landroid/database/Cursor;
    new-array v5, v2, [I

    fill-array-data v5, :array_0

    .line 30
    .local v5, to:[I
    new-array v4, v2, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "title"

    aput-object v2, v4, v1

    const/4 v1, 0x1

    const-string v2, "url"

    aput-object v2, v4, v1

    .line 32
    .local v4, from:[Ljava/lang/String;
    new-instance v0, Landroid/widget/SimpleCursorAdapter;

    const v2, 0x1090004

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 33
    .local v0, adapter:Landroid/widget/SimpleCursorAdapter;
    invoke-virtual {p0, v0}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 35
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    new-instance v2, Lcom/isaacwaller/wikipedia/PickBookmarkActivity$1;

    invoke-direct {v2, p0}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity$1;-><init>(Lcom/isaacwaller/wikipedia/PickBookmarkActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 51
    return-void

    .line 29
    nop

    :array_0
    .array-data 0x4
        0x14t 0x0t 0x2t 0x1t
        0x15t 0x0t 0x2t 0x1t
    .end array-data
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 74
    invoke-super {p0}, Landroid/app/ListActivity;->onDestroy()V

    .line 75
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->close()V

    .line 76
    return-void
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 5
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 55
    invoke-virtual {p1, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 56
    .local v0, c:Landroid/database/Cursor;
    const-string v3, "url"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, url:Ljava/lang/String;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 59
    .local v1, intent:Landroid/content/Intent;
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 60
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 62
    const-string v3, "android.intent.action.PICK"

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 63
    const/4 v3, -0x1

    invoke-virtual {p0, v3, v1}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->setResult(ILandroid/content/Intent;)V

    .line 69
    :goto_0
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->finish()V

    .line 70
    return-void

    .line 65
    :cond_0
    const-class v3, Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 66
    invoke-virtual {p0, v1}, Lcom/isaacwaller/wikipedia/PickBookmarkActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
