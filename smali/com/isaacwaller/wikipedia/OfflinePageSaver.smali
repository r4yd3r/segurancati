.class public Lcom/isaacwaller/wikipedia/OfflinePageSaver;
.super Ljava/lang/Object;
.source "OfflinePageSaver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/OfflinePageSaver$BadPageTypeException;,
        Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;,
        Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;
    }
.end annotation


# static fields
.field private static final ABSOLUTE_REPLACEMENT_END:Ljava/lang/String; = "/_res/$2\"$3"

.field private static final ABSOLUTE_URL_PATTERN:Ljava/lang/String; = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']http://(.*?)[\\\"\\\'](.*?>)"

.field private static final DOUBLERELATIVE_REPLACEMENT_END:Ljava/lang/String; = "/_res/$2\"$3"

.field private static final DOUBLERELATIVE_URL_PATTERN:Ljava/lang/String; = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']//(.*?)[\\\"\\\'](.*?>)"

.field private static final RELATIVE_REPLACEMENT_END:Ljava/lang/String; = "/_res/en.m.wikipedia.org/$2\"$3"

.field private static final RELATIVE_URL_PATTERN:Ljava/lang/String; = "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']/[^/](.*?)[\\\"\\\'](.*?>)"

.field private static final REPLACEMENT_START:Ljava/lang/String; = "$1=\"content://com.isaacwaller.wikidroid.offlinepages/"

