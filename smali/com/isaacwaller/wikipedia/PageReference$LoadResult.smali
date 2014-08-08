.class public Lcom/isaacwaller/wikipedia/PageReference$LoadResult;
.super Ljava/lang/Object;
.source "PageReference.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/PageReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LoadResult"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field public html:Ljava/lang/String;

.field public langlinks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method

.method synthetic constructor <init>(Lcom/isaacwaller/wikipedia/PageReference$LoadResult;)V
    .locals 0
    .parameter

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;-><init>()V

    return-void
.end method
