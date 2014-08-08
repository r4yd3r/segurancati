.class public Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;
.super Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;
.source "MultiBackgroundInitializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer",
        "<",
        "Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;",
        ">;"
    }
.end annotation


# instance fields
.field private final childInitializers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 106
    invoke-direct {p0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>()V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->childInitializers:Ljava/util/Map;

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/ExecutorService;)V
    .locals 1
    .parameter "exec"

    .prologue
    .line 117
    invoke-direct {p0, p1}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;-><init>(Ljava/util/concurrent/ExecutorService;)V

    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->childInitializers:Ljava/util/Map;

    .line 118
    return-void
.end method


# virtual methods
.method public addInitializer(Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;)V
    .locals 2
    .parameter "name"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/apache/commons/lang3/concurrent/BackgroundInitializer",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p2, init:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;"
    if-nez p1, :cond_0

    .line 134
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 135
    const-string v1, "Name of child initializer must not be null!"

    .line 134
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_0
    if-nez p2, :cond_1

    .line 138
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 139
    const-string v1, "Child initializer must not be null!"

    .line 138
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_1
    monitor-enter p0

    .line 143
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 144
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 145
    const-string v1, "addInitializer() must not be called after start()!"

    .line 144
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 147
    :cond_2
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->childInitializers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    return-void
.end method

.method protected getTaskCount()I
    .locals 4

    .prologue
    .line 163
    const/4 v1, 0x1

    .line 165
    .local v1, result:I
    iget-object v2, p0, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->childInitializers:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 169
    return v1

    .line 165
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;

    .line 166
    .local v0, bi:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;"
    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getTaskCount()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method protected bridge synthetic initialize()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->initialize()Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;

    move-result-object v0

    return-object v0
.end method

.method protected initialize()Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 185
    monitor-enter p0

    .line 187
    :try_start_0
    new-instance v5, Ljava/util/HashMap;

    .line 188
    iget-object v7, p0, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->childInitializers:Ljava/util/Map;

    .line 187
    invoke-direct {v5, v7}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 185
    .local v5, inits:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;>;"
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    invoke-virtual {p0}, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer;->getActiveExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v4

    .line 193
    .local v4, exec:Ljava/util/concurrent/ExecutorService;
    invoke-interface {v5}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_0

    .line 202
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 203
    .local v6, results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 204
    .local v3, excepts:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/ConcurrentException;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_2

    .line 212
    new-instance v7, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;

    const/4 v8, 0x0

    invoke-direct {v7, v5, v6, v3, v8}, Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;-><init>(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lorg/apache/commons/lang3/concurrent/MultiBackgroundInitializer$MultiBackgroundInitializerResults;)V

    return-object v7

    .line 185
    .end local v3           #excepts:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/ConcurrentException;>;"
    .end local v4           #exec:Ljava/util/concurrent/ExecutorService;
    .end local v5           #inits:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;>;"
    .end local v6           #results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :catchall_0
    move-exception v7

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v7

    .line 193
    .restart local v4       #exec:Ljava/util/concurrent/ExecutorService;
    .restart local v5       #inits:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;>;"
    :cond_0
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;

    .line 194
    .local v0, bi:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;"
    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->getExternalExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    if-nez v8, :cond_1

    .line 196
    invoke-virtual {v0, v4}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->setExternalExecutor(Ljava/util/concurrent/ExecutorService;)V

    .line 198
    :cond_1
    invoke-virtual {v0}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->start()Z

    goto :goto_0

    .line 204
    .end local v0           #bi:Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;,"Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;"
    .restart local v3       #excepts:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/ConcurrentException;>;"
    .restart local v6       #results:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 206
    .local v2, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/apache/commons/lang3/concurrent/BackgroundInitializer<*>;>;"
    :try_start_2
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;

    invoke-virtual {v8}, Lorg/apache/commons/lang3/concurrent/BackgroundInitializer;->get()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Lorg/apache/commons/lang3/concurrent/ConcurrentException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 207
    :catch_0
    move-exception v1

    .line 208
    .local v1, cex:Lorg/apache/commons/lang3/concurrent/ConcurrentException;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v3, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method
