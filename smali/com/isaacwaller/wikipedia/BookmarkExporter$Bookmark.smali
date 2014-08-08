.class public Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;
.super Ljava/lang/Object;
.source "BookmarkExporter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/BookmarkExporter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bookmark"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "name"
    .parameter "url"

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;->name:Ljava/lang/String;

    .line 34
    iput-object p2, p0, Lcom/isaacwaller/wikipedia/BookmarkExporter$Bookmark;->url:Ljava/lang/String;

    .line 35
    return-void
.end method
