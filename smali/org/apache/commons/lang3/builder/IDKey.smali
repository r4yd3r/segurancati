.class final Lorg/apache/commons/lang3/builder/IDKey;
.super Ljava/lang/Object;
.source "IDKey.java"


# instance fields
.field private final id:I

.field private final value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .parameter "_value"

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/builder/IDKey;->id:I

    .line 46
    iput-object p1, p0, Lorg/apache/commons/lang3/builder/IDKey;->value:Ljava/lang/Object;

    .line 47
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "other"

    .prologue
    const/4 v1, 0x0

    .line 65
    instance-of v2, p1, Lorg/apache/commons/lang3/builder/IDKey;

    if-nez v2, :cond_1

    .line 73
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 68
    check-cast v0, Lorg/apache/commons/lang3/builder/IDKey;

    .line 69
    .local v0, idKey:Lorg/apache/commons/lang3/builder/IDKey;
    iget v2, p0, Lorg/apache/commons/lang3/builder/IDKey;->id:I

    iget v3, v0, Lorg/apache/commons/lang3/builder/IDKey;->id:I

    if-ne v2, v3, :cond_0

    .line 73
    iget-object v2, p0, Lorg/apache/commons/lang3/builder/IDKey;->value:Ljava/lang/Object;

    iget-object v3, v0, Lorg/apache/commons/lang3/builder/IDKey;->value:Ljava/lang/Object;

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lorg/apache/commons/lang3/builder/IDKey;->id:I

    return v0
.end method