.field public static final SAVE_DIR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/Wikidroid Saved Pages/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->SAVE_DIR:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static delete(Ljava/io/File;)V
    .locals 5
    .parameter "file"

    .prologue
    .line 179
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 180
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_1

    .line 182
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 183
    return-void

    .line 180
    :cond_1
    aget-object v0, v2, v1

    .local v0, filename:Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->delete(Ljava/io/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static deletePage(Ljava/io/File;)V
    .locals 3
    .parameter "pageFile"

    .prologue
    .line 187
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/_res"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->delete(Ljava/io/File;)V

    .line 188
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/page.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->delete(Ljava/io/File;)V

    .line 189
    return-void
.end method

.method private static findResourcesToSave(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;
    .locals 7
    .parameter "content"
    .parameter "patternString"
    .parameter "absolute"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 76
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 77
    .local v2, pattern:Ljava/util/regex/Pattern;
    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 79
    .local v0, matcher:Ljava/util/regex/Matcher;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .local v3, resources:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-nez v5, :cond_0

    .line 98
    return-object v3

    .line 82
    :cond_0
    const/4 v5, 0x2

    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 85
    .local v1, part:Ljava/lang/String;
    if-eqz p2, :cond_1

    .line 86
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "http://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 96
    .local v4, url:Ljava/lang/String;
    :goto_1
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    .end local v4           #url:Ljava/lang/String;
    :cond_1
    const-string v5, "/"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 91
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "http:/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 92
    .restart local v4       #url:Ljava/lang/String;
    goto :goto_1

    .line 93
    .end local v4           #url:Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "http://en.m.wikipedia.org/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4       #url:Ljava/lang/String;
    goto :goto_1
.end method

.method private static getFilePath(Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .parameter "pagePath"
    .parameter "uri"

    .prologue
    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/_res/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getPagePath(Landroid/net/Uri;)Ljava/lang/String;
    .locals 2
    .parameter "uri"

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->SAVE_DIR:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSavedPages()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 197
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 198
    .local v1, savedPages:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    new-instance v0, Ljava/io/File;

    sget-object v2, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->SAVE_DIR:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 199
    .local v0, savePath:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 201
    invoke-static {v0, v1}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->searchDir(Ljava/io/File;Ljava/util/List;)V

    .line 202
    return-object v1
.end method

.method private static saveFile(Ljava/io/File;Landroid/net/Uri;)V
    .locals 9
    .parameter "pageFile"
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljavax/xml/parsers/FactoryConfigurationError;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, p1}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->getFilePath(Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 156
    .local v5, saveFile:Ljava/io/File;
    new-instance v6, Ljava/net/URL;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    .line 159
    .local v1, in:Ljava/io/InputStream;
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 160
    new-instance v4, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/file"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 162
    .local v4, outFile:Ljava/io/File;
    const-string v6, "OfflinePageSaver"

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "Saving file: "

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 165
    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 166
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 168
    .local v3, out:Ljava/io/OutputStream;
    const/16 v6, 0x400

    new-array v0, v6, [B

    .line 170
    .local v0, buf:[B
    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, len:I
    if-gtz v2, :cond_0

    .line 174
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 175
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 176
    return-void

    .line 171
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0
.end method

.method public static savePage(Landroid/content/Context;Lcom/isaacwaller/wikipedia/PageReference;)V
    .locals 18
    .parameter "c"
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Ljavax/xml/parsers/FactoryConfigurationError;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;,
            Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual/range {p1 .. p1}, Lcom/isaacwaller/wikipedia/PageReference;->getType()Lcom/isaacwaller/wikipedia/PageReference$PageType;

    move-result-object v14

    sget-object v15, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-eq v14, v15, :cond_0

    .line 104
    new-instance v14, Lcom/isaacwaller/wikipedia/OfflinePageSaver$BadPageTypeException;

    invoke-direct {v14}, Lcom/isaacwaller/wikipedia/OfflinePageSaver$BadPageTypeException;-><init>()V

    throw v14

    .line 107
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/isaacwaller/wikipedia/PageReference;->toUrl()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    .line 109
    .local v12, uri:Landroid/net/Uri;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/isaacwaller/wikipedia/PageReference;->loadPage(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    move-result-object v14

    iget-object v3, v14, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    .line 112
    .local v3, content:Ljava/lang/String;
    new-instance v11, Ljava/io/File;

    invoke-static {v12}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->getPagePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 113
    .local v11, saveFile:Ljava/io/File;
    new-instance v8, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "/page.html"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v8, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 115
    .local v8, outFile:Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_1

    new-instance v14, Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;

    invoke-direct {v14}, Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;-><init>()V

    throw v14

    .line 116
    :cond_1
    const-string v14, "OfflinePageSaver"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Saving page: "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']http://(.*?)[\\\"\\\'](.*?>)"

    const/4 v15, 0x1

    invoke-static {v3, v14, v15}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->findResourcesToSave(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v10

    .line 119
    .local v10, resourcesToSave:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']/[^/](.*?)[\\\"\\\'](.*?>)"

    const/4 v15, 0x0

    invoke-static {v3, v14, v15}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->findResourcesToSave(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 120
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']//(.*?)[\\\"\\\'](.*?>)"

    const/4 v15, 0x1

    invoke-static {v3, v14, v15}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->findResourcesToSave(Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 122
    const-string v14, "OfflinePageSaver"

    new-instance v15, Ljava/lang/StringBuilder;

    const-string v16, "Saving resources "

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-nez v15, :cond_2

    .line 133
    new-instance v15, Ljava/lang/StringBuilder;

    const-string v14, "$1=\"content://com.isaacwaller.wikidroid.offlinepages/"

    invoke-direct {v15, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, v16

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, ""

    invoke-virtual {v12}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    const-string v14, ""

    :goto_1
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v16, "$"

    const-string v17, "\\$"

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v14, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 134
    .local v9, replacementStart:Ljava/lang/String;
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']http://(.*?)[\\\"\\\'](.*?>)"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "/_res/$2\"$3"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 135
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']/[^/](.*?)[\\\"\\\'](.*?>)"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "/_res/en.m.wikipedia.org/$2\"$3"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 136
    const-string v14, "(<(?!a )(?!form )(?!html )(?!span )[^>]*?)=[\\\"\\\']//(.*?)[\\\"\\\'](.*?>)"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v16, "/_res/$2\"$3"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v3, v14, v15}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 138
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v14

    invoke-direct {v5, v14}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 140
    .local v5, in:Ljava/io/InputStream;
    invoke-virtual {v11}, Ljava/io/File;->mkdirs()Z

    .line 141
    invoke-virtual {v8}, Ljava/io/File;->createNewFile()Z

    .line 142
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 144
    .local v7, out:Ljava/io/OutputStream;
    const/16 v14, 0x400

    new-array v2, v14, [B

    .line 146
    .local v2, buf:[B
    :goto_2
    invoke-virtual {v5, v2}, Ljava/io/InputStream;->read([B)I

    move-result v6

    .local v6, len:I
    if-gtz v6, :cond_4

    .line 150
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 151
    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    .line 152
    return-void

    .line 124
    .end local v2           #buf:[B
    .end local v5           #in:Ljava/io/InputStream;
    .end local v6           #len:I
    .end local v7           #out:Ljava/io/OutputStream;
    .end local v9           #replacementStart:Ljava/lang/String;
    :cond_2
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 126
    .local v13, url:Ljava/lang/String;
    :try_start_0
    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v15

    invoke-static {v11, v15}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->saveFile(Ljava/io/File;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 127
    :catch_0
    move-exception v4

    .line 128
    .local v4, e:Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    .line 129
    const-string v15, "OfflinePageSaver"

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "Could not save "

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ". Will continue anyway..."

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 133
    .end local v4           #e:Ljava/lang/Exception;
    .end local v13           #url:Ljava/lang/String;
    :cond_3
    new-instance v14, Ljava/lang/StringBuilder;

    const-string v17, "/"

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    goto/16 :goto_1

    .line 147
    .restart local v2       #buf:[B
    .restart local v5       #in:Ljava/io/InputStream;
    .restart local v6       #len:I
    .restart local v7       #out:Ljava/io/OutputStream;
    .restart local v9       #replacementStart:Ljava/lang/String;
    :cond_4
    const/4 v14, 0x0

    invoke-virtual {v7, v2, v14, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2
.end method

.method private static searchDir(Ljava/io/File;Ljava/util/List;)V
    .locals 12
    .parameter "dir"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Ljava/util/List",
            "<",
            "Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .local p1, soFar:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;>;"
    const/4 v6, 0x0

    .line 207
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, files:[Ljava/lang/String;
    if-nez v2, :cond_1

    .line 232
    :cond_0
    return-void

    .line 213
    :cond_1
    array-length v7, v2

    move v5, v6

    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v1, v2, v5

    .line 214
    .local v1, fileName:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 215
    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 216
    invoke-static {v0, p1}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->searchDir(Ljava/io/File;Ljava/util/List;)V

    .line 213
    :cond_2
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 218
    :cond_3
    const-string v8, "page.html"

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 219
    new-instance v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;

    invoke-direct {v3}, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;-><init>()V

    .line 220
    .local v3, page:Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;
    iput-object p0, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->file:Ljava/io/File;

    .line 221
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "http://"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->SAVE_DIR:Ljava/lang/String;

    const-string v11, ""

    invoke-virtual {v9, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    iput-object v8, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->uri:Landroid/net/Uri;

    .line 224
    new-instance v4, Ljava/util/Scanner;

    invoke-direct {v4, v0}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V

    .line 225
    .local v4, scanner:Ljava/util/Scanner;
    const-string v8, "<title>(.*)</title>"

    invoke-virtual {v4, v8, v6}, Ljava/util/Scanner;->findWithinHorizon(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    .line 226
    iget-object v8, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    const/4 v9, 0x7

    iget-object v10, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x8

    invoke-virtual {v8, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v8

    invoke-interface {v8}, Landroid/text/Spanned;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v3, Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;->title:Ljava/lang/String;

    .line 228
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method
