.class public Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;
.super Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;
.source "CallableBackgroundInitializer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final callable:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 0
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, this:Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer<TT;>;"
    .local p1, call:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    invoke-direct {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>()V

    .line 79
    invoke-direct {p0, p1}, Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;->checkCallable(Ljava/util/concurrent/Callable;)V

    .line 80
    iput-object p1, p0, Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;->callable:Ljava/util/concurrent/Callable;

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Callable;Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .parameter
    .parameter "exec"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;",
            "Ljava/util/concurrent/ExecutorService;",
            ")V"
        }
    .end annotation

    .prologue
    .line 95
    .local p0, this:Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer<TT;>;"
    .local p1, call:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    invoke-direct {p0, p2}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 96
    invoke-direct {p0, p1}, Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;->checkCallable(Ljava/util/concurrent/Callable;)V

    .line 97
    iput-object p1, p0, Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;->callable:Ljava/util/concurrent/Callable;

    .line 98
    return-void
.end method

.method private checkCallable(Ljava/util/concurrent/Callable;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, this:Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer<TT;>;"
    .local p1, call:Ljava/util/concurrent/Callable;,"Ljava/util/concurrent/Callable<TT;>;"
    if-nez p1, :cond_0

    .line 122
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Callable must not be null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_0
    return-void
.end method


# virtual methods
.method protected initialize()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 110
    .local p0, this:Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/CallableBackgroundInitializer;->callable:Ljava/util/concurrent/Callable;

    invoke-interface {v0}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
