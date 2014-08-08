.class public Lcom/isaacwaller/wikipedia/OfflinePageSaver$OfflinePage;
.super Ljava/lang/Object;
.source "OfflinePageSaver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/OfflinePageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OfflinePage"
.end annotation


# instance fields
.field file:Ljava/io/File;

.field title:Ljava/lang/String;

.field uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
