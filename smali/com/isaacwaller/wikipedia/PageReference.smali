.class public Lcom/isaacwaller/wikipedia/PageReference;
.super Ljava/lang/Object;
.source "PageReference.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/PageReference$LoadResult;,
        Lcom/isaacwaller/wikipedia/PageReference$PageType;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType:[I


# instance fields
.field mData:Ljava/lang/String;

.field mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

.field mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;


# direct methods
.method static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()[I
    .locals 3

    .prologue
    .line 24
    sget-object v0, Lcom/isaacwaller/wikipedia/PageReference;->$SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->values()[Lcom/isaacwaller/wikipedia/PageReference$PageType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_1
    :try_start_1
    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->OFFLINE_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_2
    :try_start_2
    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->SEARCH_RESULTS:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_3
    :try_start_3
    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_4
    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference;->$SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V
    .locals 0
    .parameter "mType"
    .parameter "mWiki"
    .parameter "mData"

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 59
    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    .line 60
    iput-object p3, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    .line 61
    return-void
.end method

.method public static final fromUrl(Landroid/content/Context;Landroid/net/Uri;)Lcom/isaacwaller/wikipedia/PageReference;
    .locals 7
    .parameter "c"
    .parameter "uri"

    .prologue
    const/4 v6, 0x0

    .line 115
    const-string v3, "file"

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 116
    new-instance v3, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v4, Lcom/isaacwaller/wikipedia/PageReference$PageType;->OFFLINE_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v6, v5}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    .line 129
    :goto_0
    return-object v3

    .line 119
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    .line 120
    .local v1, pathSegments:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\."

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aget-object v3, v3, v4

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->createWikipedia(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    .line 122
    .local v2, wiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 124
    new-instance v3, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v4, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-direct {v3, v4, v2, v6}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    goto :goto_0

    .line 127
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 129
    .local v0, articleName:Ljava/lang/String;
    new-instance v3, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v4, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-direct {v3, v4, v2, v0}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static final fromUrl(Landroid/content/Context;Ljava/lang/String;)Lcom/isaacwaller/wikipedia/PageReference;
    .locals 1
    .parameter "c"
    .parameter "url"

    .prologue
    .line 134
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Landroid/net/Uri;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/isaacwaller/wikipedia/PageReference$PageType;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    return-object v0
.end method

.method public getWiki()Lcom/isaacwaller/wikipedia/newloader/Wiki;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    return-object v0
.end method

.method public loadPage(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/PageReference$LoadResult;
    .locals 5
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;-><init>(Lcom/isaacwaller/wikipedia/PageReference$LoadResult;)V

    .line 78
    .local v2, result:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;
    invoke-static {}, Lcom/isaacwaller/wikipedia/PageReference;->$SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()[I

    move-result-object v3

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v4}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 102
    :goto_0
    return-object v2

    .line 80
    :pswitch_0
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-static {v3, p1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->makeHomePage(Lcom/isaacwaller/wikipedia/newloader/Wiki;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    goto :goto_0

    .line 83
    :pswitch_1
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-static {p1, v3, v4}, Lcom/isaacwaller/wikipedia/pageparser/SearchResultsPrinter;->doFullTextSearch(Landroid/content/Context;Ljava/lang/String;Lcom/isaacwaller/wikipedia/newloader/Wiki;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    goto :goto_0

    .line 87
    :pswitch_2
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-static {v3, v4}, Lcom/isaacwaller/wikipedia/newloader/PageLoader;->loadPage(Ljava/lang/String;Lcom/isaacwaller/wikipedia/newloader/Wiki;)Lcom/isaacwaller/wikipedia/newloader/Page;

    move-result-object v1

    .line 89
    .local v1, page:Lcom/isaacwaller/wikipedia/newloader/Page;
    invoke-static {p1, v1}, Lcom/isaacwaller/wikipedia/pageparser/PagePrinter;->pageToHtml(Landroid/content/Context;Lcom/isaacwaller/wikipedia/newloader/Page;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    .line 90
    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/newloader/Page;->getLanglinks()Ljava/util/Map;

    move-result-object v3

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->langlinks:Ljava/util/Map;

    goto :goto_0

    .line 96
    .end local v1           #page:Lcom/isaacwaller/wikipedia/newloader/Page;
    :pswitch_3
    new-instance v0, Ljava/io/File;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 98
    .local v0, f:Ljava/io/File;
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    goto :goto_0

    .line 78
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 142
    invoke-static {}, Lcom/isaacwaller/wikipedia/PageReference;->$SWITCH_TABLE$com$isaacwaller$wikipedia$PageReference$PageType()[I

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 148
    :pswitch_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 144
    :pswitch_1
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getServer()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "wiki"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 146
    :pswitch_2
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PageReference;->mWiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getServer()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
