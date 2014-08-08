.class public Lorg/apache/commons/lang3/ObjectUtils;
.super Ljava/lang/Object;
.source "ObjectUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/ObjectUtils$Null;
    }
.end annotation


# static fields
.field public static final NULL:Lorg/apache/commons/lang3/ObjectUtils$Null;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Lorg/apache/commons/lang3/ObjectUtils$Null;

    invoke-direct {v0}, Lorg/apache/commons/lang3/ObjectUtils$Null;-><init>()V

    sput-object v0, Lorg/apache/commons/lang3/ObjectUtils;->NULL:Lorg/apache/commons/lang3/ObjectUtils$Null;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    return-void
.end method

.method public static clone(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 329
    .local p0, o:Ljava/lang/Object;,"TT;"
    instance-of v7, p0, Ljava/lang/Cloneable;

    if-eqz v7, :cond_3

    .line 331
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 332
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 333
    .local v2, componentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v7

    if-nez v7, :cond_1

    .line 334
    check-cast p0, [Ljava/lang/Object;

    .end local p0           #o:Ljava/lang/Object;,"TT;"
    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v6

    .line 359
    .end local v2           #componentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local v6, result:Ljava/lang/Object;
    :cond_0
    :goto_0
    move-object v0, v6

    .line 363
    .local v0, checked:Ljava/lang/Object;,"TT;"
    :goto_1
    return-object v0

    .line 336
    .end local v0           #checked:Ljava/lang/Object;,"TT;"
    .end local v6           #result:Ljava/lang/Object;
    .restart local v2       #componentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .restart local p0       #o:Ljava/lang/Object;,"TT;"
    :cond_1
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v4

    .line 337
    .local v4, length:I
    invoke-static {v2, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v6

    .restart local v6       #result:Ljava/lang/Object;
    move v5, v4

    .line 338
    .end local v4           #length:I
    .local v5, length:I
    :goto_2
    add-int/lit8 v4, v5, -0x1

    .end local v5           #length:I
    .restart local v4       #length:I
    if-lez v5, :cond_0

    .line 339
    invoke-static {p0, v4}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v6, v4, v7}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    move v5, v4

    .end local v4           #length:I
    .restart local v5       #length:I
    goto :goto_2

    .line 344
    .end local v2           #componentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v5           #length:I
    .end local v6           #result:Ljava/lang/Object;
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string v8, "clone"

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 345
    .local v1, clone:Ljava/lang/reflect/Method;
    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v6

    .restart local v6       #result:Ljava/lang/Object;
    goto :goto_0

    .line 346
    .end local v1           #clone:Ljava/lang/reflect/Method;
    .end local v6           #result:Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 347
    .local v3, e:Ljava/lang/NoSuchMethodException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cloneable type "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 348
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 349
    const-string v9, " has no clone method"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 347
    invoke-direct {v7, v8, v3}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 350
    .end local v3           #e:Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v3

    .line 351
    .local v3, e:Ljava/lang/IllegalAccessException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Cannot clone Cloneable type "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 352
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 351
    invoke-direct {v7, v8, v3}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 353
    .end local v3           #e:Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v3

    .line 354
    .local v3, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v7, Lorg/apache/commons/lang3/exception/CloneFailedException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "Exception cloning Cloneable type "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 355
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    .line 354
    invoke-direct {v7, v8, v9}, Lorg/apache/commons/lang3/exception/CloneFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7

    .line 363
    .end local v3           #e:Ljava/lang/reflect/InvocationTargetException;
    :cond_3
    const/4 v0, 0x0

    goto/16 :goto_1
.end method

.method public static cloneIfPossible(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 381
    .local p0, o:Ljava/lang/Object;,"TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/ObjectUtils;->clone(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 382
    .local v0, clone:Ljava/lang/Object;,"TT;"
    if-nez v0, :cond_0

    .end local p0           #o:Ljava/lang/Object;,"TT;"
    :goto_0
    return-object p0

    .restart local p0       #o:Ljava/lang/Object;,"TT;"
    :cond_0
    move-object p0, v0

    goto :goto_0
.end method

.method public static defaultIfNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .parameter "object"
    .parameter "defaultValue"

    .prologue
    .line 96
    if-eqz p0, :cond_0

    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    move-object p0, p1

    goto :goto_0
.end method

.method public static equals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "object1"
    .parameter "object2"

    .prologue
    .line 152
    if-ne p0, p1, :cond_0

    .line 153
    const/4 v0, 0x1

    .line 158
    :goto_0
    return v0

    .line 155
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 156
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 158
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static varargs firstNonNull([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .parameter "values"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)TT;"
        }
    .end annotation

    .prologue
    .line 120
    if-eqz p0, :cond_0

    .line 121
    array-length v2, p0

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v2, :cond_2

    .line 127
    :cond_0
    const/4 v0, 0x0

    :cond_1
    return-object v0

    .line 121
    :cond_2
    aget-object v0, p0, v1

    .line 122
    .local v0, val:Ljava/lang/Object;,"TT;"
    if-nez v0, :cond_1

    .line 121
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static hashCode(Ljava/lang/Object;)I
    .locals 1
    .parameter "obj"

    .prologue
    .line 175
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public static identityToString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .parameter "object"

    .prologue
    .line 197
    if-nez p0, :cond_0

    .line 198
    const/4 v1, 0x0

    .line 202
    :goto_0
    return-object v1

    .line 200
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 201
    .local v0, buffer:Ljava/lang/StringBuffer;
    invoke-static {v0, p0}, Lorg/apache/commons/lang3/ObjectUtils;->identityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)V

    .line 202
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static identityToString(Ljava/lang/StringBuffer;Ljava/lang/Object;)V
    .locals 2
    .parameter "buffer"
    .parameter "object"

    .prologue
    .line 221
    if-nez p1, :cond_0

    .line 222
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Cannot get the toString of a null identity"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 224
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 225
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 226
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 227
    return-void
.end method

.method public static max(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>(TT;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 312
    .local p0, c1:Ljava/lang/Comparable;,"TT;"
    .local p1, c2:Ljava/lang/Comparable;,"TT;"
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 313
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 315
    .end local p0           #c1:Ljava/lang/Comparable;,"TT;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0       #c1:Ljava/lang/Comparable;,"TT;"
    :cond_1
    move-object p0, p1

    .line 313
    goto :goto_0

    .line 315
    :cond_2
    if-nez p0, :cond_0

    move-object p0, p1

    goto :goto_0
.end method

.method public static min(Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/lang/Comparable;
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<-TT;>;>(TT;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 291
    .local p0, c1:Ljava/lang/Comparable;,"TT;"
    .local p1, c2:Ljava/lang/Comparable;,"TT;"
    if-eqz p0, :cond_2

    if-eqz p1, :cond_2

    .line 292
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    .line 294
    .end local p0           #c1:Ljava/lang/Comparable;,"TT;"
    :cond_0
    :goto_0
    return-object p0

    .restart local p0       #c1:Ljava/lang/Comparable;,"TT;"
    :cond_1
    move-object p0, p1

    .line 292
    goto :goto_0

    .line 294
    :cond_2
    if-nez p0, :cond_0

    move-object p0, p1

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "obj"

    .prologue
    .line 249
    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "obj"
    .parameter "nullStr"

    .prologue
    .line 272
    if-nez p0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method
