.class public Lorg/apache/commons/lang3/event/EventListenerSupport;
.super Ljava/lang/Object;
.source "EventListenerSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/event/EventListenerSupport$ProxyInvocationHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<T",
            "L;",
            ">;"
        }
    .end annotation
.end field

.field private final proxy:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "T",
            "L;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<T",
            "L;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 105
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    .local p1, listenerInterface:Ljava/lang/Class;,"Ljava/lang/Class<TL;>;"
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang3/event/EventListenerSupport;-><init>(Ljava/lang/Class;Ljava/lang/ClassLoader;)V

    .line 106
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/ClassLoader;)V
    .locals 6
    .parameter
    .parameter "classLoader"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<T",
            "L;",
            ">;",
            "Ljava/lang/ClassLoader;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    .local p1, listenerInterface:Ljava/lang/Class;,"Ljava/lang/Class<TL;>;"
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->listeners:Ljava/util/List;

    .line 123
    const-string v0, "Listener interface cannot be null."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v0, "ClassLoader cannot be null."

    new-array v1, v4, [Ljava/lang/Object;

    invoke-static {p2, v0, v1}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    .line 126
    const-string v1, "Class {0} is not an interface"

    new-array v2, v5, [Ljava/lang/Object;

    .line 127
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 125
    invoke-static {v0, v1, v2}, Lorg/apache/commons/lang3/Validate;->isTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 129
    new-array v0, v5, [Ljava/lang/Class;

    aput-object p1, v0, v4

    .line 130
    new-instance v1, Lorg/apache/commons/lang3/event/EventListenerSupport$ProxyInvocationHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/apache/commons/lang3/event/EventListenerSupport$ProxyInvocationHandler;-><init>(Lorg/apache/commons/lang3/event/EventListenerSupport;Lorg/apache/commons/lang3/event/EventListenerSupport$ProxyInvocationHandler;)V

    .line 128
    invoke-static {p2, v0, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->proxy:Ljava/lang/Object;

    .line 131
    return-void
.end method

.method static synthetic access$0(Lorg/apache/commons/lang3/event/EventListenerSupport;)Ljava/util/List;
    .locals 1
    .parameter

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->listeners:Ljava/util/List;

    return-object v0
.end method

.method public static create(Ljava/lang/Class;)Lorg/apache/commons/lang3/event/EventListenerSupport;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/event/EventListenerSupport",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p0, listenerInterface:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/event/EventListenerSupport;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/event/EventListenerSupport;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method


# virtual methods
.method public addListener(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            ")V"
        }
    .end annotation

    .prologue
    .line 160
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    .local p1, listener:Ljava/lang/Object;,"TL;"
    const-string v0, "Listener object cannot be null."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    iget-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    return-void
.end method

.method public fire()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()T",
            "L;"
        }
    .end annotation

    .prologue
    .line 143
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->proxy:Ljava/lang/Object;

    return-object v0
.end method

.method getListenerCount()I
    .locals 1

    .prologue
    .line 171
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public removeListener(Ljava/lang/Object;)V
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            ")V"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, this:Lorg/apache/commons/lang3/event/EventListenerSupport;,"Lorg/apache/commons/lang3/event/EventListenerSupport<TL;>;"
    .local p1, listener:Ljava/lang/Object;,"TL;"
    const-string v0, "Listener object cannot be null."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1, v0, v1}, Lorg/apache/commons/lang3/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    iget-object v0, p0, Lorg/apache/commons/lang3/event/EventListenerSupport;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 186
    return-void
.end method
