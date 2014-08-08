.class Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
.super Ljava/lang/Object;
.source "FastDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Pair"
.end annotation


# instance fields
.field private final mObj1:Ljava/lang/Object;

.field private final mObj2:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter "obj1"
    .parameter "obj2"

    .prologue
    .line 1711
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1712
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    .line 1713
    iput-object p2, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    .line 1714
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1721
    if-ne p0, p1, :cond_1

    .line 1731
    :cond_0
    :goto_0
    return v1

    .line 1725
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    if-nez v3, :cond_2

    move v1, v2

    .line 1726
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 1729
    check-cast v0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    .line 1732
    .local v0, key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    if-nez v3, :cond_4

    .line 1733
    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    if-nez v3, :cond_3

    .line 1734
    :goto_1
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    if-nez v3, :cond_5

    .line 1735
    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    if-eqz v3, :cond_0

    :cond_3
    move v1, v2

    .line 1731
    goto :goto_0

    .line 1733
    :cond_4
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_1

    .line 1735
    :cond_5
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 1744
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    if-nez v0, :cond_0

    move v0, v1

    .line 1745
    :goto_0
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    if-nez v2, :cond_1

    .line 1744
    :goto_1
    add-int/2addr v0, v1

    .line 1743
    return v0

    .line 1744
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    .line 1745
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1753
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj1:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;->mObj2:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
