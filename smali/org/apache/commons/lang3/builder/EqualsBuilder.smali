.class public Lorg/apache/commons/lang3/builder/EqualsBuilder;
.super Ljava/lang/Object;
.source "EqualsBuilder.java"

# interfaces
.implements Lorg/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field private static final REGISTRY:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/lang3/Pair",
            "<",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field private isEquals:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 98
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    .line 231
    return-void
.end method

.method static getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/Pair;
    .locals 3
    .parameter "lhs"
    .parameter "rhs"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Lorg/apache/commons/lang3/Pair",
            "<",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            ">;"
        }
    .end annotation

    .prologue
    .line 141
    new-instance v0, Lorg/apache/commons/lang3/builder/IDKey;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    .line 142
    .local v0, left:Lorg/apache/commons/lang3/builder/IDKey;
    new-instance v1, Lorg/apache/commons/lang3/builder/IDKey;

    invoke-direct {v1, p1}, Lorg/apache/commons/lang3/builder/IDKey;-><init>(Ljava/lang/Object;)V

    .line 143
    .local v1, right:Lorg/apache/commons/lang3/builder/IDKey;
    new-instance v2, Lorg/apache/commons/lang3/Pair;

    invoke-direct {v2, v0, v1}, Lorg/apache/commons/lang3/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method static getRegistry()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/lang3/Pair",
            "<",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            "Lorg/apache/commons/lang3/builder/IDKey;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 127
    sget-object v0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    return-object v0
.end method

