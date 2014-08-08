.class public Lcom/isaacwaller/wikipedia/BookmarkExporter;
.super Ljava/lang/Object;
.source "BookmarkExporter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;
    }
.end annotation


# static fields
.field private static final FOOTER:Ljava/lang/String; = "</DL><p></DL>"

.field private static final HEADER:Ljava/lang/String; = "<!DOCTYPE NETSCAPE-Bookmark-file-1>\n<!-- This is an automatically generated file.\n     It will be read and overwritten.\n     DO NOT EDIT! -->\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n<TITLE>Bookmarks</TITLE>\n<H1>Bookmarks</H1>\n<DL><DT><H3 FOLDED>Wikidroid Bookmarks</H3><DL><p>\n"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createBookmarksFile(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, bookmarks:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .local v1, file:Ljava/lang/StringBuilder;
    const-string v2, "<!DOCTYPE NETSCAPE-Bookmark-file-1>\n<!-- This is an automatically generated file.\n     It will be read and overwritten.\n     DO NOT EDIT! -->\n<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n<TITLE>Bookmarks</TITLE>\n<H1>Bookmarks</H1>\n<DL><DT><H3 FOLDED>Wikidroid Bookmarks</H3><DL><p>\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 46
    const-string v2, "</DL><p></DL>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 42
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;

    .line 43
    .local v0, bookmark:Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "<DT><A HREF=\""

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "</A>\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static saveBookmarks(Landroid/content/Context;)V
    .locals 10
    .parameter "context"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "WikidroidBookmarks.html"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 52
    .local v3, file:Ljava/lang/String;
    const-string v7, "BookmarkExporter"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Creating "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    new-instance v7, Ljava/io/File;

    invoke-direct {v7, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->createNewFile()Z

    .line 54
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v1, bookmarks:Ljava/util/List;,"Ljava/util/List<Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;>;"
    new-instance v7, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-direct {v7, p0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->open()Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    move-result-object v0

    .line 57
    .local v0, adapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->fetchBookmarks()Landroid/database/Cursor;

    move-result-object v2

    .line 59
    .local v2, cursor:Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 60
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 67
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 68
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->close()V

    .line 70
    new-instance v5, Ljava/io/BufferedWriter;

    new-instance v7, Ljava/io/FileWriter;

    invoke-direct {v7, v3}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v7}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 71
    .local v5, out:Ljava/io/BufferedWriter;
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/BookmarkExporter;->createBookmarksFile(Ljava/util/List;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V

    .line 73
    return-void

    .line 61
    .end local v5           #out:Ljava/io/BufferedWriter;
    :cond_0
    const-string v7, "title"

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 62
    .local v4, name:Ljava/lang/String;
    const-string v7, "url"

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v7

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 63
    .local v6, title:Ljava/lang/String;
    new-instance v7, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;

    invoke-direct {v7, v4, v6}, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0
.end method
