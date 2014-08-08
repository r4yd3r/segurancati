.class public Lcom/isaacwaller/wikipedia/PickSavedPageActivity;
.super Landroid/app/ListActivity;
.source "PickSavedPageActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/ListActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PickSavedPageActivity;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->reloadData()V

    return-void
.end method

.method private reloadData()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    .line 29
    invoke-static {}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->getSavedPages()Ljava/util/List;

    move-result-object v8

    .line 30
    .local v8, pages:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .local v2, items:Ljava/util/List;,"Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 40
    new-array v5, v10, [I

    fill-array-data v5, :array_0

    .line 41
    .local v5, to:[I
    new-array v4, v10, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "uri"

    aput-object v3, v4, v1

    const/4 v1, 0x1

    const-string v3, "title"

    aput-object v3, v4, v1

    .line 43
    .local v4, from:[Ljava/lang/String;
    new-instance v0, Landroid/widget/SimpleAdapter;

    const v3, 0x1090004

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    .line 44
    .local v0, adapter:Landroid/widget/SimpleAdapter;
    invoke-virtual {p0, v0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 45
    return-void

    .line 32
    .end local v0           #adapter:Landroid/widget/SimpleAdapter;
    .end local v4           #from:[Ljava/lang/String;
    .end local v5           #to:[I
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;

    .line 33
    .local v7, page:Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 34
    .local v6, item:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "uri"

    iget-object v9, v7, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->uri:Landroid/net/Uri;

    invoke-interface {v6, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    const-string v3, "file"

    iget-object v9, v7, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->file:Ljava/io/File;

    invoke-interface {v6, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    const-string v3, "title"

    iget-object v9, v7, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    invoke-interface {v6, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 40
    :array_0
    .array-data 0x4
        0x15t 0x0t 0x2t 0x1t
        0x14t 0x0t 0x2t 0x1t
    .end array-data
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .parameter "savedInstanceState"

    .prologue
    .line 49
    invoke-super {p0, p1}, Landroid/app/ListActivity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    :try_start_0
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->reloadData()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->getListView()Landroid/widget/ListView;

    move-result-object v1

    new-instance v2, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;

    invoke-direct {v2, p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity$1;-><init>(Lcom/isaacwaller/wikipedia/PickSavedPageActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 84
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, e:Ljava/io/FileNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 6
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3, p3}, Landroid/widget/ListView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 90
    .local v0, c:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "file"

    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 92
    .local v1, file:Ljava/io/File;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 93
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 94
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "/page.html"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 96
    const-string v3, "android.intent.action.PICK"

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 97
    const/4 v3, -0x1

    invoke-virtual {p0, v3, v2}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->setResult(ILandroid/content/Intent;)V

    .line 103
    :goto_0
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->finish()V

    .line 104
    return-void

    .line 99
    :cond_0
    const-class v3, Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v2, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 100
    invoke-virtual {p0, v2}, Lcom/isaacwaller/wikipedia/PickSavedPageActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
