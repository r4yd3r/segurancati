.class public Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;
.super Ljava/lang/Object;
.source "BookmarksDBAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;
    }
.end annotation


# static fields
.field private static final DATABASE_CREATE:Ljava/lang/String; = "create table bookmarks (_id integer primary key autoincrement, title text not null, url text not null);"

.field private static final DATABASE_NAME:Ljava/lang/String; = "data"

.field private static final DATABASE_TABLE:Ljava/lang/String; = "bookmarks"

.field private static final DATABASE_VERSION:I = 0x1

.field public static final KEY_ROWID:Ljava/lang/String; = "_id"

.field public static final KEY_TITLE:Ljava/lang/String; = "title"

.field public static final KEY_URL:Ljava/lang/String; = "url"

.field private static final TAG:Ljava/lang/String; = "BookmarksDBAdapter"


# instance fields
.field private final mCtx:Landroid/content/Context;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;

.field private mDbHelper:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "ctx"

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mCtx:Landroid/content/Context;

    .line 89
    return-void
.end method


# virtual methods
.method public addBookmark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)J
    .locals 4
    .parameter "c"
    .parameter "url"
    .parameter "title"

    .prologue
    .line 111
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 112
    .local v0, initialValues:Landroid/content/ContentValues;
    const-string v1, "title"

    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    const-string v1, "url"

    invoke-virtual {v0, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bookmarks"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    return-wide v1
.end method

.method public close()V
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDbHelper:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;->close()V

    .line 108
    return-void
.end method

.method public deleteBookmark(J)Z
    .locals 4
    .parameter "rowId"

    .prologue
    .line 119
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bookmarks"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "_id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public fetchBookmark(J)Landroid/database/Cursor;
    .locals 11
    .parameter "rowId"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/SQLException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 132
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v2, "bookmarks"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "_id"

    aput-object v6, v3, v4

    .line 133
    const-string v4, "title"

    aput-object v4, v3, v1

    const/4 v4, 0x2

    const-string v6, "url"

    aput-object v6, v3, v4

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "_id="

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v6, v5

    move-object v7, v5

    move-object v8, v5

    move-object v9, v5

    .line 132
    invoke-virtual/range {v0 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 135
    .local v10, mCursor:Landroid/database/Cursor;
    if-eqz v10, :cond_0

    .line 136
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    .line 138
    :cond_0
    return-object v10
.end method

.method public fetchBookmarks()Landroid/database/Cursor;
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 124
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    const-string v1, "bookmarks"

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "title"

    aput-object v5, v2, v4

    const/4 v4, 0x2

    .line 125
    const-string v5, "url"

    aput-object v5, v2, v4

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    move-object v7, v3

    .line 124
    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public open()Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/SQLException;
        }
    .end annotation

    .prologue
    .line 101
    new-instance v0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mCtx:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDbHelper:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;

    .line 102
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDbHelper:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter$DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 103
    return-object p0
.end method
