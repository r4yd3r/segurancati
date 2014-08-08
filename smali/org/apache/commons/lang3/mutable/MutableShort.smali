.class public Lorg/apache/commons/lang3/mutable/MutableShort;
.super Ljava/lang/Number;
.source "MutableShort.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Lorg/apache/commons/lang3/mutable/Mutable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Number;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/apache/commons/lang3/mutable/MutableShort;",
        ">;",
        "Lorg/apache/commons/lang3/mutable/Mutable",
        "<",
        "Ljava/lang/Number;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x7f4d983fL


# instance fields
.field private value:S


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 64
    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

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
    invoke-static {p1}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 77
    return-void
.end method

.method public constructor <init>(S)V
    .locals 0
    .parameter "value"

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 53
    iput-short p1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 54
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Number;)V
    .locals 2
    .parameter "operand"

    .prologue
    .line 146
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v1

    add-int/2addr v0, v1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 147
    return-void
.end method

.method public add(S)V
    .locals 1
    .parameter "operand"

    .prologue
    .line 135
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    add-int/2addr v0, p1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 136
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/apache/commons/lang3/mutable/MutableShort;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/mutable/MutableShort;->compareTo(Lorg/apache/commons/lang3/mutable/MutableShort;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/apache/commons/lang3/mutable/MutableShort;)I
    .locals 2
    .parameter "other"

    .prologue
    .line 267
    iget-short v0, p1, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 268
    .local v0, anotherVal:S
    iget-short v1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    if-ge v1, v0, :cond_0

    const/4 v1, -0x1

    :goto_0
    return v1

    :cond_0
    iget-short v1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

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
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    add-int/lit8 v0, v0, -0x1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 125
    return-void
.end method

.method public doubleValue()D
    .locals 2

    .prologue
    .line 219
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    int-to-double v0, v0

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    const/4 v0, 0x0

    .line 243
    instance-of v1, p1, Lorg/apache/commons/lang3/mutable/MutableShort;

    if-eqz v1, :cond_0

    .line 244
    iget-short v1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    check-cast p1, Lorg/apache/commons/lang3/mutable/MutableShort;

    .end local p1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/mutable/MutableShort;->shortValue()S

    move-result v2

    if-ne v1, v2, :cond_0

    const/4 v0, 0x1

    .line 246
    :cond_0
    return v0
.end method

.method public floatValue()F
    .locals 1

    .prologue
    .line 209
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    int-to-float v0, v0

    return v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/lang3/mutable/MutableShort;->getValue()Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Short;
    .locals 2

    .prologue
    .line 86
    new-instance v0, Ljava/lang/Short;

    iget-short v1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 256
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    return v0
.end method

.method public increment()V
    .locals 1

    .prologue
    .line 115
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    add-int/lit8 v0, v0, 0x1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 116
    return-void
.end method

.method public intValue()I
    .locals 1

    .prologue
    .line 189
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    return v0
.end method

.method public longValue()J
    .locals 2

    .prologue
    .line 199
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    int-to-long v0, v0

    return-wide v0
.end method

.method public setValue(Ljava/lang/Number;)V
    .locals 1
    .parameter "value"

    .prologue
    .line 105
    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 106
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/mutable/MutableShort;->setValue(Ljava/lang/Number;)V

    return-void
.end method

.method public setValue(S)V
    .locals 0
    .parameter "value"

    .prologue
    .line 95
    iput-short p1, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 96
    return-void
.end method

.method public shortValue()S
    .locals 1

    .prologue
    .line 179
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    return v0
.end method

.method public subtract(Ljava/lang/Number;)V
    .locals 2
    .parameter "operand"

    .prologue
    .line 167
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v1

    sub-int/2addr v0, v1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 168
    return-void
.end method

.method public subtract(S)V
    .locals 1
    .parameter "operand"

    .prologue
    .line 156
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    sub-int/2addr v0, p1

    int-to-short v0, v0

    iput-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    .line 157
    return-void
.end method

.method public toShort()Ljava/lang/Short;
    .locals 1

    .prologue
    .line 229
    invoke-virtual {p0}, Lorg/apache/commons/lang3/mutable/MutableShort;->shortValue()S

    move-result v0

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 279
    iget-short v0, p0, Lorg/apache/commons/lang3/mutable/MutableShort;->value:S

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