.method static isRegistered(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 160
    invoke-static {}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    .line 161
    .local v1, registry:Ljava/util/Set;,"Ljava/util/Set<Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;>;"
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/Pair;

    move-result-object v0

    .line 162
    .local v0, pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    new-instance v2, Lorg/apache/commons/lang3/Pair;

    iget-object v3, v0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    check-cast v3, Lorg/apache/commons/lang3/builder/IDKey;

    .line 163
    iget-object v4, v0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    check-cast v4, Lorg/apache/commons/lang3/builder/IDKey;

    .line 162
    invoke-direct {v2, v3, v4}, Lorg/apache/commons/lang3/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 165
    .local v2, swappedPair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    if-eqz v1, :cond_1

    .line 166
    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 165
    :cond_0
    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    .locals 6
    .parameter "lhs"
    .parameter "rhs"
    .parameter
    .parameter "builder"
    .parameter "useTransients"
    .parameter "excludeFields"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/apache/commons/lang3/builder/EqualsBuilder;",
            "Z[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 450
    .local p2, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isRegistered(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 476
    :goto_0
    return-void

    .line 455
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->register(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 456
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 457
    .local v2, fields:[Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-static {v2, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 458
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_1

    iget-boolean v4, p3, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_2

    .line 474
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->unregister(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    .line 459
    :cond_2
    :try_start_1
    aget-object v1, v2, v3

    .line 460
    .local v1, f:Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p5, v4}, Lorg/apache/commons/lang3/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 461
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    .line 462
    if-nez p4, :cond_3

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-nez v4, :cond_4

    .line 463
    :cond_3
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v4

    if-nez v4, :cond_4

    .line 465
    :try_start_2
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_0

    .line 458
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 466
    :catch_0
    move-exception v0

    .line 469
    .local v0, e:Ljava/lang/IllegalAccessException;
    :try_start_3
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "Unexpected IllegalAccessException"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 473
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    .end local v1           #f:Ljava/lang/reflect/Field;
    .end local v2           #fields:[Ljava/lang/reflect/Field;
    .end local v3           #i:I
    :catchall_0
    move-exception v4

    .line 474
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->unregister(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 475
    throw v4
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v1, 0x0

    .line 254
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v1, v1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)Z
    .locals 1
    .parameter "lhs"
    .parameter "rhs"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 277
    .local p2, excludeFields:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p2}, Lorg/apache/commons/lang3/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;Z)Z
    .locals 1
    .parameter "lhs"
    .parameter "rhs"
    .parameter "testTransients"

    .prologue
    const/4 v0, 0x0

    .line 324
    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;)Z
    .locals 1
    .parameter "lhs"
    .parameter "rhs"
    .parameter "testTransients"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 353
    .local p3, reflectUpToClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z
    .locals 10
    .parameter "lhs"
    .parameter "rhs"
    .parameter "testTransients"
    .parameter
    .parameter "excludeFields"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p3, reflectUpToClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .line 384
    if-ne p0, p1, :cond_0

    .line 385
    const/4 v0, 0x1

    .line 428
    :goto_0
    return v0

    .line 387
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    :cond_1
    move v0, v9

    .line 388
    goto :goto_0

    .line 394
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 395
    .local v7, lhsClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    .line 397
    .local v8, rhsClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v7, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 398
    move-object v2, v7

    .line 399
    .local v2, testClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v8, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 401
    move-object v2, v8

    .line 413
    :cond_3
    :goto_1
    new-instance v3, Lorg/apache/commons/lang3/builder/EqualsBuilder;

    invoke-direct {v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;-><init>()V

    .local v3, equalsBuilder:Lorg/apache/commons/lang3/builder/EqualsBuilder;
    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 415
    :try_start_0
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V

    .line 416
    :goto_2
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_4

    if-ne v2, p3, :cond_7

    .line 428
    :cond_4
    invoke-virtual {v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    goto :goto_0

    .line 403
    .end local v2           #testClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v3           #equalsBuilder:Lorg/apache/commons/lang3/builder/EqualsBuilder;
    :cond_5
    invoke-virtual {v8, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 404
    move-object v2, v8

    .line 405
    .restart local v2       #testClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v7, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 407
    move-object v2, v7

    .line 409
    goto :goto_1

    .end local v2           #testClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_6
    move v0, v9

    .line 411
    goto :goto_0

    .line 417
    .restart local v2       #testClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .restart local v3       #equalsBuilder:Lorg/apache/commons/lang3/builder/EqualsBuilder;
    :cond_7
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 418
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/EqualsBuilder;Z[Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 420
    :catch_0
    move-exception v6

    .local v6, e:Ljava/lang/IllegalArgumentException;
    move v0, v9

    .line 426
    goto :goto_0
.end method

.method public static reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)Z
    .locals 2
    .parameter "lhs"
    .parameter "rhs"
    .parameter "excludeFields"

    .prologue
    .line 300
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->reflectionEquals(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static register(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 179
    const-class v3, Lorg/apache/commons/lang3/builder/HashCodeBuilder;

    monitor-enter v3

    .line 180
    :try_start_0
    invoke-static {}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v2

    if-nez v2, :cond_0

    .line 181
    sget-object v2, Lorg/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 179
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 185
    invoke-static {}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    .line 186
    .local v1, registry:Ljava/util/Set;,"Ljava/util/Set<Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;>;"
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/Pair;

    move-result-object v0

    .line 187
    .local v0, pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 188
    return-void

    .line 179
    .end local v0           #pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    .end local v1           #registry:Ljava/util/Set;,"Ljava/util/Set<Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;>;"
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method static unregister(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 203
    invoke-static {}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    .line 204
    .local v1, registry:Ljava/util/Set;,"Ljava/util/Set<Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;>;"
    if-eqz v1, :cond_1

    .line 205
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegisterPair(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/Pair;

    move-result-object v0

    .line 206
    .local v0, pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    invoke-interface {v1, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 207
    const-class v3, Lorg/apache/commons/lang3/builder/HashCodeBuilder;

    monitor-enter v3

    .line 209
    :try_start_0
    invoke-static {}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->getRegistry()Ljava/util/Set;

    move-result-object v1

    .line 210
    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 211
    sget-object v2, Lorg/apache/commons/lang3/builder/EqualsBuilder;->REGISTRY:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    .line 207
    :cond_0
    monitor-exit v3

    .line 215
    .end local v0           #pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    :cond_1
    return-void

    .line 207
    .restart local v0       #pair:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<Lorg/apache/commons/lang3/builder/IDKey;Lorg/apache/commons/lang3/builder/IDKey;>;"
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method


# virtual methods
.method public append(BB)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 621
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 625
    :goto_0
    return-object p0

    .line 624
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(CC)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 606
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 610
    :goto_0
    return-object p0

    .line 609
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(DD)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 642
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 645
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-static {p3, p4}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(JJ)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public append(FF)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 2
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 662
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 665
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    invoke-static {p1}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    invoke-static {p2}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(II)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public append(II)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 576
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 580
    :goto_0
    return-object p0

    .line 579
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(JJ)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 561
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 565
    :goto_0
    return-object p0

    .line 564
    :cond_0
    cmp-long v0, p1, p3

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 506
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 546
    .end local p1
    .end local p2
    :cond_0
    :goto_0
    return-object p0

    .line 509
    .restart local p1
    .restart local p2
    :cond_1
    if-eq p1, p2, :cond_0

    .line 512
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 513
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 516
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 517
    .local v0, lhsClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-nez v1, :cond_4

    .line 519
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    .line 520
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_5

    .line 522
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 526
    :cond_5
    instance-of v1, p1, [J

    if-eqz v1, :cond_6

    .line 527
    check-cast p1, [J

    .end local p1
    check-cast p2, [J

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([J[J)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 528
    .restart local p1
    .restart local p2
    :cond_6
    instance-of v1, p1, [I

    if-eqz v1, :cond_7

    .line 529
    check-cast p1, [I

    .end local p1
    check-cast p2, [I

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([I[I)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 530
    .restart local p1
    .restart local p2
    :cond_7
    instance-of v1, p1, [S

    if-eqz v1, :cond_8

    .line 531
    check-cast p1, [S

    .end local p1
    check-cast p2, [S

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([S[S)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 532
    .restart local p1
    .restart local p2
    :cond_8
    instance-of v1, p1, [C

    if-eqz v1, :cond_9

    .line 533
    check-cast p1, [C

    .end local p1
    check-cast p2, [C

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([C[C)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 534
    .restart local p1
    .restart local p2
    :cond_9
    instance-of v1, p1, [B

    if-eqz v1, :cond_a

    .line 535
    check-cast p1, [B

    .end local p1
    check-cast p2, [B

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([B[B)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 536
    .restart local p1
    .restart local p2
    :cond_a
    instance-of v1, p1, [D

    if-eqz v1, :cond_b

    .line 537
    check-cast p1, [D

    .end local p1
    check-cast p2, [D

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([D[D)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 538
    .restart local p1
    .restart local p2
    :cond_b
    instance-of v1, p1, [F

    if-eqz v1, :cond_c

    .line 539
    check-cast p1, [F

    .end local p1
    check-cast p2, [F

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([F[F)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto :goto_0

    .line 540
    .restart local p1
    .restart local p2
    :cond_c
    instance-of v1, p1, [Z

    if-eqz v1, :cond_d

    .line 541
    check-cast p1, [Z

    .end local p1
    check-cast p2, [Z

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([Z[Z)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto/16 :goto_0

    .line 544
    .restart local p1
    .restart local p2
    :cond_d
    check-cast p1, [Ljava/lang/Object;

    .end local p1
    check-cast p2, [Ljava/lang/Object;

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    goto/16 :goto_0
.end method

.method public append(SS)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 591
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 595
    :goto_0
    return-object p0

    .line 594
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(ZZ)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 676
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 680
    :goto_0
    return-object p0

    .line 679
    :cond_0
    if-ne p1, p2, :cond_1

    const/4 v0, 0x1

    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append([B[B)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 849
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 866
    :cond_0
    :goto_0
    return-object p0

    .line 852
    :cond_1
    if-eq p1, p2, :cond_0

    .line 855
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 856
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 859
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 860
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 863
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 864
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(BB)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 863
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([C[C)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 818
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 835
    :cond_0
    :goto_0
    return-object p0

    .line 821
    :cond_1
    if-eq p1, p2, :cond_0

    .line 824
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 825
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 828
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 829
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 832
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 833
    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(CC)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 832
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([D[D)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 880
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 897
    :cond_0
    :goto_0
    return-object p0

    .line 883
    :cond_1
    if-eq p1, p2, :cond_0

    .line 886
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 887
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 890
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 891
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 894
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 895
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(DD)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 894
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([F[F)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 911
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 928
    :cond_0
    :goto_0
    return-object p0

    .line 914
    :cond_1
    if-eq p1, p2, :cond_0

    .line 917
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 918
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 921
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 922
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 925
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 926
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(FF)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 925
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([I[I)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 756
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 773
    :cond_0
    :goto_0
    return-object p0

    .line 759
    :cond_1
    if-eq p1, p2, :cond_0

    .line 762
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 763
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 766
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 767
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 770
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 771
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(II)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 770
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([J[J)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 725
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 742
    :cond_0
    :goto_0
    return-object p0

    .line 728
    :cond_1
    if-eq p1, p2, :cond_0

    .line 731
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 732
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 735
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 736
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 739
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 740
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(JJ)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 739
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 694
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 711
    :cond_0
    :goto_0
    return-object p0

    .line 697
    :cond_1
    if-eq p1, p2, :cond_0

    .line 700
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 701
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 704
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 705
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 708
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 709
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 708
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([S[S)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 787
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 804
    :cond_0
    :goto_0
    return-object p0

    .line 790
    :cond_1
    if-eq p1, p2, :cond_0

    .line 793
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 794
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 797
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 798
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 801
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 802
    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(SS)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 801
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public append([Z[Z)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 4
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v3, 0x0

    .line 942
    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v1, :cond_1

    .line 959
    :cond_0
    :goto_0
    return-object p0

    .line 945
    :cond_1
    if-eq p1, p2, :cond_0

    .line 948
    if-eqz p1, :cond_2

    if-nez p2, :cond_3

    .line 949
    :cond_2
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 952
    :cond_3
    array-length v1, p1

    array-length v2, p2

    if-eq v1, v2, :cond_4

    .line 953
    invoke-virtual {p0, v3}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->setEquals(Z)V

    goto :goto_0

    .line 956
    :cond_4
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-boolean v1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-eqz v1, :cond_0

    .line 957
    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(ZZ)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    .line 956
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public appendSuper(Z)Lorg/apache/commons/lang3/builder/EqualsBuilder;
    .locals 1
    .parameter "superEquals"

    .prologue
    .line 488
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    if-nez v0, :cond_0

    .line 492
    :goto_0
    return-object p0

    .line 491
    :cond_0
    iput-boolean p1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    goto :goto_0
.end method

.method public build()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 982
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->build()Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public isEquals()Z
    .locals 1

    .prologue
    .line 969
    iget-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    return v0
.end method

.method public reset()V
    .locals 1

    .prologue
    .line 1000
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    .line 1001
    return-void
.end method

.method protected setEquals(Z)V
    .locals 0
    .parameter "isEquals"

    .prologue
    .line 992
    iput-boolean p1, p0, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals:Z

    .line 993
    return-void
.end method
