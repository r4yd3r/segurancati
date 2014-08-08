.class public Lcom/isaacwaller/wikipedia/BookmarksFragment;
.super Landroid/support/v4/app/Fragment;
.source "BookmarksFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/app/Fragment;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# instance fields
.field private c:Landroid/database/Cursor;

.field mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

.field mBookmarks:Landroid/widget/ListView;

.field mCallback:Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;

.field mSavedPages:Landroid/widget/ListView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    .line 31
    return-void
.end method

.method private initBookmarks(Landroid/widget/ListView;)V
    .locals 6
    .parameter "bookmarks"

    .prologue
    const/4 v3, 0x2

    .line 136
    new-instance v1, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    .line 137
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->open()Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->fetchBookmarks()Landroid/database/Cursor;

    move-result-object v1

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->c:Landroid/database/Cursor;

    .line 139
    new-array v5, v3, [I

    fill-array-data v5, :array_0

    .line 140
    .local v5, to:[I
    new-array v4, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "title"

    aput-object v2, v4, v1

    const/4 v1, 0x1

    const-string v2, "url"

    aput-object v2, v4, v1

    .line 142
    .local v4, from:[Ljava/lang/String;
    new-instance v0, Landroid/support/v4/widget/SimpleCursorAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f03001a

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->c:Landroid/database/Cursor;

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[I)V

    .line 143
    .local v0, adapter:Landroid/support/v4/widget/SimpleCursorAdapter;
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 144
    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 146
    new-instance v1, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/isaacwaller/wikipedia/BookmarksFragment$2;-><init>(Lcom/isaacwaller/wikipedia/BookmarksFragment;Landroid/widget/ListView;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 169
    return-void

    .line 139
    :array_0
    .array-data 0x4
        0x14t 0x0t 0x2t 0x1t
        0x15t 0x0t 0x2t 0x1t
    .end array-data
.end method

.method private initSavedPages(Landroid/widget/ListView;)V
    .locals 12
    .parameter "savedPages"

    .prologue
    const/4 v11, 0x2

    .line 87
    :try_start_0
    invoke-static {}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->getSavedPages()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .line 92
    .local v9, pages:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .local v2, items:Ljava/util/List;,"Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 102
    new-array v5, v11, [I

    fill-array-data v5, :array_0

    .line 103
    .local v5, to:[I
    new-array v4, v11, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "uri"

    aput-object v3, v4, v1

    const/4 v1, 0x1

    const-string v3, "title"

    aput-object v3, v4, v1

    .line 105
    .local v4, from:[Ljava/lang/String;
    new-instance v0, Landroid/widget/SimpleAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v3, 0x7f03001a

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 106
    .local v0, adapter:Landroid/widget/SimpleAdapter;
    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 107
    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 109
    new-instance v1, Lcom/isaacwaller/wikipedia/BookmarksFragment$1;

    invoke-direct {v1, p0, p1}, Lcom/isaacwaller/wikipedia/BookmarksFragment$1;-><init>(Lcom/isaacwaller/wikipedia/BookmarksFragment;Landroid/widget/ListView;)V

    invoke-virtual {p1, v1}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 133
    return-void

    .line 88
    .end local v0           #adapter:Landroid/widget/SimpleAdapter;
    .end local v2           #items:Ljava/util/List;,"Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    .end local v4           #from:[Ljava/lang/String;
    .end local v5           #to:[I
    .end local v9           #pages:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    :catch_0
    move-exception v6

    .line 89
    .local v6, e:Ljava/io/FileNotFoundException;
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .restart local v9       #pages:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    goto :goto_0

    .line 94
    .end local v6           #e:Ljava/io/FileNotFoundException;
    .restart local v2       #items:Ljava/util/List;,"Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;

    .line 95
    .local v8, page:Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 96
    .local v7, item:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "uri"

    iget-object v10, v8, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->uri:Landroid/net/Uri;

    invoke-interface {v7, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    const-string v3, "file"

    iget-object v10, v8, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->file:Ljava/io/File;

    invoke-interface {v7, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    const-string v3, "title"

    iget-object v10, v8, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    invoke-interface {v7, v3, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 102
    nop

    :array_0
    .array-data 0x4
        0x15t 0x0t 0x2t 0x1t
        0x14t 0x0t 0x2t 0x1t
    .end array-data
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .parameter "savedInstanceState"

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 61
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 5
    .parameter "activity"

    .prologue
    .line 46
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 49
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;

    move-object v2, v0

    iput-object v2, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mCallback:Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    return-void

    .line 50
    :catch_0
    move-exception v1

    .line 51
    .local v1, e:Ljava/lang/ClassCastException;
    new-instance v2, Ljava/lang/ClassCastException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    const-string v4, " must implement OnBookmarkSelectedListener"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 51
    invoke-direct {v2, v3}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v3, 0x0

    .line 67
    const v1, 0x7f03001b

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 68
    .local v0, view:Landroid/view/View;
    const v1, 0x7f06003e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mBookmarks:Landroid/widget/ListView;

    .line 69
    const v1, 0x7f060042

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    .line 71
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mBookmarks:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 72
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 74
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mBookmarks:Landroid/widget/ListView;

    const v2, 0x7f06003f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 75
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    const v2, 0x7f060043

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    .line 77
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mBookmarks:Landroid/widget/ListView;

    invoke-direct {p0, v1}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->initBookmarks(Landroid/widget/ListView;)V

    .line 78
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    invoke-direct {p0, v1}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->initSavedPages(Landroid/widget/ListView;)V

    .line 80
    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 199
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroy()V

    .line 200
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mAdapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->close()V

    .line 201
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .parameter
    .parameter "v"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, l:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mBookmarks:Landroid/widget/ListView;

    if-ne p1, v3, :cond_0

    .line 186
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/database/Cursor;

    .line 187
    .local v0, c:Landroid/database/Cursor;
    const-string v3, "url"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 189
    .local v2, url:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mCallback:Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;

    invoke-interface {v3, v2}, Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;->onBookmarkSelected(Ljava/lang/String;)V

    .line 195
    .end local v0           #c:Landroid/database/Cursor;
    .end local v2           #url:Ljava/lang/String;
    :goto_0
    return-void

    .line 192
    :cond_0
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    invoke-virtual {v3, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 193
    .local v1, item:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mCallback:Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;

    const-string v3, "file"

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-interface {v4, v3}, Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;->onPageSelected(Ljava/io/File;)V

    goto :goto_0
.end method

.method public refreshBookmarks()V
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->c:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->requery()Z

    .line 174
    return-void
.end method

.method public refreshPages()V
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksFragment;->mSavedPages:Landroid/widget/ListView;

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->initSavedPages(Landroid/widget/ListView;)V

    .line 179
    return-void
.end method
