.class public Lorg/apache/commons/lang3/builder/CompareToBuilder;
.super Ljava/lang/Object;
.source "CompareToBuilder.java"

# interfaces
.implements Lorg/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private comparison:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    .line 109
    return-void
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V
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
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;",
            "Z[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 354
    .local p2, clazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 355
    .local v2, fields:[Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-static {v2, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 356
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    array-length v4, v2

    if-ge v3, v4, :cond_0

    iget v4, p3, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v4, :cond_1

    .line 371
    :cond_0
    return-void

    .line 357
    :cond_1
    aget-object v1, v2, v3

    .line 358
    .local v1, f:Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p5, v4}, Lorg/apache/commons/lang3/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 359
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 360
    if-nez p4, :cond_2

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 361
    :cond_2
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_3

    .line 363
    :try_start_0
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 356
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 364
    :catch_0
    move-exception v0

    .line 367
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "Unexpected IllegalAccessException"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v1, 0x0

    .line 139
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, v1, v1}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)I
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
            ">;)I"
        }
    .end annotation

    .prologue
    .line 204
    .local p2, excludeFields:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p2}, Lorg/apache/commons/lang3/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Z)I
    .locals 1
    .parameter "lhs"
    .parameter "rhs"
    .parameter "compareTransients"

    .prologue
    const/4 v0, 0x0

    .line 171
    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;)I
    .locals 1
    .parameter "lhs"
    .parameter "rhs"
    .parameter "compareTransients"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 274
    .local p3, reflectUpToClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I
    .locals 6
    .parameter "lhs"
    .parameter "rhs"
    .parameter "compareTransients"
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
            ")I"
        }
    .end annotation

    .prologue
    .line 316
    .local p3, reflectUpToClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    if-ne p0, p1, :cond_0

    .line 317
    const/4 v0, 0x0

    .line 332
    :goto_0
    return v0

    .line 319
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 320
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 322
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 323
    .local v2, lhsClazz:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 324
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0

    .line 326
    :cond_3
    new-instance v3, Lorg/apache/commons/lang3/builder/CompareToBuilder;

    invoke-direct {v3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;-><init>()V

    .local v3, compareToBuilder:Lorg/apache/commons/lang3/builder/CompareToBuilder;
    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 327
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    .line 328
    :goto_1
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_4

    if-ne v2, p3, :cond_5

    .line 332
    :cond_4
    invoke-virtual {v3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->toComparison()I

    move-result v0

    goto :goto_0

    .line 329
    :cond_5
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 330
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    goto :goto_1
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I
    .locals 2
    .parameter "lhs"
    .parameter "rhs"
    .parameter "excludeFields"

    .prologue
    .line 237
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public append(BB)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 568
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 572
    :goto_0
    return-object p0

    .line 571
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    :goto_1
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(CC)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 552
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 556
    :goto_0
    return-object p0

    .line 555
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    :goto_1
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(DD)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 589
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 593
    :goto_0
    return-object p0

    .line 592
    :cond_0
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0
.end method

.method public append(FF)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 610
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 614
    :goto_0
    return-object p0

    .line 613
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0
.end method

.method public append(II)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 520
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 524
    :goto_0
    return-object p0

    .line 523
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    :goto_1
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(JJ)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 504
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 508
    :goto_0
    return-object p0

    .line 507
    :cond_0
    cmp-long v0, p1, p3

    if-gez v0, :cond_1

    const/4 v0, -0x1

    :goto_1
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_1
    cmp-long v0, p1, p3

    if-lez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 411
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 3
    .parameter "lhs"
    .parameter "rhs"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator",
            "<*>;)",
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;"
        }
    .end annotation

    .prologue
    .line 440
    .local p3, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    iget v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v2, :cond_1

    .line 491
    .end local p1
    .end local p2
    :cond_0
    :goto_0
    return-object p0

    .line 443
    .restart local p1
    .restart local p2
    :cond_1
    if-eq p1, p2, :cond_0

    .line 446
    if-nez p1, :cond_2

    .line 447
    const/4 v2, -0x1

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 450
    :cond_2
    if-nez p2, :cond_3

    .line 451
    const/4 v2, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 454
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 458
    instance-of v2, p1, [J

    if-eqz v2, :cond_4

    .line 459
    check-cast p1, [J

    .end local p1
    check-cast p2, [J

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([J[J)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 460
    .restart local p1
    .restart local p2
    :cond_4
    instance-of v2, p1, [I

    if-eqz v2, :cond_5

    .line 461
    check-cast p1, [I

    .end local p1
    check-cast p2, [I

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([I[I)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 462
    .restart local p1
    .restart local p2
    :cond_5
    instance-of v2, p1, [S

    if-eqz v2, :cond_6

    .line 463
    check-cast p1, [S

    .end local p1
    check-cast p2, [S

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([S[S)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 464
    .restart local p1
    .restart local p2
    :cond_6
    instance-of v2, p1, [C

    if-eqz v2, :cond_7

    .line 465
    check-cast p1, [C

    .end local p1
    check-cast p2, [C

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([C[C)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 466
    .restart local p1
    .restart local p2
    :cond_7
    instance-of v2, p1, [B

    if-eqz v2, :cond_8

    .line 467
    check-cast p1, [B

    .end local p1
    check-cast p2, [B

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([B[B)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 468
    .restart local p1
    .restart local p2
    :cond_8
    instance-of v2, p1, [D

    if-eqz v2, :cond_9

    .line 469
    check-cast p1, [D

    .end local p1
    check-cast p2, [D

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([D[D)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 470
    .restart local p1
    .restart local p2
    :cond_9
    instance-of v2, p1, [F

    if-eqz v2, :cond_a

    .line 471
    check-cast p1, [F

    .end local p1
    check-cast p2, [F

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([F[F)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 472
    .restart local p1
    .restart local p2
    :cond_a
    instance-of v2, p1, [Z

    if-eqz v2, :cond_b

    .line 473
    check-cast p1, [Z

    .end local p1
    check-cast p2, [Z

    .end local p2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Z[Z)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 477
    .restart local p1
    .restart local p2
    :cond_b
    check-cast p1, [Ljava/lang/Object;

    .end local p1
    check-cast p2, [Ljava/lang/Object;

    .end local p2
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_0

    .line 481
    .restart local p1
    .restart local p2
    :cond_c
    if-nez p3, :cond_d

    move-object v0, p1

    .line 483
    check-cast v0, Ljava/lang/Comparable;

    .line 484
    .local v0, comparable:Ljava/lang/Comparable;,"Ljava/lang/Comparable<Ljava/lang/Object;>;"
    invoke-interface {v0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v2

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto/16 :goto_0

    .line 487
    .end local v0           #comparable:Ljava/lang/Comparable;,"Ljava/lang/Comparable<Ljava/lang/Object;>;"
    :cond_d
    move-object v1, p3

    .line 488
    .local v1, comparator2:Ljava/util/Comparator;,"Ljava/util/Comparator<Ljava/lang/Object;>;"
    invoke-interface {v1, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto/16 :goto_0
.end method

.method public append(SS)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 536
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 540
    :goto_0
    return-object p0

    .line 539
    :cond_0
    if-ge p1, p2, :cond_1

    const/4 v0, -0x1

    :goto_1
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_1
    if-le p1, p2, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public append(ZZ)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 626
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_1

    .line 637
    :cond_0
    :goto_0
    return-object p0

    .line 629
    :cond_1
    if-eq p1, p2, :cond_0

    .line 632
    if-nez p1, :cond_2

    .line 633
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 635
    :cond_2
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0
.end method

.method public append([B[B)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 889
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 910
    :cond_0
    :goto_0
    return-object p0

    .line 892
    :cond_1
    if-eq p1, p2, :cond_0

    .line 895
    if-nez p1, :cond_2

    .line 896
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 899
    :cond_2
    if-nez p2, :cond_3

    .line 900
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 903
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 904
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 907
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 908
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(BB)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 907
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([C[C)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 849
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 870
    :cond_0
    :goto_0
    return-object p0

    .line 852
    :cond_1
    if-eq p1, p2, :cond_0

    .line 855
    if-nez p1, :cond_2

    .line 856
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 859
    :cond_2
    if-nez p2, :cond_3

    .line 860
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 863
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 864
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 867
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 868
    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(CC)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 867
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([D[D)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 929
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 950
    :cond_0
    :goto_0
    return-object p0

    .line 932
    :cond_1
    if-eq p1, p2, :cond_0

    .line 935
    if-nez p1, :cond_2

    .line 936
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 939
    :cond_2
    if-nez p2, :cond_3

    .line 940
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 943
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 944
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 947
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 948
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(DD)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 947
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([F[F)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 969
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 990
    :cond_0
    :goto_0
    return-object p0

    .line 972
    :cond_1
    if-eq p1, p2, :cond_0

    .line 975
    if-nez p1, :cond_2

    .line 976
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 979
    :cond_2
    if-nez p2, :cond_3

    .line 980
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 983
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 984
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 987
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 988
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(FF)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 987
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([I[I)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 769
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 790
    :cond_0
    :goto_0
    return-object p0

    .line 772
    :cond_1
    if-eq p1, p2, :cond_0

    .line 775
    if-nez p1, :cond_2

    .line 776
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 779
    :cond_2
    if-nez p2, :cond_3

    .line 780
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 783
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 784
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 787
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 788
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(II)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 787
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([J[J)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 729
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 750
    :cond_0
    :goto_0
    return-object p0

    .line 732
    :cond_1
    if-eq p1, p2, :cond_0

    .line 735
    if-nez p1, :cond_2

    .line 736
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 739
    :cond_2
    if-nez p2, :cond_3

    .line 740
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 743
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 744
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 747
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 748
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(JJ)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 747
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    .line 662
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator",
            "<*>;)",
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;"
        }
    .end annotation

    .prologue
    .local p3, comparator:Ljava/util/Comparator;,"Ljava/util/Comparator<*>;"
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 689
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 710
    :cond_0
    :goto_0
    return-object p0

    .line 692
    :cond_1
    if-eq p1, p2, :cond_0

    .line 695
    if-nez p1, :cond_2

    .line 696
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 699
    :cond_2
    if-nez p2, :cond_3

    .line 700
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 703
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 704
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 707
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 708
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2, p3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 707
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([S[S)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 809
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 830
    :cond_0
    :goto_0
    return-object p0

    .line 812
    :cond_1
    if-eq p1, p2, :cond_0

    .line 815
    if-nez p1, :cond_2

    .line 816
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 819
    :cond_2
    if-nez p2, :cond_3

    .line 820
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 823
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 824
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 827
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 828
    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(SS)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 827
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public append([Z[Z)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 5
    .parameter "lhs"
    .parameter "rhs"

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 1009
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_1

    .line 1030
    :cond_0
    :goto_0
    return-object p0

    .line 1012
    :cond_1
    if-eq p1, p2, :cond_0

    .line 1015
    if-nez p1, :cond_2

    .line 1016
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 1019
    :cond_2
    if-nez p2, :cond_3

    .line 1020
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    .line 1023
    :cond_3
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_5

    .line 1024
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_4

    :goto_1
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0

    :cond_4
    move v1, v2

    goto :goto_1

    .line 1027
    :cond_5
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_0

    .line 1028
    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(ZZ)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 1027
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public appendSuper(I)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .locals 1
    .parameter "superCompareTo"

    .prologue
    .line 383
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_0

    .line 387
    :goto_0
    return-object p0

    .line 386
    :cond_0
    iput p1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_0
.end method

.method public build()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 1057
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->toComparison()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->build()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public toComparison()I
    .locals 1

    .prologue
    .line 1043
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    return v0
.end method
