.class public abstract Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;
.super Ljava/lang/Object;
.source "BackgroundInitializer.java"

# interfaces
.implements Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/concurrent/ConcurrentInitializer",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private executor:Ljava/util/concurrent/ExecutorService;

.field private externalExecutor:Ljava/util/concurrent/ExecutorService;

.field private future:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 101
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 102
    return-void
.end method

.method protected constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 0
    .parameter "exec"

    .prologue
    .line 114
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->setExternalExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 116
    return-void
.end method

.method private createExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 299
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getTaskCount()I

    move-result v0

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method private createTask(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Callable;
    .locals 1
    .parameter "execDestroy"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ExecutorService;",
            ")",
            "Ljava/util/concurrent/Callable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 289
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer$InitializationTask;-><init>(Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;Ljava/util/concurrent/ExecutorService;)V

    return-object v0
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/lang3/concurrent/ConcurrentException;
        }
    .end annotation

    .prologue
    .line 210
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getFuture()Ljava/util/concurrent/Future;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v2

    .line 213
    :goto_0
    return-object v2

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, execex:Ljava/util/concurrent/ExecutionException;
    invoke-static {v0}, Lorg/apache/commons/lang3/concurrent/ConcurrentUtils;->handleCause(Ljava/util/concurrent/ExecutionException;)V

    .line 213
    const/4 v2, 0x0

    goto :goto_0

    .line 214
    .end local v0           #execex:Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v1

    .line 216
    .local v1, iex:Ljava/lang/InterruptedException;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 217
    new-instance v2, Lorg/apache/commons/lang3/concurrent/ConcurrentException;

    invoke-direct {v2, v1}, Lorg/apache/commons/lang3/concurrent/ConcurrentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected final declared-synchronized getActiveExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 247
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getExternalExecutor()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 124
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->externalExecutor:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFuture()Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/Future",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 230
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;

    if-nez v0, :cond_0

    .line 231
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "start() must be called first!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 234
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method protected getTaskCount()I
    .locals 1

    .prologue
    .line 262
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    const/4 v0, 0x1

    return v0
.end method

.method protected abstract initialize()Ljava/lang/Object;
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
.end method

.method public declared-synchronized isStarted()Z
    .locals 1

    .prologue
    .line 135
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized setExternalExecutor(Ljava/util/concurrent/ExecutorService;)V
    .locals 2
    .parameter "externalExecutor"

    .prologue
    .line 154
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 156
    const-string v1, "Cannot set ExecutorService after start()!"

    .line 155
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 159
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->externalExecutor:Ljava/util/concurrent/ExecutorService;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 160
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized start()Z
    .locals 3

    .prologue
    .line 174
    .local p0, this:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<TT;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->isStarted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 179
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getExternalExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 180
    iget-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    if-nez v1, :cond_0

    .line 181
    invoke-direct {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->createExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .local v0, tempExec:Ljava/util/concurrent/ExecutorService;
    iput-object v0, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    .line 186
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->createTask(Ljava/util/concurrent/ExecutorService;)Ljava/util/concurrent/Callable;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->future:Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    const/4 v1, 0x1

    .line 191
    .end local v0           #tempExec:Ljava/util/concurrent/ExecutorService;
    :goto_1
    monitor-exit p0

    return v1

    .line 183
    :cond_0
    const/4 v0, 0x0

    .restart local v0       #tempExec:Ljava/util/concurrent/ExecutorService;
    goto :goto_0

    .line 191
    .end local v0           #tempExec:Ljava/util/concurrent/ExecutorService;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 174
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
