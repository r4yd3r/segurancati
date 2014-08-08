.class public Lorg/apache/commons/lang3/mutable/MutableInt;
.super Ljava/lang/Number;
.source "MutableInt.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Lorg/apache/commons/lang3/mutable/Mutable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Number;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/apache/commons/lang3/mutable/MutableInt;",
        ">;",
        "Lorg/apache/commons/lang3/mutable/Mutable",
        "<",
        "Ljava/lang/Number;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x77401786b8L


# instance fields
.field private value:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 44
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 53
    iput p1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 64
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "value"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 77
    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 1
    .parameter "operand"

    .prologue
    .line 135
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    add-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 136
    return-void
.end method

.method public add(Ljava/lang/Number;)V
    .locals 2
    .parameter "operand"

    .prologue
    .line 146
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 147
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/apache/commons/lang3/mutable/MutableInt;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/mutable/MutableInt;->compareTo(Lorg/apache/commons/lang3/mutable/MutableInt;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/apache/commons/lang3/mutable/MutableInt;)I
    .locals 2
    .parameter "other"

    .prologue
    .line 257
    iget v0, p1, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 258
    .local v0, anotherVal:I
    iget v1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    if-ge v1, v0, :cond_0

    const/4 v1, -0x1

    :goto_0
    return v1

    :cond_0
    iget v1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    if-ne v1, v0, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public decrement()V
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 125
    return-void
.end method

.method public doubleValue()D
    .locals 2

    .prologue
    .line 209
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    int-to-double v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    const/4 v0, 0x0

    .line 233
    instance-of v1, p1, Lorg/apache/commons/lang3/mutable/MutableInt;

    if-eqz v1, :cond_0

    .line 234
    iget v1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    check-cast p1, Lorg/apache/commons/lang3/mutable/MutableInt;

    .end local p1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/mutable/MutableInt;->intValue()I

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 236
    :cond_0
    return v0
.end method

.method public floatValue()F
    .locals 1

    .prologue
    .line 199
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    int-to-float v0, v0

    return v0
.end method

.method public getValue()Ljava/lang/Integer;
    .locals 2

    .prologue
    .line 86
    new-instance v0, Ljava/lang/Integer;

    iget v1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/mutable/MutableInt;->getValue()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 246
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    return v0
.end method

.method public increment()V
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 116
    return-void
.end method

.method public intValue()I
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    return v0
.end method

.method public longValue()J
    .locals 2

    .prologue
    .line 189
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public setValue(I)V
    .locals 0
    .parameter "value"

    .prologue
    .line 95
    iput p1, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 96
    return-void
.end method

.method public setValue(Ljava/lang/Number;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 105
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 106
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/mutable/MutableInt;->setValue(Ljava/lang/Number;)V

    return-void
.end method

.method public subtract(I)V
    .locals 1
    .parameter "operand"

    .prologue
    .line 156
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    sub-int/2addr v0, p1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 157
    return-void
.end method

.method public subtract(Ljava/lang/Number;)V
    .locals 2
    .parameter "operand"

    .prologue
    .line 167
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    .line 168
    return-void
.end method

.method public toInteger()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 219
    invoke-virtual {p0}, Lorg/apache/commons/lang3/mutable/MutableInt;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 269
    iget v0, p0, Lorg/apache/commons/lang3/mutable/MutableInt;->value:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
