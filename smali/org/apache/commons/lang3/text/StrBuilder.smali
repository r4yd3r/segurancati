.class public Lorg/apache/commons/lang3/text/StrBuilder;
.super Ljava/lang/Object;
.source "StrBuilder.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/lang/Appendable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;,
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;,
        Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;
    }
.end annotation


# static fields
.field static final CAPACITY:I = 0x20

.field private static final serialVersionUID:J = 0x69dea51fe8fc7e4bL


# instance fields
.field protected buffer:[C

.field private newLine:Ljava/lang/String;

.field private nullText:Ljava/lang/String;

.field protected size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 102
    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;-><init>(I)V

    .line 103
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .parameter "initialCapacity"

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    if-gtz p1, :cond_0

    .line 113
    const/16 p1, 0x20

    .line 115
    :cond_0
    new-array v0, p1, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 116
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "str"

    .prologue
    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    if-nez p1, :cond_0

    .line 127
    const/16 v0, 0x20

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 132
    :goto_0
    return-void

    .line 129
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x20

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 130
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method private deleteImpl(III)V
    .locals 3
    .parameter "startIndex"
    .parameter "endIndex"
    .parameter "len"

    .prologue
    .line 1555
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p2

    invoke-static {v0, p2, v1, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1556
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v0, p3

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1557
    return-void
.end method

.method private replaceImpl(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .parameter "matcher"
    .parameter "replaceStr"
    .parameter "from"
    .parameter "to"
    .parameter "replaceCount"

    .prologue
    .line 1876
    if-eqz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v0, :cond_1

    .line 1892
    :cond_0
    return-object p0

    .line 1879
    :cond_1
    if-nez p2, :cond_3

    const/4 v5, 0x0

    .line 1880
    .local v5, replaceLen:I
    :goto_0
    iget-object v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 1881
    .local v6, buf:[C
    move v1, p3

    .local v1, i:I
    :goto_1
    if-ge v1, p4, :cond_0

    if-eqz p5, :cond_0

    .line 1882
    invoke-virtual {p1, v6, v1, p3, p4}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v3

    .line 1883
    .local v3, removeLen:I
    if-lez v3, :cond_2

    .line 1884
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1885
    sub-int v0, p4, v3

    add-int p4, v0, v5

    .line 1886
    add-int v0, v1, v5

    add-int/lit8 v1, v0, -0x1

    .line 1887
    if-lez p5, :cond_2

    .line 1888
    add-int/lit8 p5, p5, -0x1

    .line 1881
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1879
    .end local v1           #i:I
    .end local v3           #removeLen:I
    .end local v5           #replaceLen:I
    .end local v6           #buf:[C
    :cond_3
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_0
.end method

.method private replaceImpl(IIILjava/lang/String;I)V
    .locals 5
    .parameter "startIndex"
    .parameter "endIndex"
    .parameter "removeLen"
    .parameter "insertStr"
    .parameter "insertLen"

    .prologue
    .line 1694
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v1, p3

    add-int v0, v1, p5

    .line 1695
    .local v0, newSize:I
    if-eq p5, p3, :cond_0

    .line 1696
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1697
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v3, p1, p5

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p2

    invoke-static {v1, p2, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1698
    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1700
    :cond_0
    if-lez p5, :cond_1

    .line 1701
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p4, v1, p5, v2, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1703
    :cond_1
    return-void
.end method


# virtual methods
.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/CharSequence;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .locals 1
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/CharSequence;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "ch"

    .prologue
    .line 722
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 723
    .local v0, len:I
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 724
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char p1, v1, v2

    .line 725
    return-object p0
.end method

.method public append(D)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 765
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(F)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 755
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 735
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(J)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 745
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/CharSequence;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "seq"

    .prologue
    .line 473
    if-nez p1, :cond_0

    .line 474
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 476
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/CharSequence;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "seq"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 489
    if-nez p1, :cond_0

    .line 490
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 492
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "obj"

    .prologue
    .line 459
    if-nez p1, :cond_0

    .line 460
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 462
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "str"

    .prologue
    .line 503
    if-nez p1, :cond_1

    .line 504
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 513
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 506
    .restart local p0
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 507
    .local v1, strLen:I
    if-lez v1, :cond_0

    .line 508
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 509
    .local v0, len:I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 510
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v1, v3, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 511
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 526
    if-nez p1, :cond_1

    .line 527
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 541
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 529
    .restart local p0
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 530
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 532
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 533
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 535
    :cond_5
    if-lez p3, :cond_0

    .line 536
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 537
    .local v0, len:I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 538
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/String;->getChars(II[CI)V

    .line 539
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "str"

    .prologue
    .line 552
    if-nez p1, :cond_1

    .line 553
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 562
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 555
    .restart local p0
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    .line 556
    .local v1, strLen:I
    if-lez v1, :cond_0

    .line 557
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 558
    .local v0, len:I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 559
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, v2, v1, v3, v0}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 560
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 575
    if-nez p1, :cond_1

    .line 576
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 590
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 578
    .restart local p0
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 579
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 581
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 582
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 584
    :cond_5
    if-lez p3, :cond_0

    .line 585
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 586
    .local v0, len:I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 587
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 588
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .parameter "str"

    .prologue
    .line 601
    if-nez p1, :cond_1

    .line 602
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 611
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 604
    .restart local p0
    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    .line 605
    .local v1, strLen:I
    if-lez v1, :cond_0

    .line 606
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 607
    .local v0, len:I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 608
    iget-object v2, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {v2, v3, v4, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 609
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 624
    if-nez p1, :cond_1

    .line 625
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 639
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 627
    .restart local p0
    :cond_1
    if-ltz p2, :cond_2

    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    if-le p2, v1, :cond_3

    .line 628
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "startIndex must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 630
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    invoke-virtual {p1}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v2

    if-le v1, v2, :cond_5

    .line 631
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v2, "length must be valid"

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 633
    :cond_5
    if-lez p3, :cond_0

    .line 634
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 635
    .local v0, len:I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 636
    add-int v1, p2, p3

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p1, p2, v1, v2, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->getChars(II[CI)V

    .line 637
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append(Z)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "value"

    .prologue
    const/16 v3, 0x65

    .line 698
    if-eqz p1, :cond_0

    .line 699
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 700
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x74

    aput-char v2, v0, v1

    .line 701
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x72

    aput-char v2, v0, v1

    .line 702
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x75

    aput-char v2, v0, v1

    .line 703
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char v3, v0, v1

    .line 712
    :goto_0
    return-object p0

    .line 705
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x5

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 706
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x66

    aput-char v2, v0, v1

    .line 707
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x61

    aput-char v2, v0, v1

    .line 708
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x6c

    aput-char v2, v0, v1

    .line 709
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/16 v2, 0x73

    aput-char v2, v0, v1

    .line 710
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char v3, v0, v1

    goto :goto_0
.end method

.method public append([C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "chars"

    .prologue
    .line 650
    if-nez p1, :cond_1

    .line 651
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 660
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 653
    .restart local p0
    :cond_1
    array-length v1, p1

    .line 654
    .local v1, strLen:I
    if-lez v1, :cond_0

    .line 655
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 656
    .local v0, len:I
    add-int v2, v0, v1

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 657
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p1, v2, v3, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 658
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v2, v1

    iput v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public append([CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "chars"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 673
    if-nez p1, :cond_1

    .line 674
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNull()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 688
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 676
    .restart local p0
    :cond_1
    if-ltz p2, :cond_2

    array-length v1, p1

    if-le p2, v1, :cond_3

    .line 677
    :cond_2
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid startIndex: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 679
    :cond_3
    if-ltz p3, :cond_4

    add-int v1, p2, p3

    array-length v2, p1

    if-le v1, v2, :cond_5

    .line 680
    :cond_4
    new-instance v1, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid length: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 682
    :cond_5
    if-lez p3, :cond_0

    .line 683
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 684
    .local v0, len:I
    add-int v1, v0, p3

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 685
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 686
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p3

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public appendAll(Ljava/lang/Iterable;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;)",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 980
    .local p1, iterable:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    if-eqz p1, :cond_0

    .line 981
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 982
    .local v0, it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 986
    .end local v0           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_0
    return-object p0

    .line 983
    .restart local v0       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendAll(Ljava/util/Iterator;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;)",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 999
    .local p1, it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    if-eqz p1, :cond_0

    .line 1000
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1004
    :cond_0
    return-object p0

    .line 1001
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendAll([Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "array"

    .prologue
    .line 962
    if-eqz p1, :cond_0

    array-length v1, p1

    if-lez v1, :cond_0

    .line 963
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_1

    .line 967
    .end local v0           #i:I
    :cond_0
    return-object p0

    .line 964
    .restart local v0       #i:I
    :cond_1
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 963
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public appendFixedWidthPadLeft(IIC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"
    .parameter "width"
    .parameter "padChar"

    .prologue
    .line 1301
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadLeft(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .parameter "obj"
    .parameter "width"
    .parameter "padChar"

    .prologue
    .line 1269
    if-lez p2, :cond_1

    .line 1270
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1271
    if-nez p1, :cond_2

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v2

    .line 1272
    .local v2, str:Ljava/lang/String;
    :goto_0
    if-nez v2, :cond_0

    .line 1273
    const-string v2, ""

    .line 1275
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1276
    .local v3, strLen:I
    if-lt v3, p2, :cond_3

    .line 1277
    sub-int v4, v3, p2

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v4, v3, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    .line 1285
    :goto_1
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    iput v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1287
    .end local v2           #str:Ljava/lang/String;
    .end local v3           #strLen:I
    :cond_1
    return-object p0

    .line 1271
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1279
    .restart local v2       #str:Ljava/lang/String;
    .restart local v3       #strLen:I
    :cond_3
    sub-int v1, p2, v3

    .line 1280
    .local v1, padLen:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_2
    if-lt v0, v1, :cond_4

    .line 1283
    const/4 v4, 0x0

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v6, v1

    invoke-virtual {v2, v4, v3, v5, v6}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_1

    .line 1281
    :cond_4
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v5, v0

    aput-char p3, v4, v5

    .line 1280
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public appendFixedWidthPadRight(IIC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"
    .parameter "width"
    .parameter "padChar"

    .prologue
    .line 1348
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendFixedWidthPadRight(Ljava/lang/Object;IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .parameter "obj"
    .parameter "width"
    .parameter "padChar"

    .prologue
    const/4 v6, 0x0

    .line 1316
    if-lez p2, :cond_2

    .line 1317
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    invoke-virtual {p0, v4}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1318
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->getNullText()Ljava/lang/String;

    move-result-object v2

    .line 1319
    .local v2, str:Ljava/lang/String;
    :goto_0
    if-nez v2, :cond_0

    .line 1320
    const-string v2, ""

    .line 1322
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1323
    .local v3, strLen:I
    if-lt v3, p2, :cond_4

    .line 1324
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v6, p2, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 1332
    :cond_1
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v4, p2

    iput v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1334
    .end local v2           #str:Ljava/lang/String;
    .end local v3           #strLen:I
    :cond_2
    return-object p0

    .line 1318
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 1326
    .restart local v2       #str:Ljava/lang/String;
    .restart local v3       #strLen:I
    :cond_4
    sub-int v1, p2, v3

    .line 1327
    .local v1, padLen:I
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v2, v6, v3, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 1328
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_1

    .line 1329
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v5, v3

    add-int/2addr v5, v0

    aput-char p3, v4, v5

    .line 1328
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 432
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 433
    sget-object v0, Lorg/apache/commons/lang3/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 436
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public appendNull()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 448
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    goto :goto_0
.end method

.method public appendPadding(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "length"
    .parameter "padChar"

    .prologue
    .line 1247
    if-ltz p1, :cond_0

    .line 1248
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, p1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1249
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, p1, :cond_1

    .line 1253
    .end local v0           #i:I
    :cond_0
    return-object p0

    .line 1250
    .restart local v0       #i:I
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    aput-char p2, v1, v2

    .line 1249
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public appendSeparator(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "separator"

    .prologue
    .line 1157
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1158
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1160
    :cond_0
    return-object p0
.end method

.method public appendSeparator(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "standard"
    .parameter "defaultIfEmpty"

    .prologue
    .line 1175
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1176
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1181
    :goto_0
    return-object p0

    .line 1179
    :cond_0
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendSeparator(CI)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .parameter "separator"
    .parameter "loopIndex"

    .prologue
    .line 1232
    if-lez p2, :cond_0

    .line 1233
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1235
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "separator"

    .prologue
    .line 1099
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendSeparator(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendSeparator(Ljava/lang/String;I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .parameter "separator"
    .parameter "loopIndex"

    .prologue
    .line 1205
    if-eqz p1, :cond_0

    if-lez p2, :cond_0

    .line 1206
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1208
    :cond_0
    return-object p0
.end method

.method public appendSeparator(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "standard"
    .parameter "defaultIfEmpty"

    .prologue
    .line 1130
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    move-object v0, p2

    .line 1131
    .local v0, str:Ljava/lang/String;
    :goto_0
    if-eqz v0, :cond_0

    .line 1132
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1134
    :cond_0
    return-object p0

    .end local v0           #str:Ljava/lang/String;
    :cond_1
    move-object v0, p1

    .line 1130
    goto :goto_0
.end method

.method public appendWithSeparators(Ljava/lang/Iterable;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1041
    .local p1, iterable:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    if-eqz p1, :cond_2

    .line 1042
    if-nez p2, :cond_0

    const-string p2, ""

    .line 1043
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1044
    .local v0, it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3

    .line 1051
    .end local v0           #it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_2
    return-object p0

    .line 1045
    .restart local v0       #it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1046
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1047
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendWithSeparators(Ljava/util/Iterator;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/commons/lang3/text/StrBuilder;"
        }
    .end annotation

    .prologue
    .line 1065
    .local p1, it:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    if-eqz p1, :cond_1

    .line 1066
    if-nez p2, :cond_0

    const-string p2, ""

    .line 1067
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1074
    :cond_1
    return-object p0

    .line 1068
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1069
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1070
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0
.end method

.method public appendWithSeparators([Ljava/lang/Object;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "array"
    .parameter "separator"

    .prologue
    .line 1019
    if-eqz p1, :cond_1

    array-length v1, p1

    if-lez v1, :cond_1

    .line 1020
    if-nez p2, :cond_0

    const-string p2, ""

    .line 1021
    :cond_0
    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1022
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_2

    .line 1027
    .end local v0           #i:I
    :cond_1
    return-object p0

    .line 1023
    .restart local v0       #i:I
    :cond_2
    invoke-virtual {p0, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1024
    aget-object v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1022
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public appendln(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "ch"

    .prologue
    .line 904
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(D)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 948
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(D)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(F)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 937
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(F)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 915
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(I)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(J)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 926
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->append(J)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "obj"

    .prologue
    .line 778
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"

    .prologue
    .line 790
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 804
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/String;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"

    .prologue
    .line 816
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuffer;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 830
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Ljava/lang/StringBuffer;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"

    .prologue
    .line 842
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Lorg/apache/commons/lang3/text/StrBuilder;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "str"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 856
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Lorg/apache/commons/lang3/text/StrBuilder;II)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln(Z)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "value"

    .prologue
    .line 893
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append(Z)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "chars"

    .prologue
    .line 868
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->append([C)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public appendln([CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "chars"
    .parameter "startIndex"
    .parameter "length"

    .prologue
    .line 882
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/text/StrBuilder;->append([CII)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/text/StrBuilder;->appendNewLine()Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public asReader()Ljava/io/Reader;
    .locals 1

    .prologue
    .line 2466
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderReader;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public asTokenizer()Lorg/apache/commons/lang3/text/StrTokenizer;
    .locals 1

    .prologue
    .line 2442
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderTokenizer;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public asWriter()Ljava/io/Writer;
    .locals 1

    .prologue
    .line 2491
    new-instance v0, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrBuilder$StrBuilderWriter;-><init>(Lorg/apache/commons/lang3/text/StrBuilder;)V

    return-object v0
.end method

.method public capacity()I
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .locals 1
    .parameter "index"

    .prologue
    .line 306
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 307
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 309
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v0, v0, p1

    return v0
.end method

.method public clear()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1

    .prologue
    .line 291
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 292
    return-object p0
.end method

.method public contains(C)Z
    .locals 3
    .parameter "ch"

    .prologue
    .line 2129
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2130
    .local v1, thisBuf:[C
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v2, :cond_0

    .line 2135
    const/4 v2, 0x0

    :goto_1
    return v2

    .line 2131
    :cond_0
    aget-char v2, v1, v0

    if-ne v2, p1, :cond_1

    .line 2132
    const/4 v2, 0x1

    goto :goto_1

    .line 2130
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 2
    .parameter "str"

    .prologue
    const/4 v0, 0x0

    .line 2145
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public contains(Lorg/apache/commons/lang3/text/StrMatcher;)Z
    .locals 2
    .parameter "matcher"

    .prologue
    const/4 v0, 0x0

    .line 2160
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public delete(II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 1569
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1570
    sub-int v0, p2, p1

    .line 1571
    .local v0, len:I
    if-lez v0, :cond_0

    .line 1572
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1574
    :cond_0
    return-object p0
.end method

.method public deleteAll(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "ch"

    .prologue
    .line 1585
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v3, :cond_0

    .line 1598
    return-object p0

    .line 1586
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v3, v3, v0

    if-ne v3, p1, :cond_2

    .line 1587
    move v2, v0

    .line 1588
    .local v2, start:I
    :cond_1
    add-int/lit8 v0, v0, 0x1

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v3, :cond_3

    .line 1593
    :goto_1
    sub-int v1, v0, v2

    .line 1594
    .local v1, len:I
    invoke-direct {p0, v2, v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1595
    sub-int/2addr v0, v1

    .line 1585
    .end local v1           #len:I
    .end local v2           #start:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1589
    .restart local v2       #start:I
    :cond_3
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v3, v3, v0

    if-eq v3, p1, :cond_1

    goto :goto_1
.end method

.method public deleteAll(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "str"

    .prologue
    const/4 v2, 0x0

    .line 1625
    if-nez p1, :cond_1

    move v1, v2

    .line 1626
    .local v1, len:I
    :goto_0
    if-lez v1, :cond_0

    .line 1627
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1628
    .local v0, index:I
    :goto_1
    if-gez v0, :cond_2

    .line 1633
    .end local v0           #index:I
    :cond_0
    return-object p0

    .line 1625
    .end local v1           #len:I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0

    .line 1629
    .restart local v0       #index:I
    .restart local v1       #len:I
    :cond_2
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1630
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_1
.end method

.method public deleteAll(Lorg/apache/commons/lang3/text/StrMatcher;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "matcher"

    .prologue
    .line 1665
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public deleteCharAt(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "index"

    .prologue
    .line 340
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 341
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 343
    :cond_1
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 344
    return-object p0
.end method

.method public deleteFirst(C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "ch"

    .prologue
    .line 1608
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v1, :cond_0

    .line 1614
    :goto_1
    return-object p0

    .line 1609
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_1

    .line 1610
    add-int/lit8 v1, v0, 0x1

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    goto :goto_1

    .line 1608
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public deleteFirst(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 3
    .parameter "str"

    .prologue
    const/4 v2, 0x0

    .line 1643
    if-nez p1, :cond_1

    move v1, v2

    .line 1644
    .local v1, len:I
    :goto_0
    if-lez v1, :cond_0

    .line 1645
    invoke-virtual {p0, p1, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 1646
    .local v0, index:I
    if-ltz v0, :cond_0

    .line 1647
    add-int v2, v0, v1

    invoke-direct {p0, v0, v2, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->deleteImpl(III)V

    .line 1650
    .end local v0           #index:I
    :cond_0
    return-object p0

    .line 1643
    .end local v1           #len:I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0
.end method

.method public deleteFirst(Lorg/apache/commons/lang3/text/StrMatcher;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "matcher"

    .prologue
    .line 1679
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public endsWith(Ljava/lang/String;)Z
    .locals 7
    .parameter "str"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1982
    if-nez p1, :cond_1

    .line 1998
    :cond_0
    :goto_0
    return v3

    .line 1985
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1986
    .local v1, len:I
    if-nez v1, :cond_2

    move v3, v4

    .line 1987
    goto :goto_0

    .line 1989
    :cond_2
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v1, v5, :cond_0

    .line 1992
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int v2, v5, v1

    .line 1993
    .local v2, pos:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_3

    move v3, v4

    .line 1998
    goto :goto_0

    .line 1994
    :cond_3
    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v5, v5, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v5, v6, :cond_0

    .line 1993
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "capacity"

    .prologue
    const/4 v3, 0x0

    .line 232
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v1, v1

    if-le p1, v1, :cond_0

    .line 233
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 234
    .local v0, old:[C
    mul-int/lit8 v1, p1, 0x2

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 235
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 237
    .end local v0           #old:[C
    :cond_0
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "obj"

    .prologue
    .line 2584
    instance-of v0, p1, Lorg/apache/commons/lang3/text/StrBuilder;

    if-eqz v0, :cond_0

    .line 2585
    check-cast p1, Lorg/apache/commons/lang3/text/StrBuilder;

    .end local p1
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->equals(Lorg/apache/commons/lang3/text/StrBuilder;)Z

    move-result v0

    .line 2587
    :goto_0
    return v0

    .restart local p1
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public equals(Lorg/apache/commons/lang3/text/StrBuilder;)Z
    .locals 7
    .parameter "other"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 2559
    if-ne p0, p1, :cond_1

    .line 2572
    :cond_0
    :goto_0
    return v3

    .line 2562
    :cond_1
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    iget v6, p1, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-eq v5, v6, :cond_2

    move v3, v4

    .line 2563
    goto :goto_0

    .line 2565
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2566
    .local v2, thisBuf:[C
    iget-object v1, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2567
    .local v1, otherBuf:[C
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v5, -0x1

    .local v0, i:I
    :goto_1
    if-ltz v0, :cond_0

    .line 2568
    aget-char v5, v2, v0

    aget-char v6, v1, v0

    if-eq v5, v6, :cond_3

    move v3, v4

    .line 2569
    goto :goto_0

    .line 2567
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public equalsIgnoreCase(Lorg/apache/commons/lang3/text/StrBuilder;)Z
    .locals 9
    .parameter "other"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 2533
    if-ne p0, p1, :cond_1

    .line 2548
    :cond_0
    :goto_0
    return v5

    .line 2536
    :cond_1
    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    iget v8, p1, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-eq v7, v8, :cond_2

    move v5, v6

    .line 2537
    goto :goto_0

    .line 2539
    :cond_2
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2540
    .local v4, thisBuf:[C
    iget-object v3, p1, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2541
    .local v3, otherBuf:[C
    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v7, -0x1

    .local v2, i:I
    :goto_1
    if-ltz v2, :cond_0

    .line 2542
    aget-char v0, v4, v2

    .line 2543
    .local v0, c1:C
    aget-char v1, v3, v2

    .line 2544
    .local v1, c2:C
    if-eq v0, v1, :cond_3

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v7

    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v8

    if-eq v7, v8, :cond_3

    move v5, v6

    .line 2545
    goto :goto_0

    .line 2541
    :cond_3
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method public getChars(II[CI)V
    .locals 2
    .parameter "startIndex"
    .parameter "endIndex"
    .parameter "destination"
    .parameter "destinationIndex"

    .prologue
    .line 409
    if-gez p1, :cond_0

    .line 410
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 412
    :cond_0
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-le p2, v0, :cond_2

    .line 413
    :cond_1
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 415
    :cond_2
    if-le p1, p2, :cond_3

    .line 416
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 418
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    sub-int v1, p2, p1

    invoke-static {v0, p1, p3, p4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 419
    return-void
.end method

.method public getChars([C)[C
    .locals 3
    .parameter "destination"

    .prologue
    const/4 v2, 0x0

    .line 390
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    .line 391
    .local v0, len:I
    if-eqz p1, :cond_0

    array-length v1, p1

    if-ge v1, v0, :cond_1

    .line 392
    :cond_0
    new-array p1, v0, [C

    .line 394
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {v1, v2, p1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 395
    return-object p1
.end method

.method public getNewLineText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    return-object v0
.end method

.method public getNullText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    .line 2597
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2598
    .local v0, buf:[C
    const/4 v1, 0x0

    .line 2599
    .local v1, hash:I
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v2, v3, -0x1

    .local v2, i:I
    :goto_0
    if-gez v2, :cond_0

    .line 2602
    return v1

    .line 2600
    :cond_0
    mul-int/lit8 v3, v1, 0x1f

    aget-char v4, v0, v2

    add-int v1, v3, v4

    .line 2599
    add-int/lit8 v2, v2, -0x1

    goto :goto_0
.end method

.method public indexOf(C)I
    .locals 1
    .parameter "ch"

    .prologue
    .line 2171
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(CI)I

    move-result v0

    return v0
.end method

.method public indexOf(CI)I
    .locals 4
    .parameter "ch"
    .parameter "startIndex"

    .prologue
    const/4 v2, -0x1

    .line 2182
    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 2183
    :cond_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v3, :cond_2

    move v0, v2

    .line 2192
    :cond_1
    :goto_0
    return v0

    .line 2186
    :cond_2
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2187
    .local v1, thisBuf:[C
    move v0, p2

    .local v0, i:I
    :goto_1
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v3, :cond_3

    move v0, v2

    .line 2192
    goto :goto_0

    .line 2188
    :cond_3
    aget-char v3, v1, v0

    if-eq v3, p1, :cond_1

    .line 2187
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 1
    .parameter "str"

    .prologue
    .line 2204
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/String;I)I
    .locals 8
    .parameter "str"
    .parameter "startIndex"

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 2218
    if-gez p2, :cond_0

    move p2, v6

    .line 2219
    :cond_0
    if-eqz p1, :cond_1

    iget v7, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v7, :cond_3

    :cond_1
    move p2, v5

    .line 2243
    .end local p2
    :cond_2
    :goto_0
    return p2

    .line 2222
    .restart local p2
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 2223
    .local v3, strLen:I
    const/4 v7, 0x1

    if-ne v3, v7, :cond_4

    .line 2224
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {p0, v5, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(CI)I

    move-result p2

    goto :goto_0

    .line 2226
    :cond_4
    if-eqz v3, :cond_2

    .line 2229
    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le v3, v6, :cond_5

    move p2, v5

    .line 2230
    goto :goto_0

    .line 2232
    :cond_5
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2233
    .local v4, thisBuf:[C
    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v6, v3

    add-int/lit8 v2, v6, 0x1

    .line 2235
    .local v2, len:I
    move v0, p2

    .local v0, i:I
    :goto_1
    if-lt v0, v2, :cond_6

    move p2, v5

    .line 2243
    goto :goto_0

    .line 2236
    :cond_6
    const/4 v1, 0x0

    .local v1, j:I
    :goto_2
    if-lt v1, v3, :cond_7

    move p2, v0

    .line 2241
    goto :goto_0

    .line 2237
    :cond_7
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int v7, v0, v1

    aget-char v7, v4, v7

    if-eq v6, v7, :cond_8

    .line 2235
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2236
    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public indexOf(Lorg/apache/commons/lang3/text/StrMatcher;)I
    .locals 1
    .parameter "matcher"

    .prologue
    .line 2257
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public indexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I
    .locals 5
    .parameter "matcher"
    .parameter "startIndex"

    .prologue
    const/4 v3, -0x1

    .line 2273
    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 2274
    :cond_0
    if-eqz p1, :cond_1

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_3

    :cond_1
    move v1, v3

    .line 2284
    :cond_2
    :goto_0
    return v1

    .line 2277
    :cond_3
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 2278
    .local v2, len:I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2279
    .local v0, buf:[C
    move v1, p2

    .local v1, i:I
    :goto_1
    if-lt v1, v2, :cond_4

    move v1, v3

    .line 2284
    goto :goto_0

    .line 2280
    :cond_4
    invoke-virtual {p1, v0, v1, p2, v2}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-gtz v4, :cond_2

    .line 2279
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public insert(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "index"
    .parameter "value"

    .prologue
    .line 1489
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1490
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1491
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v2, p1, 0x1

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1492
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 1493
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1494
    return-object p0
.end method

.method public insert(ID)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 1542
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IF)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 1530
    invoke-static {p2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(II)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 1506
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(IJ)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "value"

    .prologue
    .line 1518
    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public insert(ILjava/lang/Object;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "obj"

    .prologue
    .line 1362
    if-nez p2, :cond_0

    .line 1363
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    .line 1365
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    goto :goto_0
.end method

.method public insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 7
    .parameter "index"
    .parameter "str"

    .prologue
    const/4 v2, 0x0

    .line 1379
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1380
    if-nez p2, :cond_0

    .line 1381
    iget-object p2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 1383
    :cond_0
    if-nez p2, :cond_2

    move v1, v2

    .line 1384
    .local v1, strLen:I
    :goto_0
    if-lez v1, :cond_1

    .line 1385
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int v0, v3, v1

    .line 1386
    .local v0, newSize:I
    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1387
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v5, p1, v1

    iget v6, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v6, p1

    invoke-static {v3, p1, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1388
    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1389
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-virtual {p2, v2, v1, v3, p1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1391
    .end local v0           #newSize:I
    :cond_1
    return-object p0

    .line 1383
    .end local v1           #strLen:I
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_0
.end method

.method public insert(IZ)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "index"
    .parameter "value"

    .prologue
    const/16 v5, 0x65

    .line 1458
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1459
    if-eqz p2, :cond_0

    .line 1460
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1461
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x4

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1462
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1
    .local v0, index:I
    const/16 v2, 0x74

    aput-char v2, v1, p1

    .line 1463
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0           #index:I
    .restart local p1
    const/16 v2, 0x72

    aput-char v2, v1, v0

    .line 1464
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1
    .restart local v0       #index:I
    const/16 v2, 0x75

    aput-char v2, v1, p1

    .line 1465
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char v5, v1, v0

    .line 1466
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    move p1, v0

    .line 1477
    .end local v0           #index:I
    .restart local p1
    :goto_0
    return-object p0

    .line 1468
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1469
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v3, p1, 0x5

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1470
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1
    .restart local v0       #index:I
    const/16 v2, 0x66

    aput-char v2, v1, p1

    .line 1471
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0           #index:I
    .restart local p1
    const/16 v2, 0x61

    aput-char v2, v1, v0

    .line 1472
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 v0, p1, 0x1

    .end local p1
    .restart local v0       #index:I
    const/16 v2, 0x6c

    aput-char v2, v1, p1

    .line 1473
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int/lit8 p1, v0, 0x1

    .end local v0           #index:I
    .restart local p1
    const/16 v2, 0x73

    aput-char v2, v1, v0

    .line 1474
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char v5, v1, p1

    .line 1475
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v1, v1, 0x5

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public insert(I[C)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .parameter "index"
    .parameter "chars"

    .prologue
    .line 1404
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1405
    if-nez p2, :cond_1

    .line 1406
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 1415
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 1408
    .restart local p0
    :cond_1
    array-length v0, p2

    .line 1409
    .local v0, len:I
    if-lez v0, :cond_0

    .line 1410
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1411
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v3, p1, v0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1412
    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p2, v1, v2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1413
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public insert(I[CII)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4
    .parameter "index"
    .parameter "chars"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 1430
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->validateIndex(I)V

    .line 1431
    if-nez p2, :cond_1

    .line 1432
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->insert(ILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object p0

    .line 1446
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 1434
    .restart local p0
    :cond_1
    if-ltz p3, :cond_2

    array-length v0, p2

    if-le p3, v0, :cond_3

    .line 1435
    :cond_2
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid offset: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1437
    :cond_3
    if-ltz p4, :cond_4

    add-int v0, p3, p4

    array-length v1, p2

    if-le v0, v1, :cond_5

    .line 1438
    :cond_4
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid length: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1440
    :cond_5
    if-lez p4, :cond_0

    .line 1441
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1442
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v2, p1, p4

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v3, p1

    invoke-static {v0, p1, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1443
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-static {p2, p3, v0, p1, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1444
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/2addr v0, p4

    iput v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 276
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public lastIndexOf(C)I
    .locals 1
    .parameter "ch"

    .prologue
    .line 2295
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(CI)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(CI)I
    .locals 3
    .parameter "ch"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2306
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v2, :cond_0

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v2, -0x1

    .line 2307
    :cond_0
    if-gez p2, :cond_2

    move v0, v1

    .line 2315
    :cond_1
    :goto_0
    return v0

    .line 2310
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_3

    move v0, v1

    .line 2315
    goto :goto_0

    .line 2311
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v2, v2, v0

    if-eq v2, p1, :cond_1

    .line 2310
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public lastIndexOf(Ljava/lang/String;)I
    .locals 1
    .parameter "str"

    .prologue
    .line 2327
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Ljava/lang/String;I)I
    .locals 7
    .parameter "str"
    .parameter "startIndex"

    .prologue
    const/4 v3, -0x1

    .line 2341
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v4, -0x1

    .line 2342
    :cond_0
    if-eqz p1, :cond_1

    if-gez p2, :cond_3

    :cond_1
    move v0, v3

    .line 2364
    :cond_2
    :goto_0
    return v0

    .line 2345
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 2346
    .local v2, strLen:I
    if-lez v2, :cond_8

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v2, v4, :cond_8

    .line 2347
    const/4 v4, 0x1

    if-ne v2, v4, :cond_4

    .line 2348
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(CI)I

    move-result v0

    goto :goto_0

    .line 2352
    :cond_4
    sub-int v4, p2, v2

    add-int/lit8 v0, v4, 0x1

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_6

    .end local v0           #i:I
    :cond_5
    move v0, v3

    .line 2364
    goto :goto_0

    .line 2353
    .restart local v0       #i:I
    :cond_6
    const/4 v1, 0x0

    .local v1, j:I
    :goto_2
    if-ge v1, v2, :cond_2

    .line 2354
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    iget-object v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    add-int v6, v0, v1

    aget-char v5, v5, v6

    if-eq v4, v5, :cond_7

    .line 2352
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 2353
    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 2361
    .end local v0           #i:I
    .end local v1           #j:I
    :cond_8
    if-nez v2, :cond_5

    move v0, p2

    .line 2362
    goto :goto_0
.end method

.method public lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;)I
    .locals 1
    .parameter "matcher"

    .prologue
    .line 2378
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I

    move-result v0

    return v0
.end method

.method public lastIndexOf(Lorg/apache/commons/lang3/text/StrMatcher;I)I
    .locals 5
    .parameter "matcher"
    .parameter "startIndex"

    .prologue
    const/4 v3, -0x1

    .line 2394
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p2, v4, :cond_0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 p2, v4, -0x1

    .line 2395
    :cond_0
    if-eqz p1, :cond_1

    if-gez p2, :cond_3

    :cond_1
    move v2, v3

    .line 2405
    :cond_2
    :goto_0
    return v2

    .line 2398
    :cond_3
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 2399
    .local v0, buf:[C
    add-int/lit8 v1, p2, 0x1

    .line 2400
    .local v1, endIndex:I
    move v2, p2

    .local v2, i:I
    :goto_1
    if-gez v2, :cond_4

    move v2, v3

    .line 2405
    goto :goto_0

    .line 2401
    :cond_4
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v2, v4, v1}, Lorg/apache/commons/lang3/text/StrMatcher;->isMatch([CIII)I

    move-result v4

    if-gtz v4, :cond_2

    .line 2400
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method public leftString(I)Ljava/lang/String;
    .locals 4
    .parameter "length"

    .prologue
    const/4 v3, 0x0

    .line 2060
    if-gtz p1, :cond_0

    .line 2061
    const-string v0, ""

    .line 2065
    :goto_0
    return-object v0

    .line 2062
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 2063
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v3, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2065
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v1, v3, p1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 186
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    return v0
.end method

.method public midString(II)Ljava/lang/String;
    .locals 3
    .parameter "index"
    .parameter "length"

    .prologue
    .line 2108
    if-gez p1, :cond_0

    .line 2109
    const/4 p1, 0x0

    .line 2111
    :cond_0
    if-lez p2, :cond_1

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_2

    .line 2112
    :cond_1
    const-string v0, ""

    .line 2117
    :goto_0
    return-object v0

    .line 2114
    :cond_2
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int v1, p1, p2

    if-gt v0, v1, :cond_3

    .line 2115
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2117
    :cond_3
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public minimizeCapacity()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 246
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    array-length v1, v1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v2

    if-le v1, v2, :cond_0

    .line 247
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 248
    .local v0, old:[C
    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v1

    new-array v1, v1, [C

    iput-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 249
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    .end local v0           #old:[C
    :cond_0
    return-object p0
.end method

.method public replace(IILjava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "startIndex"
    .parameter "endIndex"
    .parameter "replaceStr"

    .prologue
    .line 1717
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 1718
    if-nez p3, :cond_0

    const/4 v5, 0x0

    .line 1719
    .local v5, insertLen:I
    :goto_0
    sub-int v3, p2, p1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1720
    return-object p0

    .line 1718
    .end local v5           #insertLen:I
    :cond_0
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_0
.end method

.method public replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "matcher"
    .parameter "replaceStr"
    .parameter "startIndex"
    .parameter "endIndex"
    .parameter "replaceCount"

    .prologue
    .line 1854
    invoke-virtual {p0, p3, p4}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p4

    .line 1855
    invoke-direct/range {p0 .. p5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public replaceAll(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "search"
    .parameter "replace"

    .prologue
    .line 1733
    if-eq p1, p2, :cond_0

    .line 1734
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v1, :cond_1

    .line 1740
    .end local v0           #i:I
    :cond_0
    return-object p0

    .line 1735
    .restart local v0       #i:I
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_2

    .line 1736
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    .line 1734
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public replaceAll(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "searchStr"
    .parameter "replaceStr"

    .prologue
    const/4 v0, 0x0

    .line 1772
    if-nez p1, :cond_1

    move v3, v0

    .line 1773
    .local v3, searchLen:I
    :goto_0
    if-lez v3, :cond_0

    .line 1774
    if-nez p2, :cond_2

    move v5, v0

    .line 1775
    .local v5, replaceLen:I
    :goto_1
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1776
    .local v1, index:I
    :goto_2
    if-gez v1, :cond_3

    .line 1781
    .end local v1           #index:I
    .end local v5           #replaceLen:I
    :cond_0
    return-object p0

    .line 1772
    .end local v3           #searchLen:I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    .line 1774
    .restart local v3       #searchLen:I
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_1

    .line 1777
    .restart local v1       #index:I
    .restart local v5       #replaceLen:I
    :cond_3
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1778
    add-int v0, v1, v5

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2
.end method

.method public replaceAll(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "matcher"
    .parameter "replaceStr"

    .prologue
    .line 1816
    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, -0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public replaceFirst(CC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 2
    .parameter "search"
    .parameter "replace"

    .prologue
    .line 1752
    if-eq p1, p2, :cond_0

    .line 1753
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt v0, v1, :cond_1

    .line 1760
    .end local v0           #i:I
    :cond_0
    :goto_1
    return-object p0

    .line 1754
    .restart local v0       #i:I
    :cond_1
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_2

    .line 1755
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v1, v0

    goto :goto_1

    .line 1753
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public replaceFirst(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "searchStr"
    .parameter "replaceStr"

    .prologue
    const/4 v5, 0x0

    .line 1792
    if-nez p1, :cond_1

    move v3, v5

    .line 1793
    .local v3, searchLen:I
    :goto_0
    if-lez v3, :cond_0

    .line 1794
    invoke-virtual {p0, p1, v5}, Lorg/apache/commons/lang3/text/StrBuilder;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 1795
    .local v1, index:I
    if-ltz v1, :cond_0

    .line 1796
    if-nez p2, :cond_2

    .line 1797
    .local v5, replaceLen:I
    :goto_1
    add-int v2, v1, v3

    move-object v0, p0

    move-object v4, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replaceImpl(IIILjava/lang/String;I)V

    .line 1800
    .end local v1           #index:I
    .end local v5           #replaceLen:I
    :cond_0
    return-object p0

    .line 1792
    .end local v3           #searchLen:I
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_0

    .line 1796
    .restart local v1       #index:I
    .restart local v3       #searchLen:I
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    goto :goto_1
.end method

.method public replaceFirst(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6
    .parameter "matcher"
    .parameter "replaceStr"

    .prologue
    .line 1831
    const/4 v3, 0x0

    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Lorg/apache/commons/lang3/text/StrBuilder;->replace(Lorg/apache/commons/lang3/text/StrMatcher;Ljava/lang/String;III)Lorg/apache/commons/lang3/text/StrBuilder;

    move-result-object v0

    return-object v0
.end method

.method public reverse()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 6

    .prologue
    .line 1902
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v5, :cond_1

    .line 1913
    :cond_0
    return-object p0

    .line 1906
    :cond_1
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    div-int/lit8 v1, v5, 0x2

    .line 1907
    .local v1, half:I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 1908
    .local v0, buf:[C
    const/4 v2, 0x0

    .local v2, leftIdx:I
    iget v5, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    add-int/lit8 v3, v5, -0x1

    .local v3, rightIdx:I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 1909
    aget-char v4, v0, v2

    .line 1910
    .local v4, swap:C
    aget-char v5, v0, v3

    aput-char v5, v0, v2

    .line 1911
    aput-char v4, v0, v3

    .line 1908
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_0
.end method

.method public rightString(I)Ljava/lang/String;
    .locals 4
    .parameter "length"

    .prologue
    .line 2082
    if-gtz p1, :cond_0

    .line 2083
    const-string v0, ""

    .line 2087
    :goto_0
    return-object v0

    .line 2084
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-lt p1, v0, :cond_1

    .line 2085
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 2087
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    sub-int/2addr v2, p1

    invoke-direct {v0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0
.end method

.method public setCharAt(IC)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "index"
    .parameter "ch"

    .prologue
    .line 323
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/text/StrBuilder;->length()I

    move-result v0

    if-lt p1, v0, :cond_1

    .line 324
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 326
    :cond_1
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aput-char p2, v0, p1

    .line 327
    return-object p0
.end method

.method public setLength(I)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5
    .parameter "length"

    .prologue
    .line 198
    if-gez p1, :cond_0

    .line 199
    new-instance v3, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v3, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v3

    .line 201
    :cond_0
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge p1, v3, :cond_2

    .line 202
    iput p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 212
    :cond_1
    return-object p0

    .line 203
    :cond_2
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p1, v3, :cond_1

    .line 204
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/text/StrBuilder;->ensureCapacity(I)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 205
    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 206
    .local v2, oldEnd:I
    move v1, p1

    .line 207
    .local v1, newEnd:I
    iput p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 208
    move v0, v2

    .local v0, i:I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 209
    iget-object v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v4, 0x0

    aput-char v4, v3, v0

    .line 208
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public setNewLineText(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 0
    .parameter "newLine"

    .prologue
    .line 151
    iput-object p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->newLine:Ljava/lang/String;

    .line 152
    return-object p0
.end method

.method public setNullText(Ljava/lang/String;)Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 1
    .parameter "nullText"

    .prologue
    .line 172
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    .line 173
    const/4 p1, 0x0

    .line 175
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->nullText:Ljava/lang/String;

    .line 176
    return-object p0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 264
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    return v0
.end method

.method public startsWith(Ljava/lang/String;)Z
    .locals 6
    .parameter "str"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1955
    if-nez p1, :cond_1

    .line 1970
    :cond_0
    :goto_0
    return v2

    .line 1958
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 1959
    .local v1, len:I
    if-nez v1, :cond_2

    move v2, v3

    .line 1960
    goto :goto_0

    .line 1962
    :cond_2
    iget v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-gt v1, v4, :cond_0

    .line 1965
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_3

    move v2, v3

    .line 1970
    goto :goto_0

    .line 1966
    :cond_3
    iget-object v4, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    aget-char v4, v4, v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v4, v5, :cond_0

    .line 1965
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public subSequence(II)Ljava/lang/CharSequence;
    .locals 2
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 2006
    if-gez p1, :cond_0

    .line 2007
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2009
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p2, v0, :cond_1

    .line 2010
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p2}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2012
    :cond_1
    if-le p1, p2, :cond_2

    .line 2013
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    sub-int v1, p2, p1

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2015
    :cond_2
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(I)Ljava/lang/String;
    .locals 1
    .parameter "start"

    .prologue
    .line 2026
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/text/StrBuilder;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public substring(II)Ljava/lang/String;
    .locals 3
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 2043
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 2044
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    sub-int v2, p2, p1

    invoke-direct {v0, v1, p1, v2}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toCharArray()[C
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 354
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v1, :cond_0

    .line 355
    sget-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 359
    :goto_0
    return-object v0

    .line 357
    :cond_0
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    new-array v0, v1, [C

    .line 358
    .local v0, chars:[C
    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    iget v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public toCharArray(II)[C
    .locals 4
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 373
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/text/StrBuilder;->validateRange(II)I

    move-result p2

    .line 374
    sub-int v1, p2, p1

    .line 375
    .local v1, len:I
    if-nez v1, :cond_0

    .line 376
    sget-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 380
    :goto_0
    return-object v0

    .line 378
    :cond_0
    new-array v0, v1, [C

    .line 379
    .local v0, chars:[C
    iget-object v2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v3, 0x0

    invoke-static {v2, p1, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 2617
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public toStringBuffer()Ljava/lang/StringBuffer;
    .locals 4

    .prologue
    .line 2627
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iget-object v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {v0, v1, v2, v3}, Ljava/lang/StringBuffer;->append([CII)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public trim()Lorg/apache/commons/lang3/text/StrBuilder;
    .locals 5

    .prologue
    const/16 v4, 0x20

    .line 1924
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-nez v3, :cond_1

    .line 1942
    :cond_0
    :goto_0
    return-object p0

    .line 1927
    :cond_1
    iget v1, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 1928
    .local v1, len:I
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->buffer:[C

    .line 1929
    .local v0, buf:[C
    const/4 v2, 0x0

    .line 1930
    .local v2, pos:I
    :goto_1
    if-ge v2, v1, :cond_2

    aget-char v3, v0, v2

    if-le v3, v4, :cond_5

    .line 1933
    :cond_2
    :goto_2
    if-ge v2, v1, :cond_3

    add-int/lit8 v3, v1, -0x1

    aget-char v3, v0, v3

    if-le v3, v4, :cond_6

    .line 1936
    :cond_3
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-ge v1, v3, :cond_4

    .line 1937
    iget v3, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    invoke-virtual {p0, v1, v3}, Lorg/apache/commons/lang3/text/StrBuilder;->delete(II)Lorg/apache/commons/lang3/text/StrBuilder;

    .line 1939
    :cond_4
    if-lez v2, :cond_0

    .line 1940
    const/4 v3, 0x0

    invoke-virtual {p0, v3, v2}, Lorg/apache/commons/lang3/text/StrBuilder;->delete(II)Lorg/apache/commons/lang3/text/StrBuilder;

    goto :goto_0

    .line 1931
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 1934
    :cond_6
    add-int/lit8 v1, v1, -0x1

    goto :goto_2
.end method

.method protected validateIndex(I)V
    .locals 1
    .parameter "index"

    .prologue
    .line 2660
    if-ltz p1, :cond_0

    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p1, v0, :cond_1

    .line 2661
    :cond_0
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2663
    :cond_1
    return-void
.end method

.method protected validateRange(II)I
    .locals 2
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 2641
    if-gez p1, :cond_0

    .line 2642
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(I)V

    throw v0

    .line 2644
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    if-le p2, v0, :cond_1

    .line 2645
    iget p2, p0, Lorg/apache/commons/lang3/text/StrBuilder;->size:I

    .line 2647
    :cond_1
    if-le p1, p2, :cond_2

    .line 2648
    new-instance v0, Ljava/lang/StringIndexOutOfBoundsException;

    const-string v1, "end < start"

    invoke-direct {v0, v1}, Ljava/lang/StringIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2650
    :cond_2
    return p2
.end method
