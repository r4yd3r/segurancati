.class public final Lorg/apache/commons/lang3/math/Fraction;
.super Ljava/lang/Number;
.source "Fraction.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Number;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/apache/commons/lang3/math/Fraction;",
        ">;"
    }
.end annotation


# static fields
.field public static final FOUR_FIFTHS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ONE:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ONE_FIFTH:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ONE_HALF:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ONE_QUARTER:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ONE_THIRD:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final THREE_FIFTHS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final THREE_QUARTERS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final TWO_FIFTHS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final TWO_QUARTERS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final TWO_THIRDS:Lorg/apache/commons/lang3/math/Fraction; = null

.field public static final ZERO:Lorg/apache/commons/lang3/math/Fraction; = null

.field private static final serialVersionUID:J = 0x3b76f0847842L


# instance fields
.field private final denominator:I

.field private transient hashCode:I

.field private final numerator:I

.field private transient toProperString:Ljava/lang/String;

.field private transient toString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 48
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ZERO:Lorg/apache/commons/lang3/math/Fraction;

    .line 52
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v2, v2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ONE:Lorg/apache/commons/lang3/math/Fraction;

    .line 56
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v2, v3}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ONE_HALF:Lorg/apache/commons/lang3/math/Fraction;

    .line 60
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v2, v4}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ONE_THIRD:Lorg/apache/commons/lang3/math/Fraction;

    .line 64
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v3, v4}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->TWO_THIRDS:Lorg/apache/commons/lang3/math/Fraction;

    .line 68
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v2, v5}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ONE_QUARTER:Lorg/apache/commons/lang3/math/Fraction;

    .line 72
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v3, v5}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->TWO_QUARTERS:Lorg/apache/commons/lang3/math/Fraction;

    .line 76
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v4, v5}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->THREE_QUARTERS:Lorg/apache/commons/lang3/math/Fraction;

    .line 80
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v2, v6}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->ONE_FIFTH:Lorg/apache/commons/lang3/math/Fraction;

    .line 84
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v3, v6}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->TWO_FIFTHS:Lorg/apache/commons/lang3/math/Fraction;

    .line 88
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v4, v6}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->THREE_FIFTHS:Lorg/apache/commons/lang3/math/Fraction;

    .line 92
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, v5, v6}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    sput-object v0, Lorg/apache/commons/lang3/math/Fraction;->FOUR_FIFTHS:Lorg/apache/commons/lang3/math/Fraction;

    return-void
.end method

.method private constructor <init>(II)V
    .locals 2
    .parameter "numerator"
    .parameter "denominator"

    .prologue
    const/4 v1, 0x0

    .line 125
    invoke-direct {p0}, Ljava/lang/Number;-><init>()V

    .line 107
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/math/Fraction;->hashCode:I

    .line 111
    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toString:Ljava/lang/String;

    .line 115
    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    .line 126
    iput p1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    .line 127
    iput p2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    .line 128
    return-void
.end method

