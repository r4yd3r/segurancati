.class public Lorg/apache/commons/lang3/RandomStringUtils;
.super Ljava/lang/Object;
.source "RandomStringUtils.java"


# static fields
.field private static final RANDOM:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    return-void
.end method

.method public static random(I)Ljava/lang/String;
    .locals 1
    .parameter "count"

    .prologue
    const/4 v0, 0x0

    .line 72
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ)Ljava/lang/String;
    .locals 7
    .parameter "count"
    .parameter "start"
    .parameter "end"
    .parameter "letters"
    .parameter "numbers"

    .prologue
    .line 166
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ[C)Ljava/lang/String;
    .locals 7
    .parameter "count"
    .parameter "start"
    .parameter "end"
    .parameter "letters"
    .parameter "numbers"
    .parameter "chars"

    .prologue
    .line 190
    sget-object v6, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;
    .locals 8
    .parameter "count"
    .parameter "start"
    .parameter "end"
    .parameter "letters"
    .parameter "numbers"
    .parameter "chars"
    .parameter "random"

    .prologue
    const v7, 0xdc00

    const v6, 0xd800

    const/16 v5, 0x80

    .line 228
    if-nez p0, :cond_0

    .line 229
    const-string v4, ""

    .line 284
    :goto_0
    return-object v4

    .line 230
    :cond_0
    if-gez p0, :cond_1

    .line 231
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Requested random string length "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is less than 0."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 233
    :cond_1
    if-nez p1, :cond_2

    if-nez p2, :cond_2

    .line 234
    const/16 p2, 0x7b

    .line 235
    const/16 p1, 0x20

    .line 236
    if-nez p3, :cond_2

    if-nez p4, :cond_2

    .line 237
    const/4 p1, 0x0

    .line 238
    const p2, 0x7fffffff

    .line 242
    :cond_2
    new-array v0, p0, [C

    .line 243
    .local v0, buffer:[C
    sub-int v3, p2, p1

    .local v3, gap:I
    move v2, p0

    .line 245
    .end local p0
    .local v2, count:I
    :goto_1
    add-int/lit8 p0, v2, -0x1

    .end local v2           #count:I
    .restart local p0
    if-nez v2, :cond_3

    .line 284
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_0

    .line 247
    :cond_3
    if-nez p5, :cond_7

    .line 248
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, p1

    int-to-char v1, v4

    .line 252
    .local v1, ch:C
    :goto_2
    if-eqz p3, :cond_4

    invoke-static {v1}, Ljava/lang/Character;->isLetter(C)Z

    move-result v4

    if-nez v4, :cond_6

    .line 253
    :cond_4
    if-eqz p4, :cond_5

    invoke-static {v1}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_6

    .line 254
    :cond_5
    if-nez p3, :cond_d

    if-nez p4, :cond_d

    .line 256
    :cond_6
    if-lt v1, v7, :cond_9

    const v4, 0xdfff

    if-gt v1, v4, :cond_9

    .line 257
    if-nez p0, :cond_8

    .line 258
    add-int/lit8 p0, p0, 0x1

    move v2, p0

    .line 259
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .line 250
    .end local v1           #ch:C
    .end local v2           #count:I
    .restart local p0
    :cond_7
    invoke-virtual {p6, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, p1

    aget-char v1, p5, v4

    .restart local v1       #ch:C
    goto :goto_2

    .line 261
    :cond_8
    aput-char v1, v0, p0

    .line 262
    add-int/lit8 p0, p0, -0x1

    .line 263
    invoke-virtual {p6, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, v6

    int-to-char v4, v4

    aput-char v4, v0, p0

    move v2, p0

    .line 265
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .end local v2           #count:I
    .restart local p0
    :cond_9
    if-lt v1, v6, :cond_b

    const v4, 0xdb7f

    if-gt v1, v4, :cond_b

    .line 266
    if-nez p0, :cond_a

    .line 267
    add-int/lit8 p0, p0, 0x1

    move v2, p0

    .line 268
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .line 270
    .end local v2           #count:I
    .restart local p0
    :cond_a
    invoke-virtual {p6, v5}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    add-int/2addr v4, v7

    int-to-char v4, v4

    aput-char v4, v0, p0

    .line 271
    add-int/lit8 p0, p0, -0x1

    .line 272
    aput-char v1, v0, p0

    move v2, p0

    .line 274
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .end local v2           #count:I
    .restart local p0
    :cond_b
    const v4, 0xdb80

    if-lt v1, v4, :cond_c

    const v4, 0xdbff

    if-gt v1, v4, :cond_c

    .line 276
    add-int/lit8 p0, p0, 0x1

    move v2, p0

    .line 277
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .line 278
    .end local v2           #count:I
    .restart local p0
    :cond_c
    aput-char v1, v0, p0

    move v2, p0

    .line 280
    .end local p0
    .restart local v2       #count:I
    goto :goto_1

    .line 281
    .end local v2           #count:I
    .restart local p0
    :cond_d
    add-int/lit8 p0, p0, 0x1

    move v2, p0

    .end local p0
    .restart local v2       #count:I
    goto :goto_1
.end method

.method public static random(ILjava/lang/String;)Ljava/lang/String;
    .locals 7
    .parameter "count"
    .parameter "chars"

    .prologue
    const/4 v1, 0x0

    .line 301
    if-nez p1, :cond_0

    .line 302
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    .line 304
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/RandomStringUtils;->random(I[C)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static random(IZZ)Ljava/lang/String;
    .locals 1
    .parameter "count"
    .parameter "letters"
    .parameter "numbers"

    .prologue
    const/4 v0, 0x0

    .line 146
    invoke-static {p0, v0, v0, p1, p2}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static random(I[C)Ljava/lang/String;
    .locals 7
    .parameter "count"
    .parameter "chars"

    .prologue
    const/4 v1, 0x0

    .line 320
    if-nez p1, :cond_0

    .line 321
    const/4 v5, 0x0

    sget-object v6, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    .line 323
    :goto_0
    return-object v0

    :cond_0
    array-length v2, p1

    sget-object v6, Lorg/apache/commons/lang3/RandomStringUtils;->RANDOM:Ljava/util/Random;

    move v0, p0

    move v3, v1

    move v4, v1

    move-object v5, p1

    invoke-static/range {v0 .. v6}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ[CLjava/util/Random;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static randomAlphabetic(I)Ljava/lang/String;
    .locals 2
    .parameter "count"

    .prologue
    .line 100
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAlphanumeric(I)Ljava/lang/String;
    .locals 1
    .parameter "count"

    .prologue
    const/4 v0, 0x1

    .line 114
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomAscii(I)Ljava/lang/String;
    .locals 3
    .parameter "count"

    .prologue
    const/4 v2, 0x0

    .line 86
    const/16 v0, 0x20

    const/16 v1, 0x7f

    invoke-static {p0, v0, v1, v2, v2}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IIIZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static randomNumeric(I)Ljava/lang/String;
    .locals 2
    .parameter "count"

    .prologue
    .line 128
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/RandomStringUtils;->random(IZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
