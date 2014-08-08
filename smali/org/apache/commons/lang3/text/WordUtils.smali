.class public Lorg/apache/commons/lang3/text/WordUtils;
.super Ljava/lang/Object;
.source "WordUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method public static abbreviate(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .parameter "str"
    .parameter "lower"
    .parameter "upper"
    .parameter "appendToEnd"

    .prologue
    const/4 v4, -0x1

    const/4 v3, 0x0

    .line 536
    if-nez p0, :cond_0

    .line 537
    const/4 v2, 0x0

    .line 573
    :goto_0
    return-object v2

    .line 539
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    .line 540
    const-string v2, ""

    goto :goto_0

    .line 545
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-le p1, v2, :cond_2

    .line 546
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    .line 550
    :cond_2
    if-eq p2, v4, :cond_3

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-le p2, v2, :cond_4

    .line 551
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    .line 554
    :cond_4
    if-ge p2, p1, :cond_5

    .line 555
    move p2, p1

    .line 558
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 559
    .local v1, result:Ljava/lang/StringBuilder;
    const-string v2, " "

    invoke-static {p0, v2, p1}, Lorg/apache/commons/lang3/StringUtils;->indexOf(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 560
    .local v0, index:I
    if-ne v0, v4, :cond_7

    .line 561
    invoke-virtual {p0, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq p2, v2, :cond_6

    .line 564
    invoke-static {p3}, Lorg/apache/commons/lang3/StringUtils;->defaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    :cond_6
    :goto_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 566
    :cond_7
    if-le v0, p2, :cond_8

    .line 567
    invoke-virtual {p0, v3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    invoke-static {p3}, Lorg/apache/commons/lang3/StringUtils;->defaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 570
    :cond_8
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    invoke-static {p3}, Lorg/apache/commons/lang3/StringUtils;->defaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method public static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 172
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->capitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs capitalize(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 7
    .parameter "str"
    .parameter "delimiters"

    .prologue
    .line 205
    if-nez p1, :cond_1

    const/4 v3, -0x1

    .line 206
    .local v3, delimLen:I
    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_0

    if-nez v3, :cond_2

    .line 225
    .end local p0
    :cond_0
    :goto_1
    return-object p0

    .line 205
    .end local v3           #delimLen:I
    .restart local p0
    :cond_1
    array-length v3, p1

    goto :goto_0

    .line 209
    .restart local v3       #delimLen:I
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 210
    .local v5, strLen:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 211
    .local v0, buffer:Ljava/lang/StringBuilder;
    const/4 v1, 0x1

    .line 212
    .local v1, capitalizeNext:Z
    const/4 v4, 0x0

    .local v4, i:I
    :goto_2
    if-lt v4, v5, :cond_3

    .line 225
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 213
    :cond_3
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 215
    .local v2, ch:C
    invoke-static {v2, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 216
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 217
    const/4 v1, 0x1

    .line 212
    :goto_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 218
    :cond_4
    if-eqz v1, :cond_5

    .line 219
    invoke-static {v2}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 220
    const/4 v1, 0x0

    .line 221
    goto :goto_3

    .line 222
    :cond_5
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3
.end method

.method public static capitalizeFully(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 249
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->capitalizeFully(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs capitalizeFully(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "delimiters"

    .prologue
    .line 279
    if-nez p1, :cond_1

    const/4 v0, -0x1

    .line 280
    .local v0, delimLen:I
    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_0

    if-nez v0, :cond_2

    .line 284
    .end local p0
    :cond_0
    :goto_1
    return-object p0

    .line 279
    .end local v0           #delimLen:I
    .restart local p0
    :cond_1
    array-length v0, p1

    goto :goto_0

    .line 283
    .restart local v0       #delimLen:I
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 284
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/text/WordUtils;->capitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object p0

    goto :goto_1
.end method

.method public static initials(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 437
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->initials(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs initials(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "delimiters"

    .prologue
    .line 468
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 490
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 471
    .restart local p0
    :cond_1
    if-eqz p1, :cond_2

    array-length v7, p1

    if-nez v7, :cond_2

    .line 472
    const-string p0, ""

    goto :goto_0

    .line 474
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .line 475
    .local v6, strLen:I
    div-int/lit8 v7, v6, 0x2

    add-int/lit8 v7, v7, 0x1

    new-array v0, v7, [C

    .line 476
    .local v0, buf:[C
    const/4 v2, 0x0

    .line 477
    .local v2, count:I
    const/4 v5, 0x1

    .line 478
    .local v5, lastWasGap:Z
    const/4 v4, 0x0

    .local v4, i:I
    move v3, v2

    .end local v2           #count:I
    .local v3, count:I
    :goto_1
    if-lt v4, v6, :cond_3

    .line 490
    new-instance p0, Ljava/lang/String;

    .end local p0
    const/4 v7, 0x0

    invoke-direct {p0, v0, v7, v3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_0

    .line 479
    .restart local p0
    :cond_3
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 481
    .local v1, ch:C
    invoke-static {v1, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 482
    const/4 v5, 0x1

    move v2, v3

    .line 478
    .end local v3           #count:I
    .restart local v2       #count:I
    :goto_2
    add-int/lit8 v4, v4, 0x1

    move v3, v2

    .end local v2           #count:I
    .restart local v3       #count:I
    goto :goto_1

    .line 483
    :cond_4
    if-eqz v5, :cond_5

    .line 484
    add-int/lit8 v2, v3, 0x1

    .end local v3           #count:I
    .restart local v2       #count:I
    aput-char v1, v0, v3

    .line 485
    const/4 v5, 0x0

    goto :goto_2

    .end local v2           #count:I
    .restart local v3       #count:I
    :cond_5
    move v2, v3

    .end local v3           #count:I
    .restart local v2       #count:I
    goto :goto_2
.end method

.method private static isDelimiter(C[C)Z
    .locals 3
    .parameter "ch"
    .parameter "delimiters"

    .prologue
    .line 502
    if-nez p1, :cond_0

    .line 503
    invoke-static {p0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    .line 510
    :goto_0
    return v2

    .line 505
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    array-length v1, p1

    .local v1, isize:I
    :goto_1
    if-lt v0, v1, :cond_1

    .line 510
    const/4 v2, 0x0

    goto :goto_0

    .line 506
    :cond_1
    aget-char v2, p1, v0

    if-ne p0, v2, :cond_2

    .line 507
    const/4 v2, 0x1

    goto :goto_0

    .line 505
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static swapCase(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "str"

    .prologue
    .line 383
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .local v3, strLen:I
    if-nez v3, :cond_1

    .line 410
    .end local v3           #strLen:I
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 386
    .restart local v3       #strLen:I
    .restart local p0
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 388
    .local v0, buffer:Ljava/lang/StringBuilder;
    const/4 v5, 0x1

    .line 389
    .local v5, whitespace:Z
    const/4 v1, 0x0

    .line 390
    .local v1, ch:C
    const/4 v4, 0x0

    .line 392
    .local v4, tmp:C
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    if-lt v2, v3, :cond_2

    .line 410
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 393
    :cond_2
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 394
    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 395
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    .line 407
    :goto_2
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 408
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v5

    .line 392
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 396
    :cond_3
    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 397
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v4

    .line 398
    goto :goto_2

    :cond_4
    invoke-static {v1}, Ljava/lang/Character;->isLowerCase(C)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 399
    if-eqz v5, :cond_5

    .line 400
    invoke-static {v1}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v4

    .line 401
    goto :goto_2

    .line 402
    :cond_5
    invoke-static {v1}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v4

    .line 404
    goto :goto_2

    .line 405
    :cond_6
    move v4, v1

    goto :goto_2
.end method

.method public static uncapitalize(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"

    .prologue
    .line 306
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/text/WordUtils;->uncapitalize(Ljava/lang/String;[C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs uncapitalize(Ljava/lang/String;[C)Ljava/lang/String;
    .locals 7
    .parameter "str"
    .parameter "delimiters"

    .prologue
    .line 335
    if-nez p1, :cond_1

    const/4 v2, -0x1

    .line 336
    .local v2, delimLen:I
    :goto_0
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_0

    if-nez v2, :cond_2

    .line 355
    .end local p0
    :cond_0
    :goto_1
    return-object p0

    .line 335
    .end local v2           #delimLen:I
    .restart local p0
    :cond_1
    array-length v2, p1

    goto :goto_0

    .line 339
    .restart local v2       #delimLen:I
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 340
    .local v4, strLen:I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 341
    .local v0, buffer:Ljava/lang/StringBuilder;
    const/4 v5, 0x1

    .line 342
    .local v5, uncapitalizeNext:Z
    const/4 v3, 0x0

    .local v3, i:I
    :goto_2
    if-lt v3, v4, :cond_3

    .line 355
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 343
    :cond_3
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 345
    .local v1, ch:C
    invoke-static {v1, p1}, Lorg/apache/commons/lang3/text/WordUtils;->isDelimiter(C[C)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 346
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 347
    const/4 v5, 0x1

    .line 342
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 348
    :cond_4
    if-eqz v5, :cond_5

    .line 349
    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 350
    const/4 v5, 0x0

    .line 351
    goto :goto_3

    .line 352
    :cond_5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3
.end method

.method public static wrap(Ljava/lang/String;I)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "wrapLength"

    .prologue
    .line 71
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/text/WordUtils;->wrap(Ljava/lang/String;ILjava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static wrap(Ljava/lang/String;ILjava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .parameter "str"
    .parameter "wrapLength"
    .parameter "newLineStr"
    .parameter "wrapLongWords"

    .prologue
    const/16 v5, 0x20

    .line 93
    if-nez p0, :cond_0

    .line 94
    const/4 v4, 0x0

    .line 144
    :goto_0
    return-object v4

    .line 96
    :cond_0
    if-nez p2, :cond_1

    .line 97
    sget-object p2, Lorg/apache/commons/lang3/SystemUtils;->LINE_SEPARATOR:Ljava/lang/String;

    .line 99
    :cond_1
    const/4 v4, 0x1

    if-ge p1, v4, :cond_2

    .line 100
    const/4 p1, 0x1

    .line 102
    :cond_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 103
    .local v0, inputLineLength:I
    const/4 v1, 0x0

    .line 104
    .local v1, offset:I
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v0, 0x20

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 106
    .local v3, wrappedLine:Ljava/lang/StringBuilder;
    :goto_1
    sub-int v4, v0, v1

    if-gt v4, p1, :cond_3

    .line 142
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 107
    :cond_3
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_4

    .line 108
    add-int/lit8 v1, v1, 0x1

    .line 109
    goto :goto_1

    .line 111
    :cond_4
    add-int v4, p1, v1

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v2

    .line 113
    .local v2, spaceToWrapAt:I
    if-lt v2, v1, :cond_5

    .line 115
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    add-int/lit8 v1, v2, 0x1

    .line 119
    goto :goto_1

    .line 121
    :cond_5
    if-eqz p3, :cond_6

    .line 123
    add-int v4, p1, v1

    invoke-virtual {p0, v1, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    add-int/2addr v1, p1

    .line 126
    goto :goto_1

    .line 128
    :cond_6
    add-int v4, p1, v1

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    .line 129
    if-ltz v2, :cond_7

    .line 130
    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    add-int/lit8 v1, v2, 0x1

    .line 133
    goto :goto_1

    .line 134
    :cond_7
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    move v1, v0

    goto :goto_1
.end method