.method private static addAndCheck(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    .line 669
    int-to-long v2, p0

    int-to-long v4, p1

    add-long v0, v2, v4

    .line 670
    .local v0, s:J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 671
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 672
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: add"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 674
    :cond_1
    long-to-int v2, v0

    return v2
.end method

.method private addSub(Lorg/apache/commons/lang3/math/Fraction;Z)Lorg/apache/commons/lang3/math/Fraction;
    .locals 11
    .parameter "fraction"
    .parameter "isAdd"

    .prologue
    .line 734
    if-nez p1, :cond_0

    .line 735
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "The fraction must not be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 738
    :cond_0
    iget v7, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v7, :cond_2

    .line 739
    if-eqz p2, :cond_1

    .line 774
    .end local p1
    :goto_0
    return-object p1

    .line 739
    .restart local p1
    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/math/Fraction;->negate()Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p1

    goto :goto_0

    .line 741
    :cond_2
    iget v7, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v7, :cond_3

    move-object p1, p0

    .line 742
    goto :goto_0

    .line 746
    :cond_3
    iget v7, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    iget v8, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v7, v8}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 747
    .local v0, d1:I
    const/4 v7, 0x1

    if-ne v0, v7, :cond_5

    .line 749
    iget v7, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v8, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v7, v8}, Lorg/apache/commons/lang3/math/Fraction;->mulAndCheck(II)I

    move-result v5

    .line 750
    .local v5, uvp:I
    iget v7, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v8, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v7, v8}, Lorg/apache/commons/lang3/math/Fraction;->mulAndCheck(II)I

    move-result v4

    .line 751
    .local v4, upv:I
    new-instance v8, Lorg/apache/commons/lang3/math/Fraction;

    .line 752
    if-eqz p2, :cond_4

    invoke-static {v5, v4}, Lorg/apache/commons/lang3/math/Fraction;->addAndCheck(II)I

    move-result v7

    .line 753
    :goto_1
    iget v9, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    iget v10, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v9, v10}, Lorg/apache/commons/lang3/math/Fraction;->mulPosAndCheck(II)I

    move-result v9

    .line 751
    invoke-direct {v8, v7, v9}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    move-object p1, v8

    goto :goto_0

    .line 752
    :cond_4
    invoke-static {v5, v4}, Lorg/apache/commons/lang3/math/Fraction;->subAndCheck(II)I

    move-result v7

    goto :goto_1

    .line 758
    .end local v4           #upv:I
    .end local v5           #uvp:I
    :cond_5
    iget v7, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-long v7, v7

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    .line 759
    iget v8, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v8, v0

    int-to-long v8, v8

    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v5

    .line 760
    .local v5, uvp:Ljava/math/BigInteger;
    iget v7, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-long v7, v7

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    .line 761
    iget v8, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v8, v0

    int-to-long v8, v8

    invoke-static {v8, v9}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v4

    .line 762
    .local v4, upv:Ljava/math/BigInteger;
    if-eqz p2, :cond_6

    invoke-virtual {v5, v4}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 765
    .local v2, t:Ljava/math/BigInteger;
    :goto_2
    int-to-long v7, v0

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/math/BigInteger;->mod(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigInteger;->intValue()I

    move-result v3

    .line 766
    .local v3, tmodd1:I
    if-nez v3, :cond_7

    move v1, v0

    .line 769
    .local v1, d2:I
    :goto_3
    int-to-long v7, v1

    invoke-static {v7, v8}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/math/BigInteger;->divide(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v6

    .line 770
    .local v6, w:Ljava/math/BigInteger;
    invoke-virtual {v6}, Ljava/math/BigInteger;->bitLength()I

    move-result v7

    const/16 v8, 0x1f

    if-le v7, v8, :cond_8

    .line 771
    new-instance v7, Ljava/lang/ArithmeticException;

    .line 772
    const-string v8, "overflow: numerator too large after multiply"

    .line 771
    invoke-direct {v7, v8}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 762
    .end local v1           #d2:I
    .end local v2           #t:Ljava/math/BigInteger;
    .end local v3           #tmodd1:I
    .end local v6           #w:Ljava/math/BigInteger;
    :cond_6
    invoke-virtual {v5, v4}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    goto :goto_2

    .line 766
    .restart local v2       #t:Ljava/math/BigInteger;
    .restart local v3       #tmodd1:I
    :cond_7
    invoke-static {v3, v0}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v1

    goto :goto_3

    .line 774
    .restart local v1       #d2:I
    .restart local v6       #w:Ljava/math/BigInteger;
    :cond_8
    new-instance v7, Lorg/apache/commons/lang3/math/Fraction;

    .line 775
    invoke-virtual {v6}, Ljava/math/BigInteger;->intValue()I

    move-result v8

    .line 776
    iget v9, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v9, v0

    iget v10, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v10, v1

    invoke-static {v9, v10}, Lorg/apache/commons/lang3/math/Fraction;->mulPosAndCheck(II)I

    move-result v9

    .line 774
    invoke-direct {v7, v8, v9}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    move-object p1, v7

    goto/16 :goto_0
.end method

.method public static getFraction(D)Lorg/apache/commons/lang3/math/Fraction;
    .locals 31
    .parameter "value"

    .prologue
    .line 250
    const-wide/16 v27, 0x0

    cmpg-double v27, p0, v27

    if-gez v27, :cond_1

    const/16 v17, -0x1

    .line 251
    .local v17, sign:I
    :goto_0
    invoke-static/range {p0 .. p1}, Ljava/lang/Math;->abs(D)D

    move-result-wide p0

    .line 252
    const-wide v27, 0x41dfffffffc00000L

    cmpl-double v27, p0, v27

    if-gtz v27, :cond_0

    invoke-static/range {p0 .. p1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v27

    if-eqz v27, :cond_2

    .line 253
    :cond_0
    new-instance v27, Ljava/lang/ArithmeticException;

    .line 254
    const-string v28, "The value must not be greater than Integer.MAX_VALUE or NaN"

    .line 253
    invoke-direct/range {v27 .. v28}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 250
    .end local v17           #sign:I
    :cond_1
    const/16 v17, 0x1

    goto :goto_0

    .line 256
    .restart local v17       #sign:I
    :cond_2
    move-wide/from16 v0, p0

    double-to-int v0, v0

    move/from16 v18, v0

    .line 257
    .local v18, wholeNumber:I
    move/from16 v0, v18

    int-to-double v0, v0

    move-wide/from16 v27, v0

    sub-double p0, p0, v27

    .line 259
    const/4 v14, 0x0

    .line 260
    .local v14, numer0:I
    const/4 v8, 0x1

    .line 261
    .local v8, denom0:I
    const/4 v15, 0x1

    .line 262
    .local v15, numer1:I
    const/4 v9, 0x0

    .line 263
    .local v9, denom1:I
    const/16 v16, 0x0

    .line 264
    .local v16, numer2:I
    const/4 v10, 0x0

    .line 265
    .local v10, denom2:I
    move-wide/from16 v0, p0

    double-to-int v2, v0

    .line 266
    .local v2, a1:I
    const/4 v3, 0x0

    .line 267
    .local v3, a2:I
    const-wide/high16 v19, 0x3ff0

    .line 268
    .local v19, x1:D
    const-wide/16 v21, 0x0

    .line 269
    .local v21, x2:D
    int-to-double v0, v2

    move-wide/from16 v27, v0

    sub-double v23, p0, v27

    .line 270
    .local v23, y1:D
    const-wide/16 v25, 0x0

    .line 271
    .local v25, y2:D
    const-wide v6, 0x7fefffffffffffffL

    .line 273
    .local v6, delta2:D
    const/4 v13, 0x1

    .line 276
    .local v13, i:I
    :cond_3
    move-wide v4, v6

    .line 277
    .local v4, delta1:D
    div-double v27, v19, v23

    move-wide/from16 v0, v27

    double-to-int v3, v0

    .line 278
    move-wide/from16 v21, v23

    .line 279
    int-to-double v0, v3

    move-wide/from16 v27, v0

    mul-double v27, v27, v23

    sub-double v25, v19, v27

    .line 280
    mul-int v27, v2, v15

    add-int v16, v27, v14

    .line 281
    mul-int v27, v2, v9

    add-int v10, v27, v8

    .line 282
    move/from16 v0, v16

    int-to-double v0, v0

    move-wide/from16 v27, v0

    int-to-double v0, v10

    move-wide/from16 v29, v0

    div-double v11, v27, v29

    .line 283
    .local v11, fraction:D
    sub-double v27, p0, v11

    invoke-static/range {v27 .. v28}, Ljava/lang/Math;->abs(D)D

    move-result-wide v6

    .line 285
    move v2, v3

    .line 286
    move-wide/from16 v19, v21

    .line 287
    move-wide/from16 v23, v25

    .line 288
    move v14, v15

    .line 289
    move v8, v9

    .line 290
    move/from16 v15, v16

    .line 291
    move v9, v10

    .line 292
    add-int/lit8 v13, v13, 0x1

    .line 294
    cmpl-double v27, v4, v6

    if-lez v27, :cond_4

    const/16 v27, 0x2710

    move/from16 v0, v27

    if-gt v10, v0, :cond_4

    if-lez v10, :cond_4

    const/16 v27, 0x19

    .line 275
    move/from16 v0, v27

    if-lt v13, v0, :cond_3

    .line 295
    :cond_4
    const/16 v27, 0x19

    move/from16 v0, v27

    if-ne v13, v0, :cond_5

    .line 296
    new-instance v27, Ljava/lang/ArithmeticException;

    const-string v28, "Unable to convert double to fraction"

    invoke-direct/range {v27 .. v28}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v27

    .line 298
    :cond_5
    mul-int v27, v18, v8

    add-int v27, v27, v14

    mul-int v27, v27, v17

    move/from16 v0, v27

    invoke-static {v0, v8}, Lorg/apache/commons/lang3/math/Fraction;->getReducedFraction(II)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v27

    return-object v27
.end method

.method public static getFraction(II)Lorg/apache/commons/lang3/math/Fraction;
    .locals 2
    .parameter "numerator"
    .parameter "denominator"

    .prologue
    const/high16 v0, -0x8000

    .line 142
    if-nez p1, :cond_0

    .line 143
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The denominator must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 145
    :cond_0
    if-gez p1, :cond_3

    .line 146
    if-eq p0, v0, :cond_1

    .line 147
    if-ne p1, v0, :cond_2

    .line 148
    :cond_1
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: can\'t negate"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 150
    :cond_2
    neg-int p0, p0

    .line 151
    neg-int p1, p1

    .line 153
    :cond_3
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    return-object v0
.end method

.method public static getFraction(III)Lorg/apache/commons/lang3/math/Fraction;
    .locals 6
    .parameter "whole"
    .parameter "numerator"
    .parameter "denominator"

    .prologue
    .line 173
    if-nez p2, :cond_0

    .line 174
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "The denominator must not be zero"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 176
    :cond_0
    if-gez p2, :cond_1

    .line 177
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "The denominator must not be negative"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 179
    :cond_1
    if-gez p1, :cond_2

    .line 180
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "The numerator must not be negative"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 183
    :cond_2
    if-gez p0, :cond_4

    .line 184
    int-to-long v2, p0

    int-to-long v4, p2

    mul-long/2addr v2, v4

    int-to-long v4, p1

    sub-long v0, v2, v4

    .line 188
    .local v0, numeratorValue:J
    :goto_0
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_3

    .line 189
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_5

    .line 190
    :cond_3
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "Numerator too large to represent as an Integer."

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 186
    .end local v0           #numeratorValue:J
    :cond_4
    int-to-long v2, p0

    int-to-long v4, p2

    mul-long/2addr v2, v4

    int-to-long v4, p1

    add-long v0, v2, v4

    .restart local v0       #numeratorValue:J
    goto :goto_0

    .line 192
    :cond_5
    new-instance v2, Lorg/apache/commons/lang3/math/Fraction;

    long-to-int v3, v0

    invoke-direct {v2, v3, p2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    return-object v2
.end method

.method public static getFraction(Ljava/lang/String;)Lorg/apache/commons/lang3/math/Fraction;
    .locals 7
    .parameter "str"

    .prologue
    const/16 v6, 0x2f

    const/4 v5, 0x0

    .line 320
    if-nez p0, :cond_0

    .line 321
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The string must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 324
    :cond_0
    const/16 v4, 0x2e

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 325
    .local v2, pos:I
    if-ltz v2, :cond_1

    .line 326
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Lorg/apache/commons/lang3/math/Fraction;->getFraction(D)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v4

    .line 352
    :goto_0
    return-object v4

    .line 330
    :cond_1
    const/16 v4, 0x20

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 331
    if-lez v2, :cond_3

    .line 332
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 333
    .local v3, whole:I
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 334
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 335
    if-gez v2, :cond_2

    .line 336
    new-instance v4, Ljava/lang/NumberFormatException;

    const-string v5, "The fraction could not be parsed as the format X Y/Z"

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 338
    :cond_2
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 339
    .local v1, numer:I
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 340
    .local v0, denom:I
    invoke-static {v3, v1, v0}, Lorg/apache/commons/lang3/math/Fraction;->getFraction(III)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v4

    goto :goto_0

    .line 345
    .end local v0           #denom:I
    .end local v1           #numer:I
    .end local v3           #whole:I
    :cond_3
    invoke-virtual {p0, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 346
    if-gez v2, :cond_4

    .line 348
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lorg/apache/commons/lang3/math/Fraction;->getFraction(II)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v4

    goto :goto_0

    .line 350
    :cond_4
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 351
    .restart local v1       #numer:I
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 352
    .restart local v0       #denom:I
    invoke-static {v1, v0}, Lorg/apache/commons/lang3/math/Fraction;->getFraction(II)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v4

    goto :goto_0
.end method

.method public static getReducedFraction(II)Lorg/apache/commons/lang3/math/Fraction;
    .locals 3
    .parameter "numerator"
    .parameter "denominator"

    .prologue
    const/high16 v2, -0x8000

    .line 210
    if-nez p1, :cond_0

    .line 211
    new-instance v1, Ljava/lang/ArithmeticException;

    const-string v2, "The denominator must not be zero"

    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 213
    :cond_0
    if-nez p0, :cond_1

    .line 214
    sget-object v1, Lorg/apache/commons/lang3/math/Fraction;->ZERO:Lorg/apache/commons/lang3/math/Fraction;

    .line 232
    :goto_0
    return-object v1

    .line 217
    :cond_1
    if-ne p1, v2, :cond_2

    and-int/lit8 v1, p0, 0x1

    if-nez v1, :cond_2

    .line 218
    div-int/lit8 p0, p0, 0x2

    div-int/lit8 p1, p1, 0x2

    .line 220
    :cond_2
    if-gez p1, :cond_5

    .line 221
    if-eq p0, v2, :cond_3

    .line 222
    if-ne p1, v2, :cond_4

    .line 223
    :cond_3
    new-instance v1, Ljava/lang/ArithmeticException;

    const-string v2, "overflow: can\'t negate"

    invoke-direct {v1, v2}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 225
    :cond_4
    neg-int p0, p0

    .line 226
    neg-int p1, p1

    .line 229
    :cond_5
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 230
    .local v0, gcd:I
    div-int/2addr p0, v0

    .line 231
    div-int/2addr p1, v0

    .line 232
    new-instance v1, Lorg/apache/commons/lang3/math/Fraction;

    invoke-direct {v1, p0, p1}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    goto :goto_0
.end method

.method private static greatestCommonDivisor(II)I
    .locals 5
    .parameter "u"
    .parameter "v"

    .prologue
    const/16 v4, 0x1f

    const/4 v2, 0x1

    .line 578
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-le v3, v2, :cond_0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-gt v3, v2, :cond_1

    .line 617
    :cond_0
    :goto_0
    return v2

    .line 585
    :cond_1
    if-lez p0, :cond_2

    neg-int p0, p0

    .line 586
    :cond_2
    if-lez p1, :cond_3

    neg-int p1, p1

    .line 588
    :cond_3
    const/4 v0, 0x0

    .line 589
    .local v0, k:I
    :goto_1
    and-int/lit8 v3, p0, 0x1

    if-nez v3, :cond_4

    and-int/lit8 v3, p1, 0x1

    if-nez v3, :cond_4

    if-lt v0, v4, :cond_5

    .line 592
    :cond_4
    if-ne v0, v4, :cond_6

    .line 593
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: gcd is 2^31"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 590
    :cond_5
    div-int/lit8 p0, p0, 0x2

    div-int/lit8 p1, p1, 0x2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 597
    :cond_6
    and-int/lit8 v3, p0, 0x1

    if-ne v3, v2, :cond_8

    move v1, p1

    .line 603
    .local v1, t:I
    :cond_7
    :goto_2
    and-int/lit8 v3, v1, 0x1

    if-eqz v3, :cond_9

    .line 607
    if-lez v1, :cond_a

    .line 608
    neg-int p0, v1

    .line 613
    :goto_3
    sub-int v3, p1, p0

    div-int/lit8 v1, v3, 0x2

    .line 616
    if-nez v1, :cond_7

    .line 617
    neg-int v3, p0

    shl-int/2addr v2, v0

    mul-int/2addr v2, v3

    goto :goto_0

    .line 597
    .end local v1           #t:I
    :cond_8
    div-int/lit8 v3, p0, 0x2

    neg-int v1, v3

    goto :goto_2

    .line 604
    .restart local v1       #t:I
    :cond_9
    div-int/lit8 v1, v1, 0x2

    goto :goto_2

    .line 610
    :cond_a
    move p1, v1

    goto :goto_3
.end method

.method private static mulAndCheck(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    .line 633
    int-to-long v2, p0

    int-to-long v4, p1

    mul-long v0, v2, v4

    .line 634
    .local v0, m:J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 635
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 636
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: mul"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 638
    :cond_1
    long-to-int v2, v0

    return v2
.end method

.method private static mulPosAndCheck(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    .line 652
    int-to-long v2, p0

    int-to-long v4, p1

    mul-long v0, v2, v4

    .line 653
    .local v0, m:J
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    .line 654
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: mulPos"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 656
    :cond_0
    long-to-int v2, v0

    return v2
.end method

.method private static subAndCheck(II)I
    .locals 6
    .parameter "x"
    .parameter "y"

    .prologue
    .line 687
    int-to-long v2, p0

    int-to-long v4, p1

    sub-long v0, v2, v4

    .line 688
    .local v0, s:J
    const-wide/32 v2, -0x80000000

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 689
    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 690
    :cond_0
    new-instance v2, Ljava/lang/ArithmeticException;

    const-string v3, "overflow: add"

    invoke-direct {v2, v3}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 692
    :cond_1
    long-to-int v2, v0

    return v2
.end method


# virtual methods
.method public abs()Lorg/apache/commons/lang3/math/Fraction;
    .locals 1

    .prologue
    .line 528
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-ltz v0, :cond_0

    .line 531
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->negate()Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0
.end method

.method public add(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;
    .locals 1
    .parameter "fraction"

    .prologue
    .line 706
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang3/math/Fraction;->addSub(Lorg/apache/commons/lang3/math/Fraction;Z)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, Lorg/apache/commons/lang3/math/Fraction;

    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/math/Fraction;->compareTo(Lorg/apache/commons/lang3/math/Fraction;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/apache/commons/lang3/math/Fraction;)I
    .locals 9
    .parameter "other"

    .prologue
    const/4 v4, 0x0

    .line 876
    if-ne p0, p1, :cond_1

    .line 891
    :cond_0
    :goto_0
    return v4

    .line 879
    :cond_1
    iget v5, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v6, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-ne v5, v6, :cond_2

    iget v5, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    iget v6, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    if-eq v5, v6, :cond_0

    .line 884
    :cond_2
    iget v5, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-long v5, v5

    iget v7, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    int-to-long v7, v7

    mul-long v0, v5, v7

    .line 885
    .local v0, first:J
    iget v5, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-long v5, v5

    iget v7, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    int-to-long v7, v7

    mul-long v2, v5, v7

    .line 886
    .local v2, second:J
    cmp-long v5, v0, v2

    if-eqz v5, :cond_0

    .line 888
    cmp-long v4, v0, v2

    if-gez v4, :cond_3

    .line 889
    const/4 v4, -0x1

    goto :goto_0

    .line 891
    :cond_3
    const/4 v4, 0x1

    goto :goto_0
.end method

.method public divideBy(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;
    .locals 2
    .parameter "fraction"

    .prologue
    .line 816
    if-nez p1, :cond_0

    .line 817
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The fraction must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 819
    :cond_0
    iget v0, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v0, :cond_1

    .line 820
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "The fraction to divide by must not be zero"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 822
    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/lang3/math/Fraction;->invert()Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/math/Fraction;->multiplyBy(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public doubleValue()D
    .locals 4

    .prologue
    .line 454
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-double v0, v0

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    int-to-double v2, v2

    div-double/2addr v0, v2

    return-wide v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 838
    if-ne p1, p0, :cond_1

    .line 845
    :cond_0
    :goto_0
    return v1

    .line 841
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang3/math/Fraction;

    if-nez v3, :cond_2

    move v1, v2

    .line 842
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 844
    check-cast v0, Lorg/apache/commons/lang3/math/Fraction;

    .line 845
    .local v0, other:Lorg/apache/commons/lang3/math/Fraction;
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getNumerator()I

    move-result v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/math/Fraction;->getNumerator()I

    move-result v4

    if-ne v3, v4, :cond_3

    .line 846
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v4

    if-eq v3, v4, :cond_0

    :cond_3
    move v1, v2

    .line 845
    goto :goto_0
.end method

.method public floatValue()F
    .locals 2

    .prologue
    .line 443
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-float v0, v0

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public getDenominator()I
    .locals 1

    .prologue
    .line 377
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    return v0
.end method

.method public getNumerator()I
    .locals 1

    .prologue
    .line 368
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    return v0
.end method

.method public getProperNumerator()I
    .locals 2

    .prologue
    .line 392
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    rem-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    return v0
.end method

.method public getProperWhole()I
    .locals 2

    .prologue
    .line 407
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v0, v1

    return v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 856
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->hashCode:I

    if-nez v0, :cond_0

    .line 858
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getNumerator()I

    move-result v0

    add-int/lit16 v0, v0, 0x275

    mul-int/lit8 v0, v0, 0x25

    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lorg/apache/commons/lang3/math/Fraction;->hashCode:I

    .line 860
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->hashCode:I

    return v0
.end method

.method public intValue()I
    .locals 2

    .prologue
    .line 421
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v0, v1

    return v0
.end method

.method public invert()Lorg/apache/commons/lang3/math/Fraction;
    .locals 3

    .prologue
    .line 490
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v0, :cond_0

    .line 491
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Unable to invert zero."

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 493
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    const/high16 v1, -0x8000

    if-ne v0, v1, :cond_1

    .line 494
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: can\'t negate numerator"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 496
    :cond_1
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-gez v0, :cond_2

    .line 497
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    neg-int v1, v1

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    neg-int v2, v2

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    .line 499
    :goto_0
    return-object v0

    :cond_2
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    goto :goto_0
.end method

.method public longValue()J
    .locals 4

    .prologue
    .line 432
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    int-to-long v0, v0

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    int-to-long v2, v2

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public multiplyBy(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;
    .locals 5
    .parameter "fraction"

    .prologue
    .line 790
    if-nez p1, :cond_0

    .line 791
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The fraction must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 793
    :cond_0
    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-eqz v2, :cond_1

    iget v2, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v2, :cond_2

    .line 794
    :cond_1
    sget-object v2, Lorg/apache/commons/lang3/math/Fraction;->ZERO:Lorg/apache/commons/lang3/math/Fraction;

    .line 800
    :goto_0
    return-object v2

    .line 798
    :cond_2
    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v3, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 799
    .local v0, d1:I
    iget v2, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v3, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v1

    .line 801
    .local v1, d2:I
    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    div-int/2addr v2, v0

    iget v3, p1, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    div-int/2addr v3, v1

    invoke-static {v2, v3}, Lorg/apache/commons/lang3/math/Fraction;->mulAndCheck(II)I

    move-result v2

    .line 802
    iget v3, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v3, v1

    iget v4, p1, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v4, v0

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/math/Fraction;->mulPosAndCheck(II)I

    move-result v3

    .line 800
    invoke-static {v2, v3}, Lorg/apache/commons/lang3/math/Fraction;->getReducedFraction(II)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v2

    goto :goto_0
.end method

.method public negate()Lorg/apache/commons/lang3/math/Fraction;
    .locals 3

    .prologue
    .line 512
    iget v0, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    const/high16 v1, -0x8000

    if-ne v0, v1, :cond_0

    .line 513
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "overflow: too large to negate"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 515
    :cond_0
    new-instance v0, Lorg/apache/commons/lang3/math/Fraction;

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    neg-int v1, v1

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/math/Fraction;-><init>(II)V

    return-object v0
.end method

.method public pow(I)Lorg/apache/commons/lang3/math/Fraction;
    .locals 3
    .parameter "power"

    .prologue
    .line 547
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 561
    .end local p0
    :goto_0
    return-object p0

    .line 549
    .restart local p0
    :cond_0
    if-nez p1, :cond_1

    .line 550
    sget-object p0, Lorg/apache/commons/lang3/math/Fraction;->ONE:Lorg/apache/commons/lang3/math/Fraction;

    goto :goto_0

    .line 551
    :cond_1
    if-gez p1, :cond_3

    .line 552
    const/high16 v1, -0x8000

    if-ne p1, v1, :cond_2

    .line 553
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->invert()Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lorg/apache/commons/lang3/math/Fraction;->pow(I)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v1

    div-int/lit8 v2, p1, 0x2

    neg-int v2, v2

    invoke-virtual {v1, v2}, Lorg/apache/commons/lang3/math/Fraction;->pow(I)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0

    .line 555
    :cond_2
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->invert()Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v1

    neg-int v2, p1

    invoke-virtual {v1, v2}, Lorg/apache/commons/lang3/math/Fraction;->pow(I)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0

    .line 557
    :cond_3
    invoke-virtual {p0, p0}, Lorg/apache/commons/lang3/math/Fraction;->multiplyBy(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v0

    .line 558
    .local v0, f:Lorg/apache/commons/lang3/math/Fraction;
    rem-int/lit8 v1, p1, 0x2

    if-nez v1, :cond_4

    .line 559
    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/math/Fraction;->pow(I)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0

    .line 561
    :cond_4
    div-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/math/Fraction;->pow(I)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v1

    invoke-virtual {v1, p0}, Lorg/apache/commons/lang3/math/Fraction;->multiplyBy(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0
.end method

.method public reduce()Lorg/apache/commons/lang3/math/Fraction;
    .locals 3

    .prologue
    .line 470
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v1, :cond_2

    .line 471
    sget-object v1, Lorg/apache/commons/lang3/math/Fraction;->ZERO:Lorg/apache/commons/lang3/math/Fraction;

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/math/Fraction;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 477
    .end local p0
    .local v0, gcd:I
    :cond_0
    :goto_0
    return-object p0

    .line 471
    .end local v0           #gcd:I
    .restart local p0
    :cond_1
    sget-object p0, Lorg/apache/commons/lang3/math/Fraction;->ZERO:Lorg/apache/commons/lang3/math/Fraction;

    goto :goto_0

    .line 473
    :cond_2
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    invoke-static {v1, v2}, Lorg/apache/commons/lang3/math/Fraction;->greatestCommonDivisor(II)I

    move-result v0

    .line 474
    .restart local v0       #gcd:I
    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 477
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    div-int/2addr v1, v0

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    div-int/2addr v2, v0

    invoke-static {v1, v2}, Lorg/apache/commons/lang3/math/Fraction;->getFraction(II)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object p0

    goto :goto_0
.end method

.method public subtract(Lorg/apache/commons/lang3/math/Fraction;)Lorg/apache/commons/lang3/math/Fraction;
    .locals 1
    .parameter "fraction"

    .prologue
    .line 720
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/lang3/math/Fraction;->addSub(Lorg/apache/commons/lang3/math/Fraction;Z)Lorg/apache/commons/lang3/math/Fraction;

    move-result-object v0

    return-object v0
.end method

.method public toProperString()Ljava/lang/String;
    .locals 5

    .prologue
    const/16 v4, 0x2f

    const/16 v3, 0x20

    .line 923
    iget-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 924
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-nez v1, :cond_1

    .line 925
    const-string v1, "0"

    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    .line 950
    :cond_0
    :goto_0
    iget-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    return-object v1

    .line 926
    :cond_1
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    if-ne v1, v2, :cond_2

    .line 927
    const-string v1, "1"

    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_0

    .line 928
    :cond_2
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    mul-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_3

    .line 929
    const-string v1, "-1"

    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_0

    .line 930
    :cond_3
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    if-lez v1, :cond_4

    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    neg-int v1, v1

    :goto_1
    iget v2, p0, Lorg/apache/commons/lang3/math/Fraction;->denominator:I

    neg-int v2, v2

    if-ge v1, v2, :cond_6

    .line 935
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getProperNumerator()I

    move-result v0

    .line 936
    .local v0, properNumerator:I
    if-nez v0, :cond_5

    .line 937
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getProperWhole()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_0

    .line 930
    .end local v0           #properNumerator:I
    :cond_4
    iget v1, p0, Lorg/apache/commons/lang3/math/Fraction;->numerator:I

    goto :goto_1

    .line 939
    .restart local v0       #properNumerator:I
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 940
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getProperWhole()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 941
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 942
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 939
    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    goto :goto_0

    .line 945
    .end local v0           #properNumerator:I
    :cond_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 946
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getNumerator()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 947
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 945
    iput-object v1, p0, Lorg/apache/commons/lang3/math/Fraction;->toProperString:Ljava/lang/String;

    goto/16 :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 904
    iget-object v0, p0, Lorg/apache/commons/lang3/math/Fraction;->toString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 905
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 906
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getNumerator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 907
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 908
    invoke-virtual {p0}, Lorg/apache/commons/lang3/math/Fraction;->getDenominator()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 905
    iput-object v0, p0, Lorg/apache/commons/lang3/math/Fraction;->toString:Ljava/lang/String;

    .line 910
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/math/Fraction;->toString:Ljava/lang/String;

    return-object v0
.end method
