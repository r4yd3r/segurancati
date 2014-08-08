.class public Lcom/isaacwaller/wikipedia/QueueFragment;
.super Landroid/support/v4/app/ListFragment;
.source "QueueFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/QueueFragment$OnQueueItemSelectedListener;
    }
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mQueue:Lorg/json/JSONArray;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 28
    invoke-direct {p0}, Landroid/support/v4/app/ListFragment;-><init>()V

    .line 35
    iput-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    .line 36
    iput-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    .line 28
    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/QueueFragment;)Lorg/json/JSONArray;
    .locals 1
    .parameter

    .prologue
    .line 35
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    return-object v0
.end method

.method static synthetic access$1(Lcom/isaacwaller/wikipedia/QueueFragment;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 105
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/QueueFragment;->remove(I)V

    return-void
.end method

.method static synthetic access$2(Lcom/isaacwaller/wikipedia/QueueFragment;)V
    .locals 0
    .parameter

    .prologue
    .line 116
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->refreshList()V

    return-void
.end method

.method private initList(Landroid/widget/ListView;)V
    .locals 4
    .parameter "list"

    .prologue
    .line 72
    new-instance v0, Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f03001a

    const v3, 0x1020014

    invoke-direct {v0, v1, v2, v3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;II)V

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    .line 73
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->refreshList()V

    .line 74
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0, v0}, Lcom/isaacwaller/wikipedia/QueueFragment;->setListAdapter(Landroid/widget/ListAdapter;)V

    .line 76
    new-instance v0, Lcom/isaacwaller/wikipedia/QueueFragment$1;

    invoke-direct {v0, p0, p1}, Lcom/isaacwaller/wikipedia/QueueFragment$1;-><init>(Lcom/isaacwaller/wikipedia/QueueFragment;Landroid/widget/ListView;)V

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 103
    return-void
.end method

.method private refreshData()V
    .locals 5

    .prologue
    .line 135
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const-string v4, "queue.json"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v3

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Lorg/json/JSONTokener;)V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    :goto_0
    return-void

    .line 136
    :catch_0
    move-exception v0

    .line 137
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    goto :goto_0
.end method

.method private refreshList()V
    .locals 5

    .prologue
    .line 118
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->clear()V

    .line 119
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v1, v2, :cond_1

    .line 127
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 128
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    const v4, 0x7f0b005f

    invoke-virtual {v3, v4}, Landroid/support/v4/app/FragmentActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 130
    :cond_0
    return-void

    .line 121
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v4, v1}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/isaacwaller/wikipedia/HomeScreenShortcutActivity;->getArticleNameFromURL(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 119
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 122
    :catch_0
    move-exception v0

    .line 123
    .local v0, e:Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1
.end method

.method private remove(I)V
    .locals 3
    .parameter "remove"

    .prologue
    .line 107
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 108
    .local v1, n:Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 113
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    .line 114
    return-void

    .line 109
    :cond_0
    if-eq v0, p1, :cond_1

    .line 110
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v2, v0}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 108
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private saveData()V
    .locals 5

    .prologue
    .line 145
    :try_start_0
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-string v3, "queue.json"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/support/v4/app/FragmentActivity;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    .line 146
    .local v1, out:Ljava/io/OutputStream;
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .end local v1           #out:Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 147
    :catch_0
    move-exception v0

    .line 149
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public addToQueue(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 157
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->saveData()V

    .line 158
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->refreshList()V

    .line 159
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    const/4 v4, 0x0

    .line 58
    const v2, 0x7f03001e

    const/4 v3, 0x0

    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 59
    .local v1, view:Landroid/view/View;
    const v2, 0x102000a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    .line 61
    .local v0, list:Landroid/widget/ListView;
    invoke-virtual {v0, v4}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 62
    const v2, 0x7f03001f

    invoke-virtual {p1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;)V

    .line 64
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->refreshData()V

    .line 65
    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/QueueFragment;->initList(Landroid/widget/ListView;)V

    .line 67
    return-object v1
.end method

.method public onListItemClick(Landroid/widget/ListView;Landroid/view/View;IJ)V
    .locals 3
    .parameter "l"
    .parameter "v"
    .parameter "position"
    .parameter "id"

    .prologue
    .line 41
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-le p3, v0, :cond_0

    .line 44
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    .line 45
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->saveData()V

    .line 46
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->refreshList()V

    .line 52
    :goto_0
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/QueueFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/QueueFragment$OnQueueItemSelectedListener;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/QueueFragment;->mQueue:Lorg/json/JSONArray;

    add-int/lit8 v2, p3, -0x1

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/isaacwaller/wikipedia/QueueFragment$OnQueueItemSelectedListener;->onQueueItemSelected(Ljava/lang/String;)V

    goto :goto_0
.end method
