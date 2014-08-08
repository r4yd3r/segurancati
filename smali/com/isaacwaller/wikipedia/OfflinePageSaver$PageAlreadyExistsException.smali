.class public Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;
.super Ljava/lang/Exception;
.source "OfflinePageSaver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/OfflinePageSaver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PageAlreadyExistsException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 64
    return-void
.end method
