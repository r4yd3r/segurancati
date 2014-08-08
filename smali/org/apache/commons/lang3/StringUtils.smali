.class public Lorg/apache/commons/lang3/StringUtils;
.super Ljava/lang/Object;
.source "StringUtils.java"


# static fields
.field public static final EMPTY:Ljava/lang/String; = ""

.field public static final INDEX_NOT_FOUND:I = -0x1

.field private static final PAD_LIMIT:I = 0x2000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 168
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 169
    return-void
.end method

.method public static abbreviate(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "maxWidth"

    .prologue
    .line 5621
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/StringUtils;->abbreviate(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static abbreviate(Ljava/lang/String;II)Ljava/lang/String;
    .locals 4
    .parameter "str"
    .parameter "offset"
    .parameter "maxWidth"

    .prologue
    const/4 v3, 0x4

    .line 5660
    if-nez p0, :cond_1

    .line 5661
    const/4 p0, 0x0

    .line 5685
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 5663
    .restart local p0
    :cond_1
    if-ge p2, v3, :cond_2

    .line 5664
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Minimum abbreviation width is 4"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 5666
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, p2, :cond_0

    .line 5669
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-le p1, v1, :cond_3

    .line 5670
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    .line 5672
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, p1

    add-int/lit8 v2, p2, -0x3

    if-ge v1, v2, :cond_4

    .line 5673
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v2, p2, -0x3

    sub-int p1, v1, v2

    .line 5675
    :cond_4
    const-string v0, "..."

    .line 5676
    .local v0, abrevMarker:Ljava/lang/String;
    if-gt p1, v3, :cond_5

    .line 5677
    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v2, 0x0

    add-int/lit8 v3, p2, -0x3

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 5679
    :cond_5
    const/4 v1, 0x7

    if-ge p2, v1, :cond_6

    .line 5680
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Minimum abbreviation width with offset is 7"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 5682
    :cond_6
    add-int/lit8 v1, p2, -0x3

    add-int/2addr v1, p1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_7

    .line 5683
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "..."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v3, p2, -0x3

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/StringUtils;->abbreviate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 5685
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "..."

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v3, p2, -0x3

    sub-int/2addr v2, v3

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method public static abbreviateMiddle(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 6
    .parameter "str"
    .parameter "middle"
    .parameter "length"

    .prologue
    .line 5718
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 5735
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 5722
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge p2, v4, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    if-lt p2, v4, :cond_0

    .line 5726
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int v3, p2, v4

    .line 5727
    .local v3, targetSting:I
    div-int/lit8 v4, v3, 0x2

    rem-int/lit8 v5, v3, 0x2

    add-int v2, v4, v5

    .line 5728
    .local v2, startOffset:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    div-int/lit8 v5, v3, 0x2

    sub-int v1, v4, v5

    .line 5730
    .local v1, endOffset:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5731
    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5732
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5733
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 5735
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static capitalize(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .parameter "cs"

    .prologue
    .line 4992
    if-nez p0, :cond_0

    .line 4993
    const/4 v1, 0x0

    .line 4999
    :goto_0
    return-object v1

    .line 4996
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .local v0, strLen:I
    if-nez v0, :cond_1

    .line 4997
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 4999
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5000
    const/4 v2, 0x0

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 5001
    const/4 v2, 0x1

    invoke-static {p0, v2}, Lorg/apache/commons/lang3/CharSequenceUtils;->subSequence(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 5002
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static center(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "size"

    .prologue
    .line 4786
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->center(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static center(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "size"
    .parameter "padChar"

    .prologue
    .line 4814
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    .line 4824
    :cond_0
    :goto_0
    return-object p0

    .line 4817
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 4818
    .local v1, strLen:I
    sub-int v0, p1, v1

    .line 4819
    .local v0, pads:I
    if-lez v0, :cond_0

    .line 4822
    div-int/lit8 v2, v0, 0x2

    add-int/2addr v2, v1

    invoke-static {p0, v2, p2}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    .line 4823
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    .line 4824
    goto :goto_0
.end method

.method public static center(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "size"
    .parameter "padStr"

    .prologue
    .line 4854
    if-eqz p0, :cond_0

    if-gtz p1, :cond_1

    .line 4867
    :cond_0
    :goto_0
    return-object p0

    .line 4857
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 4858
    const-string p2, " "

    .line 4860
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 4861
    .local v1, strLen:I
    sub-int v0, p1, v1

    .line 4862
    .local v0, pads:I
    if-lez v0, :cond_0

    .line 4865
    div-int/lit8 v2, v0, 0x2

    add-int/2addr v2, v1

    invoke-static {p0, v2, p2}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 4866
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 4867
    goto :goto_0
.end method

.method public static chomp(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "str"

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x0

    const/16 v5, 0xd

    .line 4283
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 4305
    .end local p0
    .local v1, last:C
    .local v2, lastIdx:I
    :cond_0
    :goto_0
    return-object p0

    .line 4287
    .end local v1           #last:C
    .end local v2           #lastIdx:I
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 4288
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4289
    .local v0, ch:C
    if-eq v0, v5, :cond_2

    if-ne v0, v7, :cond_0

    .line 4290
    :cond_2
    const-string p0, ""

    goto :goto_0

    .line 4295
    .end local v0           #ch:C
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 4296
    .restart local v2       #lastIdx:I
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4298
    .restart local v1       #last:C
    if-ne v1, v7, :cond_5

    .line 4299
    add-int/lit8 v3, v2, -0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v5, :cond_4

    .line 4300
    add-int/lit8 v2, v2, -0x1

    .line 4305
    :cond_4
    :goto_1
    invoke-virtual {p0, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4302
    :cond_5
    if-eq v1, v5, :cond_4

    .line 4303
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static chomp(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 4335
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    .line 4341
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4338
    .restart local p0
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4339
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static chop(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "str"

    .prologue
    const/4 v6, 0x0

    .line 4370
    if-nez p0, :cond_1

    .line 4371
    const/4 v2, 0x0

    .line 4385
    :cond_0
    :goto_0
    return-object v2

    .line 4373
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 4374
    .local v3, strLen:I
    const/4 v4, 0x2

    if-ge v3, v4, :cond_2

    .line 4375
    const-string v2, ""

    goto :goto_0

    .line 4377
    :cond_2
    add-int/lit8 v1, v3, -0x1

    .line 4378
    .local v1, lastIdx:I
    invoke-virtual {p0, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 4379
    .local v2, ret:Ljava/lang/String;
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 4380
    .local v0, last:C
    const/16 v4, 0xa

    if-ne v0, v4, :cond_0

    .line 4381
    add-int/lit8 v4, v1, -0x1

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_0

    .line 4382
    add-int/lit8 v4, v1, -0x1

    invoke-virtual {v2, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static varargs concat([Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "elements"

    .prologue
    .line 3127
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs concatWith(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "separator"
    .parameter "elements"

    .prologue
    .line 3149
    invoke-static {p1, p0}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static contains(Ljava/lang/String;I)Z
    .locals 2
    .parameter "str"
    .parameter "searchChar"

    .prologue
    const/4 v0, 0x0

    .line 1279
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1282
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static contains(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .parameter "str"
    .parameter "searchStr"

    .prologue
    const/4 v0, 0x0

    .line 1307
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1310
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static containsAny(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    .line 1536
    if-nez p1, :cond_0

    .line 1537
    const/4 v0, 0x0

    .line 1539
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->containsAny(Ljava/lang/String;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsAny(Ljava/lang/String;[C)Z
    .locals 11
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1479
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([C)Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_0
    move v7, v8

    .line 1505
    :cond_1
    :goto_0
    return v7

    .line 1482
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1483
    .local v2, csLength:I
    array-length v6, p1

    .line 1484
    .local v6, searchLength:I
    add-int/lit8 v1, v2, -0x1

    .line 1485
    .local v1, csLast:I
    add-int/lit8 v5, v6, -0x1

    .line 1486
    .local v5, searchLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-lt v3, v2, :cond_3

    move v7, v8

    .line 1505
    goto :goto_0

    .line 1487
    :cond_3
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1488
    .local v0, ch:C
    const/4 v4, 0x0

    .local v4, j:I
    :goto_2
    if-lt v4, v6, :cond_4

    .line 1486
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1489
    :cond_4
    aget-char v9, p1, v4

    if-ne v9, v0, :cond_5

    .line 1490
    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1491
    if-eq v4, v5, :cond_1

    .line 1495
    if-ge v3, v1, :cond_5

    add-int/lit8 v9, v4, 0x1

    aget-char v9, p1, v9

    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    if-eq v9, v10, :cond_1

    .line 1488
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method public static containsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .parameter "str"
    .parameter "searchStr"

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 1337
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1347
    :cond_0
    :goto_0
    return v4

    .line 1340
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 1341
    .local v5, len:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v6, v0, v5

    .line 1342
    .local v6, max:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-gt v2, v6, :cond_0

    move-object v0, p0

    move-object v3, p1

    .line 1343
    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_2

    move v4, v1

    .line 1344
    goto :goto_0

    .line 1342
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static containsNone(Ljava/lang/CharSequence;Ljava/lang/String;)Z
    .locals 1
    .parameter "cs"
    .parameter "invalidChars"

    .prologue
    .line 1785
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1786
    :cond_0
    const/4 v0, 0x1

    .line 1788
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->containsNone(Ljava/lang/CharSequence;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsNone(Ljava/lang/CharSequence;[C)Z
    .locals 11
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 1732
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v7, v8

    .line 1758
    :cond_1
    :goto_0
    return v7

    .line 1735
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1736
    .local v2, csLen:I
    add-int/lit8 v1, v2, -0x1

    .line 1737
    .local v1, csLast:I
    array-length v6, p1

    .line 1738
    .local v6, searchLen:I
    add-int/lit8 v5, v6, -0x1

    .line 1739
    .local v5, searchLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-lt v3, v2, :cond_3

    move v7, v8

    .line 1758
    goto :goto_0

    .line 1740
    :cond_3
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 1741
    .local v0, ch:C
    const/4 v4, 0x0

    .local v4, j:I
    :goto_2
    if-lt v4, v6, :cond_4

    .line 1739
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1742
    :cond_4
    aget-char v9, p1, v4

    if-ne v9, v0, :cond_5

    .line 1743
    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 1744
    if-eq v4, v5, :cond_1

    .line 1748
    if-ge v3, v1, :cond_5

    add-int/lit8 v9, v4, 0x1

    aget-char v9, p1, v9

    add-int/lit8 v10, v3, 0x1

    invoke-interface {p0, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-eq v9, v10, :cond_1

    .line 1741
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method public static containsOnly(Ljava/lang/CharSequence;Ljava/lang/String;)Z
    .locals 1
    .parameter "cs"
    .parameter "validChars"

    .prologue
    .line 1700
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1701
    :cond_0
    const/4 v0, 0x0

    .line 1703
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->containsOnly(Ljava/lang/CharSequence;[C)Z

    move-result v0

    goto :goto_0
.end method

.method public static containsOnly(Ljava/lang/CharSequence;[C)Z
    .locals 4
    .parameter "cs"
    .parameter "valid"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1664
    if-eqz p1, :cond_0

    if-nez p0, :cond_2

    :cond_0
    move v0, v1

    .line 1673
    :cond_1
    :goto_0
    return v0

    .line 1667
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-eqz v2, :cond_1

    .line 1670
    array-length v2, p1

    if-nez v2, :cond_3

    move v0, v1

    .line 1671
    goto :goto_0

    .line 1673
    :cond_3
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->indexOfAnyBut(Ljava/lang/CharSequence;[C)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    move v0, v1

    goto :goto_0
.end method

.method public static containsWhitespace(Ljava/lang/String;)Z
    .locals 4
    .parameter "str"

    .prologue
    const/4 v2, 0x0

    .line 1360
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1369
    :cond_0
    :goto_0
    return v2

    .line 1363
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1364
    .local v1, strLen:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 1365
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1366
    const/4 v2, 0x1

    goto :goto_0

    .line 1364
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static countMatches(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .parameter "str"
    .parameter "sub"

    .prologue
    .line 5111
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 5112
    :cond_0
    const/4 v0, 0x0

    .line 5120
    :cond_1
    return v0

    .line 5114
    :cond_2
    const/4 v0, 0x0

    .line 5115
    .local v0, count:I
    const/4 v1, 0x0

    .line 5116
    .local v1, idx:I
    :goto_0
    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 5117
    add-int/lit8 v0, v0, 0x1

    .line 5118
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_0
.end method

.method public static defaultIfEmpty(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/CharSequence;",
            ">(TT;TT;)TT;"
        }
    .end annotation

    .prologue
    .line 5530
    .local p0, str:Ljava/lang/CharSequence;,"TT;"
    .local p1, defaultStr:Ljava/lang/CharSequence;,"TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .end local p1           #defaultStr:Ljava/lang/CharSequence;,"TT;"
    :goto_0
    return-object p1

    .restart local p1       #defaultStr:Ljava/lang/CharSequence;,"TT;"
    :cond_0
    move-object p1, p0

    goto :goto_0
.end method

.method public static defaultString(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "str"

    .prologue
    .line 5488
    if-nez p0, :cond_0

    const-string p0, ""

    .end local p0
    :cond_0
    return-object p0
.end method

.method public static defaultString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "str"
    .parameter "defaultStr"

    .prologue
    .line 5509
    if-nez p0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    move-object p1, p0

    goto :goto_0
.end method

.method public static deleteWhitespace(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "str"

    .prologue
    .line 3493
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3507
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3496
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 3497
    .local v4, sz:I
    new-array v0, v4, [C

    .line 3498
    .local v0, chs:[C
    const/4 v1, 0x0

    .line 3499
    .local v1, count:I
    const/4 v3, 0x0

    .local v3, i:I
    move v2, v1

    .end local v1           #count:I
    .local v2, count:I
    :goto_1
    if-lt v3, v4, :cond_2

    .line 3504
    if-eq v2, v4, :cond_0

    .line 3507
    new-instance p0, Ljava/lang/String;

    .end local p0
    const/4 v5, 0x0

    invoke-direct {p0, v0, v5, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 3500
    .restart local p0
    :cond_2
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    if-nez v5, :cond_3

    .line 3501
    add-int/lit8 v1, v2, 0x1

    .end local v2           #count:I
    .restart local v1       #count:I
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    aput-char v5, v0, v2

    .line 3499
    :goto_2
    add-int/lit8 v3, v3, 0x1

    move v2, v1

    .end local v1           #count:I
    .restart local v2       #count:I
    goto :goto_1

    :cond_3
    move v1, v2

    .end local v2           #count:I
    .restart local v1       #count:I
    goto :goto_2
.end method

.method public static difference(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str1"
    .parameter "str2"

    .prologue
    .line 5766
    if-nez p0, :cond_0

    .line 5776
    .end local p1
    :goto_0
    return-object p1

    .line 5769
    .restart local p1
    :cond_0
    if-nez p1, :cond_1

    move-object p1, p0

    .line 5770
    goto :goto_0

    .line 5772
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->indexOfDifference(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v0

    .line 5773
    .local v0, at:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 5774
    const-string p1, ""

    goto :goto_0

    .line 5776
    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public static endsWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "str"
    .parameter "suffix"

    .prologue
    .line 6210
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .parameter "str"
    .parameter "suffix"
    .parameter "ignoreCase"

    .prologue
    const/4 v4, 0x0

    .line 6251
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 6252
    :cond_0
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    const/4 v4, 0x1

    .line 6258
    :cond_1
    :goto_0
    return v4

    .line 6254
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 6257
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v2, v0, v1

    .line 6258
    .local v2, strOffset:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move v1, p2

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v4

    goto :goto_0
.end method

.method public static endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "str"
    .parameter "suffix"

    .prologue
    .line 6236
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .locals 1
    .parameter "cs1"
    .parameter "cs2"

    .prologue
    .line 703
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public static equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "str1"
    .parameter "str2"

    .prologue
    .line 728
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public static varargs getCommonPrefix([Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "strs"

    .prologue
    const/4 v2, 0x0

    .line 5946
    if-eqz p0, :cond_0

    array-length v1, p0

    if-nez v1, :cond_1

    .line 5947
    :cond_0
    const-string v1, ""

    .line 5961
    :goto_0
    return-object v1

    .line 5949
    :cond_1
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->indexOfDifference([Ljava/lang/CharSequence;)I

    move-result v0

    .line 5950
    .local v0, smallestIndexOfDiff:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 5952
    aget-object v1, p0, v2

    if-nez v1, :cond_2

    .line 5953
    const-string v1, ""

    goto :goto_0

    .line 5955
    :cond_2
    aget-object v1, p0, v2

    goto :goto_0

    .line 5956
    :cond_3
    if-nez v0, :cond_4

    .line 5958
    const-string v1, ""

    goto :goto_0

    .line 5961
    :cond_4
    aget-object v1, p0, v2

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static getLevenshteinDistance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I
    .locals 13
    .parameter "s"
    .parameter "t"

    .prologue
    const/4 v10, 0x0

    .line 6003
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 6004
    :cond_0
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "Strings must not be null"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 6024
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v6

    .line 6025
    .local v6, n:I
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 6027
    .local v5, m:I
    if-nez v6, :cond_2

    move v10, v5

    .line 6076
    :goto_0
    return v10

    .line 6029
    :cond_2
    if-nez v5, :cond_3

    move v10, v6

    .line 6030
    goto :goto_0

    .line 6033
    :cond_3
    if-le v6, v5, :cond_4

    .line 6035
    move-object v9, p0

    .line 6036
    .local v9, tmp:Ljava/lang/CharSequence;
    move-object p0, p1

    .line 6037
    move-object p1, v9

    .line 6038
    move v6, v5

    .line 6039
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    .line 6042
    .end local v9           #tmp:Ljava/lang/CharSequence;
    :cond_4
    add-int/lit8 v11, v6, 0x1

    new-array v7, v11, [I

    .line 6043
    .local v7, p:[I
    add-int/lit8 v11, v6, 0x1

    new-array v2, v11, [I

    .line 6054
    .local v2, d:[I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-le v3, v6, :cond_5

    .line 6058
    const/4 v4, 0x1

    .local v4, j:I
    :goto_2
    if-le v4, v5, :cond_6

    .line 6076
    aget v10, v7, v6

    goto :goto_0

    .line 6055
    .end local v4           #j:I
    :cond_5
    aput v3, v7, v3

    .line 6054
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 6059
    .restart local v4       #j:I
    :cond_6
    add-int/lit8 v11, v4, -0x1

    invoke-interface {p1, v11}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v8

    .line 6060
    .local v8, t_j:C
    aput v4, v2, v10

    .line 6062
    const/4 v3, 0x1

    :goto_3
    if-le v3, v6, :cond_7

    .line 6069
    move-object v0, v7

    .line 6070
    .local v0, _d:[I
    move-object v7, v2

    .line 6071
    move-object v2, v0

    .line 6058
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 6063
    .end local v0           #_d:[I
    :cond_7
    add-int/lit8 v11, v3, -0x1

    invoke-interface {p0, v11}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v11

    if-ne v11, v8, :cond_8

    move v1, v10

    .line 6065
    .local v1, cost:I
    :goto_4
    add-int/lit8 v11, v3, -0x1

    aget v11, v2, v11

    add-int/lit8 v11, v11, 0x1

    aget v12, v7, v3

    add-int/lit8 v12, v12, 0x1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    add-int/lit8 v12, v3, -0x1

    aget v12, v7, v12

    add-int/2addr v12, v1

    invoke-static {v11, v12}, Ljava/lang/Math;->min(II)I

    move-result v11

    aput v11, v2, v3

    .line 6062
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 6063
    .end local v1           #cost:I
    :cond_8
    const/4 v1, 0x1

    goto :goto_4
.end method

.method public static indexOf(Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchChar"

    .prologue
    .line 753
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 754
    const/4 v0, -0x1

    .line 756
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;II)I
    .locals 1
    .parameter "str"
    .parameter "searchChar"
    .parameter "startPos"

    .prologue
    .line 785
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 786
    const/4 v0, -0x1

    .line 788
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"

    .prologue
    .line 815
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 816
    :cond_0
    const/4 v0, -0x1

    .line 818
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"
    .parameter "startPos"

    .prologue
    .line 854
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 855
    :cond_0
    const/4 v0, -0x1

    .line 857
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOfAny(Ljava/lang/CharSequence;Ljava/lang/String;)I
    .locals 1
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    .line 1447
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1448
    :cond_0
    const/4 v0, -0x1

    .line 1450
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->indexOfAny(Ljava/lang/CharSequence;[C)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOfAny(Ljava/lang/CharSequence;[C)I
    .locals 10
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    const/4 v7, -0x1

    .line 1398
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([C)Z

    move-result v8

    if-eqz v8, :cond_2

    :cond_0
    move v3, v7

    .line 1420
    :cond_1
    :goto_0
    return v3

    .line 1401
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1402
    .local v2, csLen:I
    add-int/lit8 v1, v2, -0x1

    .line 1403
    .local v1, csLast:I
    array-length v6, p1

    .line 1404
    .local v6, searchLen:I
    add-int/lit8 v5, v6, -0x1

    .line 1405
    .local v5, searchLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-lt v3, v2, :cond_3

    move v3, v7

    .line 1420
    goto :goto_0

    .line 1406
    :cond_3
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 1407
    .local v0, ch:C
    const/4 v4, 0x0

    .local v4, j:I
    :goto_2
    if-lt v4, v6, :cond_4

    .line 1405
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1408
    :cond_4
    aget-char v8, p1, v4

    if-ne v8, v0, :cond_5

    .line 1409
    if-ge v3, v1, :cond_1

    if-ge v4, v5, :cond_1

    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1411
    add-int/lit8 v8, v4, 0x1

    aget-char v8, p1, v8

    add-int/lit8 v9, v3, 0x1

    invoke-interface {p0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    if-eq v8, v9, :cond_1

    .line 1407
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method public static indexOfAny(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 7
    .parameter "str"
    .parameter "searchStrs"

    .prologue
    const/4 v5, -0x1

    .line 1820
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v1, v5

    .line 1844
    :cond_1
    :goto_0
    return v1

    .line 1823
    :cond_2
    array-length v3, p1

    .line 1826
    .local v3, sz:I
    const v1, 0x7fffffff

    .line 1828
    .local v1, ret:I
    const/4 v4, 0x0

    .line 1829
    .local v4, tmp:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v3, :cond_3

    .line 1844
    const v6, 0x7fffffff

    if-ne v1, v6, :cond_1

    move v1, v5

    goto :goto_0

    .line 1830
    :cond_3
    aget-object v2, p1, v0

    .line 1831
    .local v2, search:Ljava/lang/String;
    if-nez v2, :cond_5

    .line 1829
    :cond_4
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1834
    :cond_5
    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 1835
    if-eq v4, v5, :cond_4

    .line 1839
    if-ge v4, v1, :cond_4

    .line 1840
    move v1, v4

    goto :goto_2
.end method

.method public static indexOfAnyBut(Ljava/lang/CharSequence;[C)I
    .locals 10
    .parameter "cs"
    .parameter "searchChars"

    .prologue
    const/4 v7, -0x1

    .line 1568
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([C)Z

    move-result v8

    if-eqz v8, :cond_2

    :cond_0
    move v3, v7

    .line 1591
    :cond_1
    :goto_0
    return v3

    .line 1571
    :cond_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 1572
    .local v2, csLen:I
    add-int/lit8 v1, v2, -0x1

    .line 1573
    .local v1, csLast:I
    array-length v6, p1

    .line 1574
    .local v6, searchLen:I
    add-int/lit8 v5, v6, -0x1

    .line 1576
    .local v5, searchLast:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-lt v3, v2, :cond_3

    move v3, v7

    .line 1591
    goto :goto_0

    .line 1577
    :cond_3
    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 1578
    .local v0, ch:C
    const/4 v4, 0x0

    .local v4, j:I
    :goto_2
    if-ge v4, v6, :cond_1

    .line 1579
    aget-char v8, p1, v4

    if-ne v8, v0, :cond_5

    .line 1580
    if-ge v3, v1, :cond_4

    if-ge v4, v5, :cond_4

    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 1581
    add-int/lit8 v8, v4, 0x1

    aget-char v8, p1, v8

    add-int/lit8 v9, v3, 0x1

    invoke-interface {p0, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    if-ne v8, v9, :cond_5

    .line 1576
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1578
    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method public static indexOfAnyBut(Ljava/lang/String;Ljava/lang/String;)I
    .locals 7
    .parameter "str"
    .parameter "searchChars"

    .prologue
    const/4 v5, -0x1

    .line 1617
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_0
    move v3, v5

    .line 1635
    :cond_1
    :goto_0
    return v3

    .line 1620
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 1621
    .local v4, strLen:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    if-lt v3, v4, :cond_3

    move v3, v5

    .line 1635
    goto :goto_0

    .line 1622
    :cond_3
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1623
    .local v0, ch:C
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_5

    const/4 v2, 0x1

    .line 1624
    .local v2, chFound:Z
    :goto_2
    add-int/lit8 v6, v3, 0x1

    if-ge v6, v4, :cond_6

    invoke-static {v0}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 1625
    add-int/lit8 v6, v3, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1626
    .local v1, ch2:C
    if-eqz v2, :cond_4

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    if-ltz v6, :cond_1

    .line 1621
    .end local v1           #ch2:C
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1623
    .end local v2           #chFound:Z
    :cond_5
    const/4 v2, 0x0

    goto :goto_2

    .line 1630
    .restart local v2       #chFound:Z
    :cond_6
    if-nez v2, :cond_4

    goto :goto_0
.end method

.method public static indexOfDifference(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I
    .locals 4
    .parameter "cs1"
    .parameter "cs2"

    .prologue
    const/4 v1, -0x1

    .line 5804
    if-ne p0, p1, :cond_1

    move v0, v1

    .line 5819
    :cond_0
    :goto_0
    return v0

    .line 5807
    :cond_1
    if-eqz p0, :cond_2

    if-nez p1, :cond_3

    .line 5808
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 5811
    :cond_3
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v0, v2, :cond_5

    .line 5816
    :cond_4
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v0, v2, :cond_0

    move v0, v1

    .line 5819
    goto :goto_0

    .line 5812
    :cond_5
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-interface {p1, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    if-ne v2, v3, :cond_4

    .line 5811
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static varargs indexOfDifference([Ljava/lang/CharSequence;)I
    .locals 14
    .parameter "css"

    .prologue
    const/4 v10, 0x0

    const/4 v11, -0x1

    .line 5855
    if-eqz p0, :cond_0

    array-length v12, p0

    const/4 v13, 0x1

    if-gt v12, v13, :cond_2

    :cond_0
    move v8, v11

    .line 5909
    :cond_1
    :goto_0
    return v8

    .line 5858
    :cond_2
    const/4 v1, 0x0

    .line 5859
    .local v1, anyStringNull:Z
    const/4 v0, 0x1

    .line 5860
    .local v0, allStringsNull:Z
    array-length v2, p0

    .line 5861
    .local v2, arrayLen:I
    const v8, 0x7fffffff

    .line 5862
    .local v8, shortestStrLen:I
    const/4 v7, 0x0

    .line 5867
    .local v7, longestStrLen:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-lt v6, v2, :cond_4

    .line 5879
    if-nez v0, :cond_3

    if-nez v7, :cond_6

    if-nez v1, :cond_6

    :cond_3
    move v8, v11

    .line 5880
    goto :goto_0

    .line 5868
    :cond_4
    aget-object v12, p0, v6

    if-nez v12, :cond_5

    .line 5869
    const/4 v1, 0x1

    .line 5870
    const/4 v8, 0x0

    .line 5867
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 5872
    :cond_5
    const/4 v0, 0x0

    .line 5873
    aget-object v12, p0, v6

    invoke-interface {v12}, Ljava/lang/CharSequence;->length()I

    move-result v12

    invoke-static {v12, v8}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 5874
    aget-object v12, p0, v6

    invoke-interface {v12}, Ljava/lang/CharSequence;->length()I

    move-result v12

    invoke-static {v12, v7}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_2

    .line 5884
    :cond_6
    if-nez v8, :cond_7

    move v8, v10

    .line 5885
    goto :goto_0

    .line 5889
    :cond_7
    const/4 v5, -0x1

    .line 5890
    .local v5, firstDiff:I
    const/4 v9, 0x0

    .local v9, stringPos:I
    :goto_3
    if-lt v9, v8, :cond_a

    .line 5903
    :cond_8
    if-ne v5, v11, :cond_9

    if-ne v8, v7, :cond_1

    :cond_9
    move v8, v5

    .line 5909
    goto :goto_0

    .line 5891
    :cond_a
    aget-object v12, p0, v10

    invoke-interface {v12, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    .line 5892
    .local v4, comparisonChar:C
    const/4 v3, 0x1

    .local v3, arrayPos:I
    :goto_4
    if-lt v3, v2, :cond_b

    .line 5898
    :goto_5
    if-ne v5, v11, :cond_8

    .line 5890
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 5893
    :cond_b
    aget-object v12, p0, v3

    invoke-interface {v12, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v12

    if-eq v12, v4, :cond_c

    .line 5894
    move v5, v9

    .line 5895
    goto :goto_5

    .line 5892
    :cond_c
    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"

    .prologue
    .line 959
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static indexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 8
    .parameter "str"
    .parameter "searchStr"
    .parameter "startPos"

    .prologue
    const/4 v7, -0x1

    .line 994
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v2, v7

    .line 1012
    :cond_1
    :goto_0
    return v2

    .line 997
    :cond_2
    if-gez p2, :cond_3

    .line 998
    const/4 p2, 0x0

    .line 1000
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    add-int/lit8 v6, v0, 0x1

    .line 1001
    .local v6, endLimit:I
    if-le p2, v6, :cond_4

    move v2, v7

    .line 1002
    goto :goto_0

    .line 1004
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    move v2, p2

    .line 1005
    goto :goto_0

    .line 1007
    :cond_5
    move v2, p2

    .local v2, i:I
    :goto_1
    if-lt v2, v6, :cond_6

    move v2, v7

    .line 1012
    goto :goto_0

    .line 1008
    :cond_6
    const/4 v1, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1007
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public static isAllLowerCase(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5425
    if-eqz p0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 5434
    :cond_0
    :goto_0
    return v2

    .line 5428
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5429
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5434
    const/4 v2, 0x1

    goto :goto_0

    .line 5430
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5429
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAllUpperCase(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5457
    if-eqz p0, :cond_0

    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 5466
    :cond_0
    :goto_0
    return v2

    .line 5460
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5461
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5466
    const/4 v2, 0x1

    goto :goto_0

    .line 5462
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5461
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAlpha(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5145
    if-nez p0, :cond_1

    .line 5154
    :cond_0
    :goto_0
    return v2

    .line 5148
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5149
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5154
    const/4 v2, 0x1

    goto :goto_0

    .line 5150
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5149
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAlphaSpace(Ljava/lang/CharSequence;)Z
    .locals 5
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5180
    if-nez p0, :cond_1

    .line 5189
    :cond_0
    :goto_0
    return v2

    .line 5183
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5184
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5189
    const/4 v2, 0x1

    goto :goto_0

    .line 5185
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5184
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAlphanumeric(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5214
    if-nez p0, :cond_1

    .line 5223
    :cond_0
    :goto_0
    return v2

    .line 5217
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5218
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5223
    const/4 v2, 0x1

    goto :goto_0

    .line 5219
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5218
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAlphanumericSpace(Ljava/lang/CharSequence;)Z
    .locals 5
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5249
    if-nez p0, :cond_1

    .line 5258
    :cond_0
    :goto_0
    return v2

    .line 5252
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5253
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5258
    const/4 v2, 0x1

    goto :goto_0

    .line 5254
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5253
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isAsciiPrintable(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5288
    if-nez p0, :cond_1

    .line 5297
    :cond_0
    :goto_0
    return v2

    .line 5291
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5292
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5297
    const/4 v2, 0x1

    goto :goto_0

    .line 5293
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/apache/commons/lang3/CharUtils;->isAsciiPrintable(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5292
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isBlank(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x1

    .line 233
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .local v1, strLen:I
    if-nez v1, :cond_1

    .line 241
    .end local v1           #strLen:I
    :cond_0
    :goto_0
    return v2

    .line 236
    .restart local v1       #strLen:I
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-ge v0, v1, :cond_0

    .line 237
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_2

    .line 238
    const/4 v2, 0x0

    goto :goto_0

    .line 236
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isEmpty(Ljava/lang/CharSequence;)Z
    .locals 1
    .parameter "cs"

    .prologue
    .line 193
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNotBlank(Ljava/lang/CharSequence;)Z
    .locals 1
    .parameter "cs"

    .prologue
    .line 262
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNotEmpty(Ljava/lang/CharSequence;)Z
    .locals 1
    .parameter "cs"

    .prologue
    .line 212
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNumeric(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5323
    if-nez p0, :cond_1

    .line 5332
    :cond_0
    :goto_0
    return v2

    .line 5326
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5327
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5332
    const/4 v2, 0x1

    goto :goto_0

    .line 5328
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5327
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isNumericSpace(Ljava/lang/CharSequence;)Z
    .locals 5
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5360
    if-nez p0, :cond_1

    .line 5369
    :cond_0
    :goto_0
    return v2

    .line 5363
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5364
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5369
    const/4 v2, 0x1

    goto :goto_0

    .line 5365
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x20

    if-ne v3, v4, :cond_0

    .line 5364
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isWhitespace(Ljava/lang/CharSequence;)Z
    .locals 4
    .parameter "cs"

    .prologue
    const/4 v2, 0x0

    .line 5393
    if-nez p0, :cond_1

    .line 5402
    :cond_0
    :goto_0
    return v2

    .line 5396
    :cond_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 5397
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v1, :cond_2

    .line 5402
    const/4 v2, 0x1

    goto :goto_0

    .line 5398
    :cond_2
    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 5397
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static join(Ljava/lang/Iterable;C)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;C)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 3449
    .local p0, iterable:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    if-nez p0, :cond_0

    .line 3450
    const/4 v0, 0x0

    .line 3452
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/commons/lang3/StringUtils;->join(Ljava/util/Iterator;C)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join(Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 3470
    .local p0, iterable:Ljava/lang/Iterable;,"Ljava/lang/Iterable<*>;"
    if-nez p0, :cond_0

    .line 3471
    const/4 v0, 0x0

    .line 3473
    :goto_0
    return-object v0

    :cond_0
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/apache/commons/lang3/StringUtils;->join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join(Ljava/util/Iterator;C)Ljava/lang/String;
    .locals 4
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;C)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 3361
    .local p0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    if-nez p0, :cond_0

    .line 3362
    const/4 v3, 0x0

    .line 3386
    :goto_0
    return-object v3

    .line 3364
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3365
    const-string v3, ""

    goto :goto_0

    .line 3367
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3368
    .local v1, first:Ljava/lang/Object;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 3369
    invoke-static {v1}, Lorg/apache/commons/lang3/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3373
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v3, 0x100

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3374
    .local v0, buf:Ljava/lang/StringBuilder;
    if-eqz v1, :cond_3

    .line 3375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3378
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 3386
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3379
    :cond_4
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3380
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 3381
    .local v2, obj:Ljava/lang/Object;
    if-eqz v2, :cond_3

    .line 3382
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static join(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter
    .parameter "separator"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 3405
    .local p0, iterator:Ljava/util/Iterator;,"Ljava/util/Iterator<*>;"
    if-nez p0, :cond_0

    .line 3406
    const/4 v3, 0x0

    .line 3431
    :goto_0
    return-object v3

    .line 3408
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 3409
    const-string v3, ""

    goto :goto_0

    .line 3411
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 3412
    .local v1, first:Ljava/lang/Object;
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_2

    .line 3413
    invoke-static {v1}, Lorg/apache/commons/lang3/ObjectUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3417
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v3, 0x100

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3418
    .local v0, buf:Ljava/lang/StringBuilder;
    if-eqz v1, :cond_3

    .line 3419
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3422
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_4

    .line 3431
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3423
    :cond_4
    if-eqz p1, :cond_5

    .line 3424
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3426
    :cond_5
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 3427
    .local v2, obj:Ljava/lang/Object;
    if-eqz v2, :cond_3

    .line 3428
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static join([Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "array"

    .prologue
    .line 3173
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join([Ljava/lang/Object;C)Ljava/lang/String;
    .locals 2
    .parameter "array"
    .parameter "separator"

    .prologue
    .line 3199
    if-nez p0, :cond_0

    .line 3200
    const/4 v0, 0x0

    .line 3203
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;CII)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;CII)Ljava/lang/String;
    .locals 4
    .parameter "array"
    .parameter "separator"
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 3233
    if-nez p0, :cond_0

    .line 3234
    const/4 v3, 0x0

    .line 3252
    :goto_0
    return-object v3

    .line 3236
    :cond_0
    sub-int v1, p3, p2

    .line 3237
    .local v1, bufSize:I
    if-gtz v1, :cond_1

    .line 3238
    const-string v3, ""

    goto :goto_0

    .line 3241
    :cond_1
    aget-object v3, p0, p2

    if-nez v3, :cond_2

    const/16 v3, 0x10

    :goto_1
    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v1, v3

    .line 3242
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3244
    .local v0, buf:Ljava/lang/StringBuilder;
    move v2, p2

    .local v2, i:I
    :goto_2
    if-lt v2, p3, :cond_3

    .line 3252
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3241
    .end local v0           #buf:Ljava/lang/StringBuilder;
    .end local v2           #i:I
    :cond_2
    aget-object v3, p0, p2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_1

    .line 3245
    .restart local v0       #buf:Ljava/lang/StringBuilder;
    .restart local v2       #i:I
    :cond_3
    if-le v2, p2, :cond_4

    .line 3246
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 3248
    :cond_4
    aget-object v3, p0, v2

    if-eqz v3, :cond_5

    .line 3249
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3244
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method public static join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "array"
    .parameter "separator"

    .prologue
    .line 3280
    if-nez p0, :cond_0

    .line 3281
    const/4 v0, 0x0

    .line 3283
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    array-length v1, p0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .parameter "array"
    .parameter "separator"
    .parameter "startIndex"
    .parameter "endIndex"

    .prologue
    .line 3314
    if-nez p0, :cond_0

    .line 3315
    const/4 v3, 0x0

    .line 3341
    :goto_0
    return-object v3

    .line 3317
    :cond_0
    if-nez p1, :cond_1

    .line 3318
    const-string p1, ""

    .line 3323
    :cond_1
    sub-int v1, p3, p2

    .line 3324
    .local v1, bufSize:I
    if-gtz v1, :cond_2

    .line 3325
    const-string v3, ""

    goto :goto_0

    .line 3328
    :cond_2
    aget-object v3, p0, p2

    if-nez v3, :cond_3

    const/16 v3, 0x10

    .line 3329
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    mul-int/2addr v1, v3

    .line 3331
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3333
    .local v0, buf:Ljava/lang/StringBuilder;
    move v2, p2

    .local v2, i:I
    :goto_2
    if-lt v2, p3, :cond_4

    .line 3341
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 3328
    .end local v0           #buf:Ljava/lang/StringBuilder;
    .end local v2           #i:I
    :cond_3
    aget-object v3, p0, p2

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_1

    .line 3334
    .restart local v0       #buf:Ljava/lang/StringBuilder;
    .restart local v2       #i:I
    :cond_4
    if-le v2, p2, :cond_5

    .line 3335
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3337
    :cond_5
    aget-object v3, p0, v2

    if-eqz v3, :cond_6

    .line 3338
    aget-object v3, p0, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 3333
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_2
.end method

.method public static lastIndexOf(Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchChar"

    .prologue
    .line 1037
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1038
    const/4 v0, -0x1

    .line 1040
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;II)I
    .locals 1
    .parameter "str"
    .parameter "searchChar"
    .parameter "startPos"

    .prologue
    .line 1071
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1072
    const/4 v0, -0x1

    .line 1074
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"

    .prologue
    .line 1100
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1101
    :cond_0
    const/4 v0, -0x1

    .line 1103
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"
    .parameter "startPos"

    .prologue
    .line 1172
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1173
    :cond_0
    const/4 v0, -0x1

    .line 1175
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOfAny(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5
    .parameter "str"
    .parameter "searchStrs"

    .prologue
    .line 1873
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 1874
    :cond_0
    const/4 v1, -0x1

    .line 1889
    :cond_1
    return v1

    .line 1876
    :cond_2
    array-length v3, p1

    .line 1877
    .local v3, sz:I
    const/4 v1, -0x1

    .line 1878
    .local v1, ret:I
    const/4 v4, 0x0

    .line 1879
    .local v4, tmp:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v3, :cond_1

    .line 1880
    aget-object v2, p1, v0

    .line 1881
    .local v2, search:Ljava/lang/String;
    if-nez v2, :cond_4

    .line 1879
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1884
    :cond_4
    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    .line 1885
    if-le v4, v1, :cond_3

    .line 1886
    move v1, v4

    goto :goto_1
.end method

.method public static lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"

    .prologue
    .line 1201
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1202
    :cond_0
    const/4 v0, -0x1

    .line 1204
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method public static lastIndexOfIgnoreCase(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 7
    .parameter "str"
    .parameter "searchStr"
    .parameter "startPos"

    .prologue
    const/4 v6, -0x1

    .line 1236
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    :cond_0
    move v2, v6

    .line 1254
    :cond_1
    :goto_0
    return v2

    .line 1239
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    if-le p2, v0, :cond_3

    .line 1240
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int p2, v0, v1

    .line 1242
    :cond_3
    if-gez p2, :cond_4

    move v2, v6

    .line 1243
    goto :goto_0

    .line 1245
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_5

    move v2, p2

    .line 1246
    goto :goto_0

    .line 1249
    :cond_5
    move v2, p2

    .local v2, i:I
    :goto_1
    if-gez v2, :cond_6

    move v2, v6

    .line 1254
    goto :goto_0

    .line 1250
    :cond_6
    const/4 v1, 0x1

    const/4 v4, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move-object v3, p1

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1249
    add-int/lit8 v2, v2, -0x1

    goto :goto_1
.end method

.method public static lastOrdinalIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"
    .parameter "ordinal"

    .prologue
    .line 1140
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method public static left(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "len"

    .prologue
    .line 2029
    if-nez p0, :cond_1

    .line 2030
    const/4 p0, 0x0

    .line 2038
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 2032
    .restart local p0
    :cond_1
    if-gez p1, :cond_2

    .line 2033
    const-string p0, ""

    goto :goto_0

    .line 2035
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 2038
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static leftPad(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "size"

    .prologue
    .line 4651
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static leftPad(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "size"
    .parameter "padChar"

    .prologue
    .line 4676
    if-nez p0, :cond_1

    .line 4677
    const/4 p0, 0x0

    .line 4686
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4679
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, p1, v1

    .line 4680
    .local v0, pads:I
    if-lez v0, :cond_0

    .line 4683
    const/16 v1, 0x2000

    if-le v0, v1, :cond_2

    .line 4684
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4686
    :cond_2
    invoke-static {v0, p2}, Lorg/apache/commons/lang3/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static leftPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "size"
    .parameter "padStr"

    .prologue
    const/4 v7, 0x0

    .line 4713
    if-nez p0, :cond_1

    .line 4714
    const/4 p0, 0x0

    .line 4739
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4716
    .restart local p0
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4717
    const-string p2, " "

    .line 4719
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 4720
    .local v2, padLen:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4721
    .local v5, strLen:I
    sub-int v4, p1, v5

    .line 4722
    .local v4, pads:I
    if-lez v4, :cond_0

    .line 4725
    const/4 v6, 0x1

    if-ne v2, v6, :cond_3

    const/16 v6, 0x2000

    if-gt v4, v6, :cond_3

    .line 4726
    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {p0, p1, v6}, Lorg/apache/commons/lang3/StringUtils;->leftPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4729
    :cond_3
    if-ne v4, v2, :cond_4

    .line 4730
    invoke-virtual {p2, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4731
    :cond_4
    if-ge v4, v2, :cond_5

    .line 4732
    invoke-virtual {p2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4734
    :cond_5
    new-array v3, v4, [C

    .line 4735
    .local v3, padding:[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 4736
    .local v1, padChars:[C
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v4, :cond_6

    .line 4739
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v6, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4737
    :cond_6
    rem-int v6, v0, v2

    aget-char v6, v1, v6

    aput-char v6, v3, v0

    .line 4736
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static length(Ljava/lang/CharSequence;)I
    .locals 1
    .parameter "cs"
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 4757
    invoke-static {p0}, Lorg/apache/commons/lang3/CharSequenceUtils;->length(Ljava/lang/CharSequence;)I

    move-result v0

    return v0
.end method

.method public static lowerCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 4941
    if-nez p0, :cond_0

    .line 4942
    const/4 v0, 0x0

    .line 4944
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static lowerCase(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "locale"

    .prologue
    .line 4964
    if-nez p0, :cond_0

    .line 4965
    const/4 v0, 0x0

    .line 4967
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static mid(Ljava/lang/String;II)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "pos"
    .parameter "len"

    .prologue
    .line 2099
    if-nez p0, :cond_0

    .line 2100
    const/4 v0, 0x0

    .line 2111
    :goto_0
    return-object v0

    .line 2102
    :cond_0
    if-ltz p2, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p1, v0, :cond_2

    .line 2103
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 2105
    :cond_2
    if-gez p1, :cond_3

    .line 2106
    const/4 p1, 0x0

    .line 2108
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int v1, p1, p2

    if-gt v0, v1, :cond_4

    .line 2109
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 2111
    :cond_4
    add-int v0, p1, p2

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "searchStr"
    .parameter "ordinal"

    .prologue
    .line 894
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method private static ordinalIndexOf(Ljava/lang/String;Ljava/lang/String;IZ)I
    .locals 3
    .parameter "str"
    .parameter "searchStr"
    .parameter "ordinal"
    .parameter "lastIndex"

    .prologue
    const/4 v1, -0x1

    .line 912
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-gtz p2, :cond_1

    .line 931
    :cond_0
    :goto_0
    return v1

    .line 915
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_3

    .line 916
    if-eqz p3, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .line 918
    :cond_3
    const/4 v0, 0x0

    .line 919
    .local v0, found:I
    if-eqz p3, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 921
    .local v1, index:I
    :cond_4
    if-eqz p3, :cond_5

    .line 922
    add-int/lit8 v2, v1, -0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v1

    .line 926
    :goto_2
    if-ltz v1, :cond_0

    .line 929
    add-int/lit8 v0, v0, 0x1

    .line 920
    if-lt v0, p2, :cond_4

    goto :goto_0

    .line 924
    :cond_5
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2
.end method

.method public static overlay(Ljava/lang/String;Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .parameter "str"
    .parameter "overlay"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 4224
    if-nez p0, :cond_0

    .line 4225
    const/4 v2, 0x0

    .line 4248
    :goto_0
    return-object v2

    .line 4227
    :cond_0
    if-nez p1, :cond_1

    .line 4228
    const-string p1, ""

    .line 4230
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 4231
    .local v0, len:I
    if-gez p2, :cond_2

    .line 4232
    const/4 p2, 0x0

    .line 4234
    :cond_2
    if-le p2, v0, :cond_3

    .line 4235
    move p2, v0

    .line 4237
    :cond_3
    if-gez p3, :cond_4

    .line 4238
    const/4 p3, 0x0

    .line 4240
    :cond_4
    if-le p3, v0, :cond_5

    .line 4241
    move p3, v0

    .line 4243
    :cond_5
    if-le p2, p3, :cond_6

    .line 4244
    move v1, p2

    .line 4245
    .local v1, temp:I
    move p2, p3

    .line 4246
    move p3, v1

    .line 4248
    .end local v1           #temp:I
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    add-int v3, v0, p2

    sub-int/2addr v3, p3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 4249
    const/4 v3, 0x0

    invoke-virtual {p0, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 4250
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 4251
    invoke-virtual {p0, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 4252
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static padding(IC)Ljava/lang/String;
    .locals 5
    .parameter "repeat"
    .parameter "padChar"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .prologue
    .line 4509
    if-gez p0, :cond_0

    .line 4510
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Cannot pad a negative amount: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 4512
    :cond_0
    new-array v0, p0, [C

    .line 4513
    .local v0, buf:[C
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-lt v1, v2, :cond_1

    .line 4516
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    return-object v2

    .line 4514
    :cond_1
    aput-char p1, v0, v1

    .line 4513
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static remove(Ljava/lang/String;C)Ljava/lang/String;
    .locals 6
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3701
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    .line 3711
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3704
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 3705
    .local v0, chars:[C
    const/4 v2, 0x0

    .line 3706
    .local v2, pos:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v4, v0

    if-lt v1, v4, :cond_2

    .line 3711
    new-instance p0, Ljava/lang/String;

    .end local p0
    const/4 v4, 0x0

    invoke-direct {p0, v0, v4, v2}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 3707
    .restart local p0
    :cond_2
    aget-char v4, v0, v1

    if-eq v4, p1, :cond_3

    .line 3708
    add-int/lit8 v3, v2, 0x1

    .end local v2           #pos:I
    .local v3, pos:I
    aget-char v4, v0, v1

    aput-char v4, v0, v2

    move v2, v3

    .line 3706
    .end local v3           #pos:I
    .restart local v2       #pos:I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static remove(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3675
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3678
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .restart local p0
    :cond_1
    const-string v0, ""

    const/4 v1, -0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3606
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3612
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3609
    .restart local p0
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3610
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeEndIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3642
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3648
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3645
    .restart local p0
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->endsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3646
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3537
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3543
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3540
    .restart local p0
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3541
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static removeStartIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "remove"

    .prologue
    .line 3572
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 3578
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3575
    .restart local p0
    :cond_1
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3576
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static repeat(Ljava/lang/String;I)Ljava/lang/String;
    .locals 12
    .parameter "str"
    .parameter "repeat"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 4414
    if-nez p0, :cond_1

    .line 4415
    const/4 p0, 0x0

    .line 4451
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4417
    .restart local p0
    :cond_1
    if-gtz p1, :cond_2

    .line 4418
    const-string p0, ""

    goto :goto_0

    .line 4420
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4421
    .local v5, inputLength:I
    if-eq p1, v11, :cond_0

    if-eqz v5, :cond_0

    .line 4424
    if-ne v5, v11, :cond_3

    const/16 v9, 0x2000

    if-gt p1, v9, :cond_3

    .line 4425
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {p1, v9}, Lorg/apache/commons/lang3/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4428
    :cond_3
    mul-int v8, v5, p1

    .line 4429
    .local v8, outputLength:I
    packed-switch v5, :pswitch_data_0

    .line 4447
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 4448
    .local v0, buf:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-lt v4, p1, :cond_6

    .line 4451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4431
    .end local v0           #buf:Ljava/lang/StringBuilder;
    .end local v4           #i:I
    :pswitch_0
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4432
    .local v1, ch:C
    new-array v6, v8, [C

    .line 4433
    .local v6, output1:[C
    add-int/lit8 v4, p1, -0x1

    .restart local v4       #i:I
    :goto_2
    if-gez v4, :cond_4

    .line 4436
    new-instance p0, Ljava/lang/String;

    .end local p0
    invoke-direct {p0, v6}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 4434
    .restart local p0
    :cond_4
    aput-char v1, v6, v4

    .line 4433
    add-int/lit8 v4, v4, -0x1

    goto :goto_2

    .line 4438
    .end local v1           #ch:C
    .end local v4           #i:I
    .end local v6           #output1:[C
    :pswitch_1
    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 4439
    .local v2, ch0:C
    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 4440
    .local v3, ch1:C
    new-array v7, v8, [C

    .line 4441
    .local v7, output2:[C
    mul-int/lit8 v9, p1, 0x2

    add-int/lit8 v4, v9, -0x2

    .restart local v4       #i:I
    :goto_3
    if-gez v4, :cond_5

    .line 4445
    new-instance p0, Ljava/lang/String;

    .end local p0
    invoke-direct {p0, v7}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 4442
    .restart local p0
    :cond_5
    aput-char v2, v7, v4

    .line 4443
    add-int/lit8 v9, v4, 0x1

    aput-char v3, v7, v9

    .line 4441
    add-int/lit8 v4, v4, -0x1

    add-int/lit8 v4, v4, -0x1

    goto :goto_3

    .line 4449
    .end local v2           #ch0:C
    .end local v3           #ch1:C
    .end local v7           #output2:[C
    .restart local v0       #buf:Ljava/lang/StringBuilder;
    :cond_6
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4448
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 4429
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static repeat(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "separator"
    .parameter "repeat"

    .prologue
    .line 4476
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 4477
    :cond_0
    invoke-static {p0, p2}, Lorg/apache/commons/lang3/StringUtils;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 4481
    :goto_0
    return-object v1

    .line 4480
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p2}, Lorg/apache/commons/lang3/StringUtils;->repeat(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .line 4481
    .local v0, result:Ljava/lang/String;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/StringUtils;->removeEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "text"
    .parameter "searchString"
    .parameter "replacement"

    .prologue
    .line 3767
    const/4 v0, -0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 8
    .parameter "text"
    .parameter "searchString"
    .parameter "replacement"
    .parameter "max"

    .prologue
    const/16 v5, 0x40

    const/4 v7, -0x1

    .line 3799
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    if-eqz p2, :cond_0

    if-nez p3, :cond_1

    .line 3821
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3802
    .restart local p0
    :cond_1
    const/4 v4, 0x0

    .line 3803
    .local v4, start:I
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 3804
    .local v1, end:I
    if-eq v1, v7, :cond_0

    .line 3807
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 3808
    .local v3, replLength:I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    sub-int v2, v6, v3

    .line 3809
    .local v2, increase:I
    if-gez v2, :cond_2

    const/4 v2, 0x0

    .line 3810
    :cond_2
    if-gez p3, :cond_5

    const/16 v5, 0x10

    :cond_3
    :goto_1
    mul-int/2addr v2, v5

    .line 3811
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/2addr v5, v2

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 3812
    .local v0, buf:Ljava/lang/StringBuilder;
    :goto_2
    if-ne v1, v7, :cond_6

    .line 3820
    :cond_4
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3821
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 3810
    .end local v0           #buf:Ljava/lang/StringBuilder;
    :cond_5
    if-gt p3, v5, :cond_3

    move v5, p3

    goto :goto_1

    .line 3813
    .restart local v0       #buf:Ljava/lang/StringBuilder;
    :cond_6
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3814
    add-int v4, v1, v3

    .line 3815
    add-int/lit8 p3, p3, -0x1

    if-eqz p3, :cond_4

    .line 3818
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    goto :goto_2
.end method

.method public static replaceChars(Ljava/lang/String;CC)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "searchChar"
    .parameter "replaceChar"

    .prologue
    .line 4121
    if-nez p0, :cond_0

    .line 4122
    const/4 v0, 0x0

    .line 4124
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static replaceChars(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "searchChars"
    .parameter "replaceChars"

    .prologue
    .line 4164
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 4189
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4167
    .restart local p0
    :cond_1
    if-nez p2, :cond_2

    .line 4168
    const-string p2, ""

    .line 4170
    :cond_2
    const/4 v4, 0x0

    .line 4171
    .local v4, modified:Z
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    .line 4172
    .local v5, replaceCharsLength:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 4173
    .local v6, strLength:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 4174
    .local v0, buf:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-lt v2, v6, :cond_3

    .line 4186
    if-eqz v4, :cond_0

    .line 4187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4175
    :cond_3
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 4176
    .local v1, ch:C
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 4177
    .local v3, index:I
    if-ltz v3, :cond_5

    .line 4178
    const/4 v4, 0x1

    .line 4179
    if-ge v3, v5, :cond_4

    .line 4180
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 4174
    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 4183
    :cond_5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2
.end method

.method public static replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "text"
    .parameter "searchList"
    .parameter "replacementList"

    .prologue
    const/4 v0, 0x0

    .line 3864
    invoke-static {p0, p1, p2, v0, v0}, Lorg/apache/commons/lang3/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;
    .locals 20
    .parameter "text"
    .parameter "searchList"
    .parameter "replacementList"
    .parameter "repeat"
    .parameter "timeToLive"

    .prologue
    .line 3974
    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_0

    if-eqz p1, :cond_0

    .line 3975
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    if-eqz v17, :cond_0

    if-eqz p2, :cond_0

    move-object/from16 v0, p2

    array-length v0, v0

    move/from16 v17, v0

    if-nez v17, :cond_1

    .line 4095
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 3981
    .restart local p0
    :cond_1
    if-gez p4, :cond_2

    .line 3982
    new-instance v17, Ljava/lang/IllegalStateException;

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "TimeToLive of "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v18

    move/from16 v1, p4

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " is less than 0: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 3985
    :cond_2
    move-object/from16 v0, p1

    array-length v12, v0

    .line 3986
    .local v12, searchLength:I
    move-object/from16 v0, p2

    array-length v10, v0

    .line 3989
    .local v10, replacementLength:I
    if-eq v12, v10, :cond_3

    .line 3990
    new-instance v17, Ljava/lang/IllegalArgumentException;

    new-instance v18, Ljava/lang/StringBuilder;

    const-string v19, "Search and Replace array lengths don\'t match: "

    invoke-direct/range {v18 .. v19}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3991
    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    .line 3992
    const-string v19, " vs "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    .line 3993
    move-object/from16 v0, v18

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .line 3990
    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 3997
    :cond_3
    new-array v8, v12, [Z

    .line 4000
    .local v8, noMoreMatchesForReplIndex:[Z
    const/4 v15, -0x1

    .line 4001
    .local v15, textIndex:I
    const/4 v9, -0x1

    .line 4002
    .local v9, replaceIndex:I
    const/4 v14, -0x1

    .line 4006
    .local v14, tempIndex:I
    const/4 v6, 0x0

    .local v6, i:I
    :goto_1
    if-lt v6, v12, :cond_5

    .line 4027
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_0

    .line 4031
    const/4 v13, 0x0

    .line 4034
    .local v13, start:I
    const/4 v7, 0x0

    .line 4037
    .local v7, increase:I
    const/4 v6, 0x0

    :goto_2
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-lt v6, v0, :cond_a

    .line 4047
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    div-int/lit8 v17, v17, 0x5

    move/from16 v0, v17

    invoke-static {v7, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 4049
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    add-int v17, v17, v7

    move/from16 v0, v17

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 4051
    .local v4, buf:Ljava/lang/StringBuilder;
    :cond_4
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v15, v0, :cond_d

    .line 4086
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v16

    .line 4087
    .local v16, textLength:I
    move v6, v13

    :goto_3
    move/from16 v0, v16

    if-lt v6, v0, :cond_13

    .line 4090
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 4091
    .local v11, result:Ljava/lang/String;
    if-nez p3, :cond_14

    move-object/from16 p0, v11

    .line 4092
    goto/16 :goto_0

    .line 4007
    .end local v4           #buf:Ljava/lang/StringBuilder;
    .end local v7           #increase:I
    .end local v11           #result:Ljava/lang/String;
    .end local v13           #start:I
    .end local v16           #textLength:I
    :cond_5
    aget-boolean v17, v8, v6

    if-nez v17, :cond_6

    aget-object v17, p1, v6

    if-eqz v17, :cond_6

    .line 4008
    aget-object v17, p1, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_6

    aget-object v17, p2, v6

    if-nez v17, :cond_7

    .line 4006
    :cond_6
    :goto_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 4012
    :cond_7
    aget-object v17, p1, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v14

    .line 4015
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v14, v0, :cond_8

    .line 4016
    const/16 v17, 0x1

    aput-boolean v17, v8, v6

    goto :goto_4

    .line 4018
    :cond_8
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_9

    if-ge v14, v15, :cond_6

    .line 4019
    :cond_9
    move v15, v14

    .line 4020
    move v9, v6

    goto :goto_4

    .line 4038
    .restart local v7       #increase:I
    .restart local v13       #start:I
    :cond_a
    aget-object v17, p1, v6

    if-eqz v17, :cond_b

    aget-object v17, p2, v6

    if-nez v17, :cond_c

    .line 4037
    :cond_b
    :goto_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 4041
    :cond_c
    aget-object v17, p2, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    aget-object v18, p1, v6

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v18

    sub-int v5, v17, v18

    .line 4042
    .local v5, greater:I
    if-lez v5, :cond_b

    .line 4043
    mul-int/lit8 v17, v5, 0x3

    add-int v7, v7, v17

    goto :goto_5

    .line 4053
    .end local v5           #greater:I
    .restart local v4       #buf:Ljava/lang/StringBuilder;
    :cond_d
    move v6, v13

    :goto_6
    if-lt v6, v15, :cond_f

    .line 4056
    aget-object v17, p2, v9

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 4058
    aget-object v17, p1, v9

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    add-int v13, v15, v17

    .line 4060
    const/4 v15, -0x1

    .line 4061
    const/4 v9, -0x1

    .line 4062
    const/4 v14, -0x1

    .line 4065
    const/4 v6, 0x0

    :goto_7
    if-ge v6, v12, :cond_4

    .line 4066
    aget-boolean v17, v8, v6

    if-nez v17, :cond_e

    aget-object v17, p1, v6

    if-eqz v17, :cond_e

    .line 4067
    aget-object v17, p1, v6

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v17

    if-eqz v17, :cond_e

    aget-object v17, p2, v6

    if-nez v17, :cond_10

    .line 4065
    :cond_e
    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_7

    .line 4054
    :cond_f
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 4053
    add-int/lit8 v6, v6, 0x1

    goto :goto_6

    .line 4071
    :cond_10
    aget-object v17, p1, v6

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v14

    .line 4074
    const/16 v17, -0x1

    move/from16 v0, v17

    if-ne v14, v0, :cond_11

    .line 4075
    const/16 v17, 0x1

    aput-boolean v17, v8, v6

    goto :goto_8

    .line 4077
    :cond_11
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v15, v0, :cond_12

    if-ge v14, v15, :cond_e

    .line 4078
    :cond_12
    move v15, v14

    .line 4079
    move v9, v6

    goto :goto_8

    .line 4088
    .restart local v16       #textLength:I
    :cond_13
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 4087
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_3

    .line 4095
    .restart local v11       #result:Ljava/lang/String;
    :cond_14
    add-int/lit8 v17, p4, -0x1

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, v17

    invoke-static {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang3/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0
.end method

.method public static replaceEachRepeatedly(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "text"
    .parameter "searchList"
    .parameter "replacementList"

    .prologue
    .line 3915
    if-nez p1, :cond_0

    const/4 v0, 0x0

    .line 3916
    .local v0, timeToLive:I
    :goto_0
    const/4 v1, 0x1

    invoke-static {p0, p1, p2, v1, v0}, Lorg/apache/commons/lang3/StringUtils;->replaceEach(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;ZI)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 3915
    .end local v0           #timeToLive:I
    :cond_0
    array-length v0, p1

    goto :goto_0
.end method

.method public static replaceOnce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "text"
    .parameter "searchString"
    .parameter "replacement"

    .prologue
    .line 3740
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static reverse(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 5550
    if-nez p0, :cond_0

    .line 5551
    const/4 v0, 0x0

    .line 5553
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static reverseDelimited(Ljava/lang/String;C)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separatorChar"

    .prologue
    .line 5576
    if-nez p0, :cond_0

    .line 5577
    const/4 v1, 0x0

    .line 5583
    :goto_0
    return-object v1

    .line 5581
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .line 5582
    .local v0, strs:[Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang3/ArrayUtils;->reverse([Ljava/lang/Object;)V

    .line 5583
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/StringUtils;->join([Ljava/lang/Object;C)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static right(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "len"

    .prologue
    .line 2062
    if-nez p0, :cond_1

    .line 2063
    const/4 p0, 0x0

    .line 2071
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 2065
    .restart local p0
    :cond_1
    if-gez p1, :cond_2

    .line 2066
    const-string p0, ""

    goto :goto_0

    .line 2068
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, p1, :cond_0

    .line 2071
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, p1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static rightPad(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "size"

    .prologue
    .line 4539
    const/16 v0, 0x20

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static rightPad(Ljava/lang/String;IC)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "size"
    .parameter "padChar"

    .prologue
    .line 4564
    if-nez p0, :cond_1

    .line 4565
    const/4 p0, 0x0

    .line 4574
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4567
    .restart local p0
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    sub-int v0, p1, v1

    .line 4568
    .local v0, pads:I
    if-lez v0, :cond_0

    .line 4571
    const/16 v1, 0x2000

    if-le v0, v1, :cond_2

    .line 4572
    invoke-static {p2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, p1, v1}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4574
    :cond_2
    invoke-static {v0, p2}, Lorg/apache/commons/lang3/StringUtils;->padding(IC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static rightPad(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "size"
    .parameter "padStr"

    .prologue
    const/4 v7, 0x0

    .line 4601
    if-nez p0, :cond_1

    .line 4602
    const/4 p0, 0x0

    .line 4627
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 4604
    .restart local p0
    :cond_1
    invoke-static {p2}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4605
    const-string p2, " "

    .line 4607
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 4608
    .local v2, padLen:I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 4609
    .local v5, strLen:I
    sub-int v4, p1, v5

    .line 4610
    .local v4, pads:I
    if-lez v4, :cond_0

    .line 4613
    const/4 v6, 0x1

    if-ne v2, v6, :cond_3

    const/16 v6, 0x2000

    if-gt v4, v6, :cond_3

    .line 4614
    invoke-virtual {p2, v7}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {p0, p1, v6}, Lorg/apache/commons/lang3/StringUtils;->rightPad(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4617
    :cond_3
    if-ne v4, v2, :cond_4

    .line 4618
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4619
    :cond_4
    if-ge v4, v2, :cond_5

    .line 4620
    invoke-virtual {p2, v7, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4622
    :cond_5
    new-array v3, v4, [C

    .line 4623
    .local v3, padding:[C
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 4624
    .local v1, padChars:[C
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    if-lt v0, v4, :cond_6

    .line 4627
    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v3}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {p0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 4625
    :cond_6
    rem-int v6, v0, v2

    aget-char v6, v1, v6

    aput-char v6, v3, v0

    .line 4624
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static split(Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "str"

    .prologue
    .line 2429
    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->split(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separatorChar"

    .prologue
    .line 2457
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separatorChars"

    .prologue
    .line 2486
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static split(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separatorChars"
    .parameter "max"

    .prologue
    .line 2520
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByCharacterType(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 3031
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;
    .locals 9
    .parameter "str"
    .parameter "camelCase"

    .prologue
    .line 3077
    if-nez p0, :cond_0

    .line 3078
    const/4 v7, 0x0

    .line 3105
    :goto_0
    return-object v7

    .line 3080
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 3081
    sget-object v7, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 3083
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 3084
    .local v0, c:[C
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3085
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 3086
    .local v5, tokenStart:I
    aget-char v7, v0, v5

    invoke-static {v7}, Ljava/lang/Character;->getType(C)I

    move-result v1

    .line 3087
    .local v1, currentType:I
    add-int/lit8 v4, v5, 0x1

    .local v4, pos:I
    :goto_1
    array-length v7, v0

    if-lt v4, v7, :cond_2

    .line 3104
    new-instance v7, Ljava/lang/String;

    array-length v8, v0

    sub-int/2addr v8, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3105
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    goto :goto_0

    .line 3088
    :cond_2
    aget-char v7, v0, v4

    invoke-static {v7}, Ljava/lang/Character;->getType(C)I

    move-result v6

    .line 3089
    .local v6, type:I
    if-ne v6, v1, :cond_3

    .line 3087
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 3092
    :cond_3
    if-eqz p1, :cond_5

    const/4 v7, 0x2

    if-ne v6, v7, :cond_5

    const/4 v7, 0x1

    if-ne v1, v7, :cond_5

    .line 3093
    add-int/lit8 v3, v4, -0x1

    .line 3094
    .local v3, newTokenStart:I
    if-eq v3, v5, :cond_4

    .line 3095
    new-instance v7, Ljava/lang/String;

    sub-int v8, v3, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3096
    move v5, v3

    .line 3102
    .end local v3           #newTokenStart:I
    :cond_4
    :goto_3
    move v1, v6

    goto :goto_2

    .line 3099
    :cond_5
    new-instance v7, Ljava/lang/String;

    sub-int v8, v4, v5

    invoke-direct {v7, v0, v5, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3100
    move v5, v4

    goto :goto_3
.end method

.method public static splitByCharacterTypeCamelCase(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 3059
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->splitByCharacterType(Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparator(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2547
    const/4 v0, -0x1

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparator(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separator"
    .parameter "max"

    .prologue
    .line 2578
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparatorPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2607
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitByWholeSeparatorPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separator"
    .parameter "max"

    .prologue
    .line 2640
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitByWholeSeparatorWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "separator"
    .parameter "max"
    .parameter "preserveAllTokens"

    .prologue
    const/4 v6, 0x0

    .line 2660
    if-nez p0, :cond_0

    .line 2721
    :goto_0
    return-object v6

    .line 2664
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2666
    .local v2, len:I
    if-nez v2, :cond_1

    .line 2667
    sget-object v6, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2670
    :cond_1
    if-eqz p1, :cond_2

    const-string v7, ""

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 2672
    :cond_2
    invoke-static {p0, v6, p2, p3}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 2675
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 2677
    .local v4, separatorLength:I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 2678
    .local v5, substrings:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v3, 0x0

    .line 2679
    .local v3, numberOfSubstrings:I
    const/4 v0, 0x0

    .line 2680
    .local v0, beg:I
    const/4 v1, 0x0

    .line 2681
    .local v1, end:I
    :goto_1
    if-lt v1, v2, :cond_4

    .line 2721
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    goto :goto_0

    .line 2682
    :cond_4
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 2684
    const/4 v6, -0x1

    if-le v1, v6, :cond_9

    .line 2685
    if-le v1, v0, :cond_6

    .line 2686
    add-int/lit8 v3, v3, 0x1

    .line 2688
    if-ne v3, p2, :cond_5

    .line 2689
    move v1, v2

    .line 2690
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 2694
    :cond_5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2699
    add-int v0, v1, v4

    .line 2701
    goto :goto_1

    .line 2703
    :cond_6
    if-eqz p3, :cond_7

    .line 2704
    add-int/lit8 v3, v3, 0x1

    .line 2705
    if-ne v3, p2, :cond_8

    .line 2706
    move v1, v2

    .line 2707
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2712
    :cond_7
    :goto_2
    add-int v0, v1, v4

    .line 2714
    goto :goto_1

    .line 2709
    :cond_8
    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 2716
    :cond_9
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2717
    move v1, v2

    goto :goto_1
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .parameter "str"

    .prologue
    .line 2750
    const/4 v0, 0x0

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;C)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separatorChar"

    .prologue
    .line 2786
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separatorChars"

    .prologue
    .line 2869
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static splitPreserveAllTokens(Ljava/lang/String;Ljava/lang/String;I)[Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "separatorChars"
    .parameter "max"

    .prologue
    .line 2909
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/StringUtils;->splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static splitWorker(Ljava/lang/String;CZ)[Ljava/lang/String;
    .locals 7
    .parameter "str"
    .parameter "separatorChar"
    .parameter "preserveAllTokens"

    .prologue
    .line 2804
    if-nez p0, :cond_0

    .line 2805
    const/4 v6, 0x0

    .line 2832
    :goto_0
    return-object v6

    .line 2807
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2808
    .local v2, len:I
    if-nez v2, :cond_1

    .line 2809
    sget-object v6, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2811
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2812
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, i:I
    const/4 v5, 0x0

    .line 2813
    .local v5, start:I
    const/4 v4, 0x0

    .line 2814
    .local v4, match:Z
    const/4 v1, 0x0

    .line 2815
    .local v1, lastMatch:Z
    :goto_1
    if-lt v0, v2, :cond_4

    .line 2829
    if-nez v4, :cond_2

    if-eqz p2, :cond_3

    if-eqz v1, :cond_3

    .line 2830
    :cond_2
    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2832
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v3, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    goto :goto_0

    .line 2816
    :cond_4
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, p1, :cond_7

    .line 2817
    if-nez v4, :cond_5

    if-eqz p2, :cond_6

    .line 2818
    :cond_5
    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2819
    const/4 v4, 0x0

    .line 2820
    const/4 v1, 0x1

    .line 2822
    :cond_6
    add-int/lit8 v0, v0, 0x1

    move v5, v0

    .line 2823
    goto :goto_1

    .line 2825
    :cond_7
    const/4 v1, 0x0

    .line 2826
    const/4 v4, 0x1

    .line 2827
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static splitWorker(Ljava/lang/String;Ljava/lang/String;IZ)[Ljava/lang/String;
    .locals 11
    .parameter "str"
    .parameter "separatorChars"
    .parameter "max"
    .parameter "preserveAllTokens"

    .prologue
    .line 2931
    if-nez p0, :cond_0

    .line 2932
    const/4 v9, 0x0

    .line 3008
    :goto_0
    return-object v9

    .line 2934
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 2935
    .local v2, len:I
    if-nez v2, :cond_1

    .line 2936
    sget-object v9, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2938
    :cond_1
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 2939
    .local v3, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v6, 0x1

    .line 2940
    .local v6, sizePlus1:I
    const/4 v0, 0x0

    .local v0, i:I
    const/4 v8, 0x0

    .line 2941
    .local v8, start:I
    const/4 v4, 0x0

    .line 2942
    .local v4, match:Z
    const/4 v1, 0x0

    .line 2943
    .local v1, lastMatch:Z
    if-nez p1, :cond_8

    move v7, v6

    .line 2945
    .end local v6           #sizePlus1:I
    .local v7, sizePlus1:I
    :goto_1
    if-lt v0, v2, :cond_4

    move v6, v7

    .line 3005
    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    :goto_2
    if-nez v4, :cond_2

    if-eqz p3, :cond_3

    if-eqz v1, :cond_3

    .line 3006
    :cond_2
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3008
    :cond_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v3, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    goto :goto_0

    .line 2946
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    :cond_4
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 2947
    if-nez v4, :cond_5

    if-eqz p3, :cond_14

    .line 2948
    :cond_5
    const/4 v1, 0x1

    .line 2949
    add-int/lit8 v6, v7, 0x1

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    if-ne v7, p2, :cond_6

    .line 2950
    move v0, v2

    .line 2951
    const/4 v1, 0x0

    .line 2953
    :cond_6
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2954
    const/4 v4, 0x0

    .line 2956
    :goto_3
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2957
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    goto :goto_1

    .line 2959
    :cond_7
    const/4 v1, 0x0

    .line 2960
    const/4 v4, 0x1

    .line 2961
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2963
    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_13

    .line 2965
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .local v5, sep:C
    move v7, v6

    .line 2966
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    :goto_4
    if-lt v0, v2, :cond_9

    move v6, v7

    .line 2984
    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    goto :goto_2

    .line 2967
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    :cond_9
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v5, :cond_c

    .line 2968
    if-nez v4, :cond_a

    if-eqz p3, :cond_12

    .line 2969
    :cond_a
    const/4 v1, 0x1

    .line 2970
    add-int/lit8 v6, v7, 0x1

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    if-ne v7, p2, :cond_b

    .line 2971
    move v0, v2

    .line 2972
    const/4 v1, 0x0

    .line 2974
    :cond_b
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2975
    const/4 v4, 0x0

    .line 2977
    :goto_5
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2978
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    goto :goto_4

    .line 2980
    :cond_c
    const/4 v1, 0x0

    .line 2981
    const/4 v4, 0x1

    .line 2982
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 2987
    .end local v5           #sep:C
    :cond_d
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-ltz v9, :cond_10

    .line 2988
    if-nez v4, :cond_e

    if-eqz p3, :cond_11

    .line 2989
    :cond_e
    const/4 v1, 0x1

    .line 2990
    add-int/lit8 v6, v7, 0x1

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    if-ne v7, p2, :cond_f

    .line 2991
    move v0, v2

    .line 2992
    const/4 v1, 0x0

    .line 2994
    :cond_f
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2995
    const/4 v4, 0x0

    .line 2997
    :goto_6
    add-int/lit8 v0, v0, 0x1

    move v8, v0

    move v7, v6

    .line 2986
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    :goto_7
    if-lt v0, v2, :cond_d

    move v6, v7

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    goto/16 :goto_2

    .line 3000
    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    :cond_10
    const/4 v1, 0x0

    .line 3001
    const/4 v4, 0x1

    .line 3002
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_11
    move v6, v7

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    goto :goto_6

    .end local v6           #sizePlus1:I
    .restart local v5       #sep:C
    .restart local v7       #sizePlus1:I
    :cond_12
    move v6, v7

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    goto :goto_5

    .end local v5           #sep:C
    :cond_13
    move v7, v6

    .end local v6           #sizePlus1:I
    .restart local v7       #sizePlus1:I
    goto :goto_7

    :cond_14
    move v6, v7

    .end local v7           #sizePlus1:I
    .restart local v6       #sizePlus1:I
    goto :goto_3
.end method

.method public static startsWith(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "str"
    .parameter "prefix"

    .prologue
    .line 6104
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 6
    .parameter "str"
    .parameter "prefix"
    .parameter "ignoreCase"

    .prologue
    const/4 v2, 0x0

    .line 6144
    if-eqz p0, :cond_0

    if-nez p1, :cond_2

    .line 6145
    :cond_0
    if-nez p0, :cond_1

    if-nez p1, :cond_1

    const/4 v2, 0x1

    .line 6150
    :cond_1
    :goto_0
    return v2

    .line 6147
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v0, v1, :cond_1

    .line 6150
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    move-object v0, p0

    move v1, p2

    move-object v3, p1

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v2

    goto :goto_0
.end method

.method public static varargs startsWithAny(Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 4
    .parameter "string"
    .parameter "searchStrings"

    .prologue
    const/4 v2, 0x0

    .line 6172
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 6181
    :cond_0
    :goto_0
    return v2

    .line 6175
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_0

    .line 6176
    aget-object v1, p1, v0

    .line 6177
    .local v1, searchString:Ljava/lang/String;
    invoke-static {p0, v1}, Lorg/apache/commons/lang3/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 6178
    const/4 v2, 0x1

    goto :goto_0

    .line 6175
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "str"
    .parameter "prefix"

    .prologue
    .line 6129
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/StringUtils;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static strip(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 371
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "stripChars"

    .prologue
    .line 458
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 462
    .end local p0
    :goto_0
    return-object p0

    .line 461
    .restart local p0
    :cond_0
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 462
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/StringUtils;->stripEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static stripAccents(Ljava/lang/String;)Ljava/lang/String;
    .locals 16
    .parameter "input"

    .prologue
    .line 632
    if-nez p0, :cond_0

    .line 633
    const/4 v12, 0x0

    .line 658
    :goto_0
    return-object v12

    .line 635
    :cond_0
    const v12, 0x3fcccccd

    invoke-static {v12}, Lorg/apache/commons/lang3/SystemUtils;->isJavaVersionAtLeast(F)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 642
    :try_start_0
    const-string v12, "java.text.Normalizer$Form"

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lorg/apache/commons/lang3/ClassUtils;->getClass(Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v8

    .line 645
    .local v8, normalizerFormClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v12, "java.text.Normalizer"

    const/4 v13, 0x0

    invoke-static {v12, v13}, Lorg/apache/commons/lang3/ClassUtils;->getClass(Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v7

    .line 648
    .local v7, normalizerClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const-string v12, "normalize"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Class;

    const/4 v14, 0x0

    const-class v15, Ljava/lang/CharSequence;

    aput-object v15, v13, v14

    const/4 v14, 0x1

    aput-object v8, v13, v14

    invoke-virtual {v7, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 651
    .local v5, method:Ljava/lang/reflect/Method;
    const-string v12, "NFD"

    invoke-virtual {v8, v12}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 654
    .local v6, nfd:Ljava/lang/reflect/Field;
    const/4 v12, 0x0

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    aput-object p0, v13, v14

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-virtual {v6, v15}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-virtual {v5, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 657
    .local v2, decomposed:Ljava/lang/String;
    const-string v12, "\\p{InCombiningDiacriticalMarks}+"

    invoke-static {v12}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 658
    .local v0, accentPattern:Ljava/util/regex/Pattern;
    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    const-string v13, ""

    invoke-virtual {v12, v13}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_6

    move-result-object v12

    goto :goto_0

    .line 659
    .end local v0           #accentPattern:Ljava/util/regex/Pattern;
    .end local v2           #decomposed:Ljava/lang/String;
    .end local v5           #method:Ljava/lang/reflect/Method;
    .end local v6           #nfd:Ljava/lang/reflect/Field;
    .end local v7           #normalizerClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v8           #normalizerFormClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :catch_0
    move-exception v1

    .line 660
    .local v1, cnfe:Ljava/lang/ClassNotFoundException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "ClassNotFoundException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 661
    .end local v1           #cnfe:Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v10

    .line 662
    .local v10, nsme:Ljava/lang/NoSuchMethodException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "NoSuchMethodException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v10}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 663
    .end local v10           #nsme:Ljava/lang/NoSuchMethodException;
    :catch_2
    move-exception v9

    .line 664
    .local v9, nsfe:Ljava/lang/NoSuchFieldException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "NoSuchFieldException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 665
    .end local v9           #nsfe:Ljava/lang/NoSuchFieldException;
    :catch_3
    move-exception v3

    .line 666
    .local v3, iae:Ljava/lang/IllegalAccessException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "IllegalAccessException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 667
    .end local v3           #iae:Ljava/lang/IllegalAccessException;
    :catch_4
    move-exception v3

    .line 668
    .local v3, iae:Ljava/lang/IllegalArgumentException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "IllegalArgumentException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 669
    .end local v3           #iae:Ljava/lang/IllegalArgumentException;
    :catch_5
    move-exception v4

    .line 670
    .local v4, ite:Ljava/lang/reflect/InvocationTargetException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "InvocationTargetException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 671
    .end local v4           #ite:Ljava/lang/reflect/InvocationTargetException;
    :catch_6
    move-exception v11

    .line 672
    .local v11, se:Ljava/lang/SecurityException;
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "SecurityException occurred during 1.6 backcompat code"

    invoke-direct {v12, v13, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 675
    .end local v11           #se:Ljava/lang/SecurityException;
    :cond_1
    new-instance v12, Ljava/lang/UnsupportedOperationException;

    const-string v13, "The stripAccents(String) method is not supported until Java 1.6"

    invoke-direct {v12, v13}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v12
.end method

.method public static stripAll([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .parameter "strs"

    .prologue
    .line 575
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->stripAll([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static stripAll([Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .parameter "strs"
    .parameter "stripChars"

    .prologue
    .line 605
    if-eqz p0, :cond_0

    array-length v2, p0

    .local v2, strsLen:I
    if-nez v2, :cond_2

    .end local v2           #strsLen:I
    :cond_0
    move-object v1, p0

    .line 612
    :cond_1
    return-object v1

    .line 608
    .restart local v2       #strsLen:I
    :cond_2
    new-array v1, v2, [Ljava/lang/String;

    .line 609
    .local v1, newArr:[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 610
    aget-object v3, p0, v0

    invoke-static {v3, p1}, Lorg/apache/commons/lang3/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 609
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static stripEnd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "stripChars"

    .prologue
    .line 535
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, end:I
    if-nez v0, :cond_1

    .line 550
    .end local v0           #end:I
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 539
    .restart local v0       #end:I
    .restart local p0
    :cond_1
    if-nez p1, :cond_4

    .line 540
    :goto_1
    if-eqz v0, :cond_2

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_3

    .line 550
    :cond_2
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 541
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 543
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    .line 546
    :goto_2
    if-eqz v0, :cond_2

    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 547
    add-int/lit8 v0, v0, -0x1

    goto :goto_2
.end method

.method public static stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "str"
    .parameter "stripChars"

    .prologue
    .line 491
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .local v1, strLen:I
    if-nez v1, :cond_1

    .line 506
    .end local v1           #strLen:I
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 494
    .restart local v1       #strLen:I
    .restart local p0
    :cond_1
    const/4 v0, 0x0

    .line 495
    .local v0, start:I
    if-nez p1, :cond_4

    .line 496
    :goto_1
    if-eq v0, v1, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_3

    .line 506
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 497
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 499
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_0

    .line 502
    :goto_2
    if-eq v0, v1, :cond_2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_2

    .line 503
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public static stripToEmpty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 428
    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static stripToNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"

    .prologue
    const/4 v0, 0x0

    .line 398
    if-nez p0, :cond_0

    .line 402
    .end local p0
    :goto_0
    return-object v0

    .line 401
    .restart local p0
    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/StringUtils;->strip(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 402
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    move-object p0, v0

    .end local p0
    :cond_1
    move-object v0, p0

    goto :goto_0
.end method

.method public static substring(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "start"

    .prologue
    .line 1919
    if-nez p0, :cond_0

    .line 1920
    const/4 v0, 0x0

    .line 1935
    :goto_0
    return-object v0

    .line 1924
    :cond_0
    if-gez p1, :cond_1

    .line 1925
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p1, v0

    .line 1928
    :cond_1
    if-gez p1, :cond_2

    .line 1929
    const/4 p1, 0x0

    .line 1931
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p1, v0, :cond_3

    .line 1932
    const-string v0, ""

    goto :goto_0

    .line 1935
    :cond_3
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static substring(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 1974
    if-nez p0, :cond_0

    .line 1975
    const/4 v0, 0x0

    .line 2003
    :goto_0
    return-object v0

    .line 1979
    :cond_0
    if-gez p2, :cond_1

    .line 1980
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p2, v0

    .line 1982
    :cond_1
    if-gez p1, :cond_2

    .line 1983
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr p1, v0

    .line 1987
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p2, v0, :cond_3

    .line 1988
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 1992
    :cond_3
    if-le p1, p2, :cond_4

    .line 1993
    const-string v0, ""

    goto :goto_0

    .line 1996
    :cond_4
    if-gez p1, :cond_5

    .line 1997
    const/4 p1, 0x0

    .line 1999
    :cond_5
    if-gez p2, :cond_6

    .line 2000
    const/4 p2, 0x0

    .line 2003
    :cond_6
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static substringAfter(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2186
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2196
    .end local p0
    :goto_0
    return-object p0

    .line 2189
    .restart local p0
    :cond_0
    if-nez p1, :cond_1

    .line 2190
    const-string p0, ""

    goto :goto_0

    .line 2192
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2193
    .local v0, pos:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 2194
    const-string p0, ""

    goto :goto_0

    .line 2196
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringAfterLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2267
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2277
    .end local p0
    :goto_0
    return-object p0

    .line 2270
    .restart local p0
    :cond_0
    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2271
    const-string p0, ""

    goto :goto_0

    .line 2273
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2274
    .local v0, pos:I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_3

    .line 2275
    :cond_2
    const-string p0, ""

    goto :goto_0

    .line 2277
    :cond_3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBefore(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2144
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    if-nez p1, :cond_1

    .line 2154
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 2147
    .restart local p0
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2

    .line 2148
    const-string p0, ""

    goto :goto_0

    .line 2150
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 2151
    .local v0, pos:I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 2154
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBeforeLast(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "separator"

    .prologue
    .line 2227
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2234
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 2230
    .restart local p0
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 2231
    .local v0, pos:I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 2234
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static substringBetween(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "tag"

    .prologue
    .line 2304
    invoke-static {p0, p1, p1}, Lorg/apache/commons/lang3/StringUtils;->substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static substringBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "str"
    .parameter "open"
    .parameter "close"

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 2335
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 2345
    :cond_0
    :goto_0
    return-object v2

    .line 2338
    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 2339
    .local v1, start:I
    if-eq v1, v4, :cond_0

    .line 2340
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v3, v1

    invoke-virtual {p0, p2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    .line 2341
    .local v0, end:I
    if-eq v0, v4, :cond_0

    .line 2342
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static substringsBetween(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .parameter "str"
    .parameter "open"
    .parameter "close"

    .prologue
    const/4 v7, 0x0

    .line 2371
    if-eqz p0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-static {p2}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 2398
    :cond_0
    :goto_0
    return-object v7

    .line 2374
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 2375
    .local v6, strLen:I
    if-nez v6, :cond_2

    .line 2376
    sget-object v7, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    goto :goto_0

    .line 2378
    :cond_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    .line 2379
    .local v0, closeLen:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 2380
    .local v3, openLen:I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 2381
    .local v2, list:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 2382
    .local v4, pos:I
    :goto_1
    sub-int v8, v6, v0

    if-lt v4, v8, :cond_4

    .line 2395
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 2398
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    goto :goto_0

    .line 2383
    :cond_4
    invoke-virtual {p0, p1, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 2384
    .local v5, start:I
    if-ltz v5, :cond_3

    .line 2387
    add-int/2addr v5, v3

    .line 2388
    invoke-virtual {p0, p2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 2389
    .local v1, end:I
    if-ltz v1, :cond_3

    .line 2392
    invoke-virtual {p0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2393
    add-int v4, v1, v0

    goto :goto_1
.end method

.method public static swapCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "str"

    .prologue
    .line 5069
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, strLen:I
    if-nez v3, :cond_1

    .line 5086
    .end local v3           #strLen:I
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 5072
    .restart local v3       #strLen:I
    .restart local p0
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5074
    .local v0, buffer:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 5075
    .local v1, ch:C
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-lt v2, v3, :cond_2

    .line 5086
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 5076
    :cond_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 5077
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 5078
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    .line 5084
    :cond_3
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 5075
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 5079
    :cond_4
    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 5080
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    .line 5081
    goto :goto_2

    :cond_5
    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 5082
    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    goto :goto_2
.end method

.method public static trim(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 291
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static trimToEmpty(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 343
    if-nez p0, :cond_0

    const-string v0, ""

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static trimToNull(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"

    .prologue
    .line 317
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->trim(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 318
    .local v0, ts:Ljava/lang/String;
    invoke-static {v0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    .end local v0           #ts:Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public static uncapitalize(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .parameter "cs"

    .prologue
    .line 5027
    if-nez p0, :cond_0

    .line 5028
    const/4 v1, 0x0

    .line 5034
    :goto_0
    return-object v1

    .line 5031
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .local v0, strLen:I
    if-nez v0, :cond_1

    .line 5032
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 5034
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 5035
    const/4 v2, 0x0

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 5036
    const/4 v2, 0x1

    invoke-static {p0, v2}, Lorg/apache/commons/lang3/CharSequenceUtils;->subSequence(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 5037
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static upperCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 4892
    if-nez p0, :cond_0

    .line 4893
    const/4 v0, 0x0

    .line 4895
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static upperCase(Ljava/lang/String;Ljava/util/Locale;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "locale"

    .prologue
    .line 4915
    if-nez p0, :cond_0

    .line 4916
    const/4 v0, 0x0

    .line 4918
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
