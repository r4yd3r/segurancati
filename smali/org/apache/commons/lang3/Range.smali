.class public final Lorg/apache/commons/lang3/Range;
.super Ljava/lang/Object;
.source "Range.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/Range$ComparableComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<TT;>;"
        }
    .end annotation
.end field

.field private transient hashCode:I

.field private final maximum:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final minimum:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private transient toString:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 3
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, element1:Ljava/lang/Object;,"TT;"
    .local p2, element2:Ljava/lang/Object;,"TT;"
    .local p3, c:Ljava/util/Comparator;,"Ljava/util/Comparator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang3/Range;->toString:Ljava/lang/String;

    .line 135
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 136
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Elements in a range must not be null: element1="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", element2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 136
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_1
    if-nez p3, :cond_2

    .line 141
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Comparator must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 144
    :cond_2
    invoke-interface {p3, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_3

    .line 145
    iput-object p1, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    .line 146
    iput-object p2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    .line 151
    :goto_0
    iput-object p3, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    .line 152
    return-void

    .line 148
    :cond_3
    iput-object p2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    .line 149
    iput-object p1, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    goto :goto_0
.end method

.method public static between(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lorg/apache/commons/lang3/Range;
    .locals 2
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<TT;>;>(TT;TT;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, element1:Ljava/lang/Comparable;,"TT;"
    .local p1, element2:Ljava/lang/Comparable;,"TT;"
    new-instance v0, Lorg/apache/commons/lang3/Range;

    invoke-static {}, Lorg/apache/commons/lang3/Range$ComparableComparator;->getInstance()Lorg/apache/commons/lang3/Range$ComparableComparator;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lorg/apache/commons/lang3/Range;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;
    .locals 1
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;",
            "Ljava/util/Comparator",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, element1:Ljava/lang/Object;,"TT;"
    .local p1, element2:Ljava/lang/Object;,"TT;"
    .local p2, c:Ljava/util/Comparator;,"Ljava/util/Comparator<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/Range;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/lang3/Range;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static is(Ljava/lang/Comparable;)Lorg/apache/commons/lang3/Range;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<TT;>;>(TT;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 78
    .local p0, element:Ljava/lang/Comparable;,"TT;"
    new-instance v0, Lorg/apache/commons/lang3/Range;

    invoke-static {}, Lorg/apache/commons/lang3/Range$ComparableComparator;->getInstance()Lorg/apache/commons/lang3/Range$ComparableComparator;

    move-result-object v1

    invoke-direct {v0, p0, p0, v1}, Lorg/apache/commons/lang3/Range;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static is(Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/Comparator",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, element:Ljava/lang/Object;,"TT;"
    .local p1, c:Ljava/util/Comparator;,"Ljava/util/Comparator<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/Range;

    invoke-direct {v0, p0, p0, p1}, Lorg/apache/commons/lang3/Range;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object v0
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, element:Ljava/lang/Object;,"TT;"
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 206
    if-nez p1, :cond_1

    .line 209
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v2, p1, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-le v2, v3, :cond_0

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v2, p1, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ge v2, v1, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public containsRange(Lorg/apache/commons/lang3/Range;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, range:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v0, 0x0

    .line 282
    if-nez p1, :cond_1

    .line 285
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/Range;->getMinimum()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 286
    invoke-virtual {p1}, Lorg/apache/commons/lang3/Range;->getMaximum()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 285
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public elementAfter(Ljava/lang/Object;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, element:Ljava/lang/Object;,"TT;"
    const/4 v0, 0x0

    .line 237
    if-nez p1, :cond_1

    .line 241
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public elementBefore(Ljava/lang/Object;)Z
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, element:Ljava/lang/Object;,"TT;"
    const/4 v0, 0x0

    .line 221
    if-nez p1, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public elementCompareTo(Ljava/lang/Object;)I
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 254
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, element:Ljava/lang/Object;,"TT;"
    if-nez p1, :cond_0

    .line 256
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Element is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 258
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->elementBefore(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 259
    const/4 v0, -0x1

    .line 264
    :goto_0
    return v0

    .line 261
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->elementAfter(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 262
    const/4 v0, 0x1

    goto :goto_0

    .line 264
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 321
    if-ne p1, p0, :cond_1

    .line 328
    :cond_0
    :goto_0
    return v1

    .line 323
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 324
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 327
    check-cast v0, Lorg/apache/commons/lang3/Range;

    .line 328
    .local v0, range:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/Range;->getMinimum()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/Range;->getMinimum()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 329
    invoke-virtual {p0}, Lorg/apache/commons/lang3/Range;->getMaximum()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/Range;->getMaximum()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    .line 328
    goto :goto_0
.end method

.method public getComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 181
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public getMaximum()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    return-object v0
.end method

.method public getMinimum()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 340
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget v0, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    .line 341
    .local v0, result:I
    iget v1, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    if-nez v1, :cond_0

    .line 342
    const/16 v0, 0x11

    .line 343
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x275

    .line 344
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 345
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 346
    iput v0, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    .line 348
    :cond_0
    return v0
.end method

.method public isDefaultNaturalOrdering()Z
    .locals 2

    .prologue
    .line 191
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    sget-object v1, Lorg/apache/commons/lang3/Range$ComparableComparator;->INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public overlapsRange(Lorg/apache/commons/lang3/Range;)Z
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, range:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v0, 0x0

    .line 300
    if-nez p1, :cond_1

    .line 303
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 304
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 305
    invoke-virtual {p1}, Lorg/apache/commons/lang3/Range;->getMinimum()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 303
    :cond_2
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 360
    .local p0, this:Lorg/apache/commons/lang3/Range;,"Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->toString:Ljava/lang/String;

    .line 361
    .local v1, result:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 362
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 363
    .local v0, buf:Ljava/lang/StringBuilder;
    const-string v2, "Range["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 365
    const/16 v2, 0x2c

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 366
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 367
    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 368
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 369
    iput-object v1, p0, Lorg/apache/commons/lang3/Range;->toString:Ljava/lang/String;

    .line 371
    .end local v0           #buf:Ljava/lang/StringBuilder;
    :cond_0
    return-object v1
.end method
