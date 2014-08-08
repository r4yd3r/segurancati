.class Lorg/apache/commons/lang3/Range$ComparableComparator;
.super Ljava/lang/Object;
.source "Range.java"

# interfaces
.implements Ljava/util/Comparator;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/Range;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ComparableComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E::",
        "Ljava/lang/Comparable",
        "<-TE;>;>",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/commons/lang3/Range$ComparableComparator",
            "<*>;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x1L


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 380
    new-instance v0, Lorg/apache/commons/lang3/Range$ComparableComparator;

    invoke-direct {v0}, Lorg/apache/commons/lang3/Range$ComparableComparator;-><init>()V

    sput-object v0, Lorg/apache/commons/lang3/Range$ComparableComparator;->INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 388
    .local p0, this:Lorg/apache/commons/lang3/Range$ComparableComparator;,"Lorg/apache/commons/lang3/Range<TT;>.ComparableComparator<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    return-void
.end method

.method public static getInstance()Lorg/apache/commons/lang3/Range$ComparableComparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E::",
            "Ljava/lang/Comparable",
            "<-TE;>;>()",
            "Lorg/apache/commons/lang3/Range$ComparableComparator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 384
    sget-object v0, Lorg/apache/commons/lang3/Range$ComparableComparator;->INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator;

    return-object v0
.end method


# virtual methods
.method public compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;TE;)I"
        }
    .end annotation

    .prologue
    .line 392
    .local p0, this:Lorg/apache/commons/lang3/Range$ComparableComparator;,"Lorg/apache/commons/lang3/Range<TT;>.ComparableComparator<TE;>;"
    .local p1, obj1:Ljava/lang/Comparable;,"TE;"
    .local p2, obj2:Ljava/lang/Comparable;,"TE;"
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Comparable;

    check-cast p2, Ljava/lang/Comparable;

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/Range$ComparableComparator;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .parameter "object"

    .prologue
    .line 402
    .local p0, this:Lorg/apache/commons/lang3/Range$ComparableComparator;,"Lorg/apache/commons/lang3/Range<TT;>.ComparableComparator<TE;>;"
    if-eq p0, p1, :cond_1

    .line 403
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 402
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 397
    .local p0, this:Lorg/apache/commons/lang3/Range$ComparableComparator;,"Lorg/apache/commons/lang3/Range<TT;>.ComparableComparator<TE;>;"
    const-string v0, "ComparableComparator"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
