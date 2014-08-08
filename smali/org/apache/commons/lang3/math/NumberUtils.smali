.class public Lorg/apache/commons/lang3/math/NumberUtils;
.super Ljava/lang/Object;
.source "NumberUtils.java"


# static fields
.field public static final BYTE_MINUS_ONE:Ljava/lang/Byte;

.field public static final BYTE_ONE:Ljava/lang/Byte;

.field public static final BYTE_ZERO:Ljava/lang/Byte;

.field public static final DOUBLE_MINUS_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ONE:Ljava/lang/Double;

.field public static final DOUBLE_ZERO:Ljava/lang/Double;

.field public static final FLOAT_MINUS_ONE:Ljava/lang/Float;

.field public static final FLOAT_ONE:Ljava/lang/Float;

.field public static final FLOAT_ZERO:Ljava/lang/Float;

.field public static final INTEGER_MINUS_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ONE:Ljava/lang/Integer;

.field public static final INTEGER_ZERO:Ljava/lang/Integer;

.field public static final LONG_MINUS_ONE:Ljava/lang/Long;

.field public static final LONG_ONE:Ljava/lang/Long;

.field public static final LONG_ZERO:Ljava/lang/Long;

.field public static final SHORT_MINUS_ONE:Ljava/lang/Short;

.field public static final SHORT_ONE:Ljava/lang/Short;

.field public static final SHORT_ZERO:Ljava/lang/Short;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 41
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ZERO:Ljava/lang/Long;

    .line 43
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_ONE:Ljava/lang/Long;

    .line 45
    new-instance v0, Ljava/lang/Long;

    const-wide/16 v1, -0x1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->LONG_MINUS_ONE:Ljava/lang/Long;

    .line 47
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v4}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    .line 49
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v5}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    .line 51
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, v3}, Ljava/lang/Integer;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_MINUS_ONE:Ljava/lang/Integer;

    .line 53
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v4}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ZERO:Ljava/lang/Short;

    .line 55
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v5}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_ONE:Ljava/lang/Short;

    .line 57
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, v3}, Ljava/lang/Short;-><init>(S)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->SHORT_MINUS_ONE:Ljava/lang/Short;

    .line 59
    invoke-static {v4}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ZERO:Ljava/lang/Byte;

    .line 61
    invoke-static {v5}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_ONE:Ljava/lang/Byte;

    .line 63
    invoke-static {v3}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->BYTE_MINUS_ONE:Ljava/lang/Byte;

    .line 65
    new-instance v0, Ljava/lang/Double;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ZERO:Ljava/lang/Double;

    .line 67
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, 0x3ff0

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_ONE:Ljava/lang/Double;

    .line 69
    new-instance v0, Ljava/lang/Double;

    const-wide/high16 v1, -0x4010

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->DOUBLE_MINUS_ONE:Ljava/lang/Double;

    .line 71
    new-instance v0, Ljava/lang/Float;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ZERO:Ljava/lang/Float;

    .line 73
    new-instance v0, Ljava/lang/Float;

    const/high16 v1, 0x3f80

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_ONE:Ljava/lang/Float;

    .line 75
    new-instance v0, Ljava/lang/Float;

    const/high16 v1, -0x4080

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    sput-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->FLOAT_MINUS_ONE:Ljava/lang/Float;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method public static createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 2
    .parameter "str"

    .prologue
    .line 714
    if-nez p0, :cond_0

    .line 715
    const/4 v0, 0x0

    .line 721
    :goto_0
    return-object v0

    .line 718
    :cond_0
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 719
    new-instance v0, Ljava/lang/NumberFormatException;

    const-string v1, "A blank string is not a valid number"

    invoke-direct {v0, v1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 721
    :cond_1
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;
    .locals 1
    .parameter "str"

    .prologue
    .line 698
    if-nez p0, :cond_0

    .line 699
    const/4 v0, 0x0

    .line 701
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/math/BigInteger;

    invoke-direct {v0, p0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static createDouble(Ljava/lang/String;)Ljava/lang/Double;
    .locals 1
    .parameter "str"

    .prologue
    .line 648
    if-nez p0, :cond_0

    .line 649
    const/4 v0, 0x0

    .line 651
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0
.end method

.method public static createFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1
    .parameter "str"

    .prologue
    .line 632
    if-nez p0, :cond_0

    .line 633
    const/4 v0, 0x0

    .line 635
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    goto :goto_0
.end method

.method public static createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1
    .parameter "str"

    .prologue
    .line 665
    if-nez p0, :cond_0

    .line 666
    const/4 v0, 0x0

    .line 669
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method public static createLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1
    .parameter "str"

    .prologue
    .line 682
    if-nez p0, :cond_0

    .line 683
    const/4 v0, 0x0

    .line 685
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    goto :goto_0
.end method

.method public static createNumber(Ljava/lang/String;)Ljava/lang/Number;
    .locals 14
    .parameter "str"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 453
    if-nez p0, :cond_1

    .line 454
    const/4 v6, 0x0

    .line 595
    :cond_0
    :goto_0
    return-object v6

    .line 456
    :cond_1
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 457
    new-instance v10, Ljava/lang/NumberFormatException;

    const-string v11, "A blank string is not a valid number"

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 459
    :cond_2
    const-string v10, "--"

    invoke-virtual {p0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 464
    const/4 v6, 0x0

    goto :goto_0

    .line 466
    :cond_3
    const-string v10, "0x"

    invoke-virtual {p0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_4

    const-string v10, "-0x"

    invoke-virtual {p0, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 467
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    goto :goto_0

    .line 469
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 473
    .local v7, lastChar:C
    const/16 v10, 0x2e

    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 474
    .local v3, decPos:I
    const/16 v10, 0x65

    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    const/16 v11, 0x45

    invoke-virtual {p0, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v11

    add-int/2addr v10, v11

    add-int/lit8 v5, v10, 0x1

    .line 476
    .local v5, expPos:I
    const/4 v10, -0x1

    if-le v3, v10, :cond_8

    .line 478
    const/4 v10, -0x1

    if-le v5, v10, :cond_7

    .line 479
    if-ge v5, v3, :cond_6

    .line 480
    new-instance v10, Ljava/lang/NumberFormatException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " is not a valid number."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 482
    :cond_6
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p0, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 486
    .local v2, dec:Ljava/lang/String;
    :goto_1
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 495
    .local v8, mant:Ljava/lang/String;
    :goto_2
    invoke-static {v7}, Ljava/lang/Character;->isDigit(C)Z

    move-result v10

    if-nez v10, :cond_12

    const/16 v10, 0x2e

    if-eq v7, v10, :cond_12

    .line 496
    const/4 v10, -0x1

    if-le v5, v10, :cond_a

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v5, v10, :cond_a

    .line 497
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {p0, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 502
    .local v4, exp:Ljava/lang/String;
    :goto_3
    const/4 v10, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {p0, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 503
    .local v9, numeric:Ljava/lang/String;
    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    invoke-static {v4}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_b

    const/4 v0, 0x1

    .line 504
    .local v0, allZeros:Z
    :goto_4
    sparse-switch v7, :sswitch_data_0

    .line 550
    :goto_5
    new-instance v10, Ljava/lang/NumberFormatException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " is not a valid number."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 484
    .end local v0           #allZeros:Z
    .end local v2           #dec:Ljava/lang/String;
    .end local v4           #exp:Ljava/lang/String;
    .end local v8           #mant:Ljava/lang/String;
    .end local v9           #numeric:Ljava/lang/String;
    :cond_7
    add-int/lit8 v10, v3, 0x1

    invoke-virtual {p0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .restart local v2       #dec:Ljava/lang/String;
    goto :goto_1

    .line 488
    .end local v2           #dec:Ljava/lang/String;
    :cond_8
    const/4 v10, -0x1

    if-le v5, v10, :cond_9

    .line 489
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 493
    .restart local v8       #mant:Ljava/lang/String;
    :goto_6
    const/4 v2, 0x0

    .restart local v2       #dec:Ljava/lang/String;
    goto :goto_2

    .line 491
    .end local v2           #dec:Ljava/lang/String;
    .end local v8           #mant:Ljava/lang/String;
    :cond_9
    move-object v8, p0

    .restart local v8       #mant:Ljava/lang/String;
    goto :goto_6

    .line 499
    .restart local v2       #dec:Ljava/lang/String;
    :cond_a
    const/4 v4, 0x0

    .restart local v4       #exp:Ljava/lang/String;
    goto :goto_3

    .line 503
    .restart local v9       #numeric:Ljava/lang/String;
    :cond_b
    const/4 v0, 0x0

    goto :goto_4

    .line 507
    .restart local v0       #allZeros:Z
    :sswitch_0
    if-nez v2, :cond_e

    .line 508
    if-nez v4, :cond_e

    .line 509
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const/16 v11, 0x2d

    if-ne v10, v11, :cond_c

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_d

    :cond_c
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->isDigits(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_e

    .line 511
    :cond_d
    :try_start_0
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    goto/16 :goto_0

    .line 512
    :catch_0
    move-exception v10

    .line 515
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v6

    goto/16 :goto_0

    .line 518
    :cond_e
    new-instance v10, Ljava/lang/NumberFormatException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, " is not a valid number."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 522
    :sswitch_1
    :try_start_1
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v6

    .line 523
    .local v6, f:Ljava/lang/Float;
    invoke-virtual {v6}, Ljava/lang/Float;->isInfinite()Z

    move-result v10

    if-nez v10, :cond_f

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_7

    move-result v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-nez v10, :cond_0

    if-nez v0, :cond_0

    .line 536
    .end local v6           #f:Ljava/lang/Float;
    :cond_f
    :goto_7
    :sswitch_2
    :try_start_2
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    .line 537
    .local v1, d:Ljava/lang/Double;
    invoke-virtual {v1}, Ljava/lang/Double;->isInfinite()Z

    move-result v10

    if-nez v10, :cond_11

    invoke-virtual {v1}, Ljava/lang/Double;->floatValue()F
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v10

    float-to-double v10, v10

    const-wide/16 v12, 0x0

    cmpl-double v10, v10, v12

    if-nez v10, :cond_10

    if-eqz v0, :cond_11

    :cond_10
    move-object v6, v1

    .line 538
    goto/16 :goto_0

    .line 540
    .end local v1           #d:Ljava/lang/Double;
    :catch_1
    move-exception v10

    .line 544
    :cond_11
    :try_start_3
    invoke-static {v9}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_5

    move-result-object v6

    goto/16 :goto_0

    .line 556
    .end local v0           #allZeros:Z
    .end local v4           #exp:Ljava/lang/String;
    .end local v9           #numeric:Ljava/lang/String;
    :cond_12
    const/4 v10, -0x1

    if-le v5, v10, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ge v5, v10, :cond_13

    .line 557
    add-int/lit8 v10, v5, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    invoke-virtual {p0, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 561
    .restart local v4       #exp:Ljava/lang/String;
    :goto_8
    if-nez v2, :cond_14

    if-nez v4, :cond_14

    .line 564
    :try_start_4
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createInteger(Ljava/lang/String;)Ljava/lang/Integer;
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_2

    move-result-object v6

    goto/16 :goto_0

    .line 559
    .end local v4           #exp:Ljava/lang/String;
    :cond_13
    const/4 v4, 0x0

    .restart local v4       #exp:Ljava/lang/String;
    goto :goto_8

    .line 565
    :catch_2
    move-exception v10

    .line 569
    :try_start_5
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createLong(Ljava/lang/String;)Ljava/lang/Long;
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_3

    move-result-object v6

    goto/16 :goto_0

    .line 570
    :catch_3
    move-exception v10

    .line 573
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v6

    goto/16 :goto_0

    .line 577
    :cond_14
    invoke-static {v8}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_17

    invoke-static {v4}, Lorg/apache/commons/lang3/math/NumberUtils;->isAllZeros(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_17

    const/4 v0, 0x1

    .line 579
    .restart local v0       #allZeros:Z
    :goto_9
    :try_start_6
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v6

    .line 580
    .restart local v6       #f:Ljava/lang/Float;
    invoke-virtual {v6}, Ljava/lang/Float;->isInfinite()Z

    move-result v10

    if-nez v10, :cond_15

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_6

    move-result v10

    const/4 v11, 0x0

    cmpl-float v10, v10, v11

    if-nez v10, :cond_0

    if-nez v0, :cond_0

    .line 587
    .end local v6           #f:Ljava/lang/Float;
    :cond_15
    :goto_a
    :try_start_7
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createDouble(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v1

    .line 588
    .restart local v1       #d:Ljava/lang/Double;
    invoke-virtual {v1}, Ljava/lang/Double;->isInfinite()Z

    move-result v10

    if-nez v10, :cond_18

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_4

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmpl-double v10, v10, v12

    if-nez v10, :cond_16

    if-eqz v0, :cond_18

    :cond_16
    move-object v6, v1

    .line 589
    goto/16 :goto_0

    .line 577
    .end local v0           #allZeros:Z
    .end local v1           #d:Ljava/lang/Double;
    :cond_17
    const/4 v0, 0x0

    goto :goto_9

    .line 591
    .restart local v0       #allZeros:Z
    :catch_4
    move-exception v10

    .line 595
    :cond_18
    invoke-static {p0}, Lorg/apache/commons/lang3/math/NumberUtils;->createBigDecimal(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v6

    goto/16 :goto_0

    .line 545
    .restart local v9       #numeric:Ljava/lang/String;
    :catch_5
    move-exception v10

    goto/16 :goto_5

    .line 583
    .end local v9           #numeric:Ljava/lang/String;
    :catch_6
    move-exception v10

    goto :goto_a

    .line 529
    .restart local v9       #numeric:Ljava/lang/String;
    :catch_7
    move-exception v10

    goto/16 :goto_7

    .line 504
    nop

    :sswitch_data_0
    .sparse-switch
        0x44 -> :sswitch_2
        0x46 -> :sswitch_1
        0x4c -> :sswitch_0
        0x64 -> :sswitch_2
        0x66 -> :sswitch_1
        0x6c -> :sswitch_0
    .end sparse-switch
.end method

.method private static isAllZeros(Ljava/lang/String;)Z
    .locals 5
    .parameter "str"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 610
    if-nez p0, :cond_1

    .line 618
    :cond_0
    :goto_0
    return v1

    .line 613
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_2

    .line 618
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-gtz v3, :cond_0

    move v1, v2

    goto :goto_0

    .line 614
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 615
    goto :goto_0

    .line 613
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static isDigits(Ljava/lang/String;)Z
    .locals 3
    .parameter "str"

    .prologue
    const/4 v1, 0x0

    .line 1292
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1300
    :cond_0
    :goto_0
    return v1

    .line 1295
    :cond_1
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_2

    .line 1300
    const/4 v1, 0x1

    goto :goto_0

    .line 1296
    :cond_2
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1295
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isNumber(Ljava/lang/String;)Z
    .locals 15
    .parameter "str"

    .prologue
    const/16 v14, 0x2d

    const/16 v13, 0x39

    const/16 v12, 0x30

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 1317
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    move v2, v8

    .line 1417
    :cond_0
    :goto_0
    return v2

    .line 1320
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 1321
    .local v1, chars:[C
    array-length v7, v1

    .line 1322
    .local v7, sz:I
    const/4 v4, 0x0

    .line 1323
    .local v4, hasExp:Z
    const/4 v3, 0x0

    .line 1324
    .local v3, hasDecPoint:Z
    const/4 v0, 0x0

    .line 1325
    .local v0, allowSigns:Z
    const/4 v2, 0x0

    .line 1327
    .local v2, foundDigit:Z
    aget-char v10, v1, v8

    if-ne v10, v14, :cond_2

    move v6, v9

    .line 1328
    .local v6, start:I
    :goto_1
    add-int/lit8 v10, v6, 0x1

    if-le v7, v10, :cond_9

    .line 1329
    aget-char v10, v1, v6

    if-ne v10, v12, :cond_9

    add-int/lit8 v10, v6, 0x1

    aget-char v10, v1, v10

    const/16 v11, 0x78

    if-ne v10, v11, :cond_9

    .line 1330
    add-int/lit8 v5, v6, 0x2

    .line 1331
    .local v5, i:I
    if-ne v5, v7, :cond_8

    move v2, v8

    .line 1332
    goto :goto_0

    .end local v5           #i:I
    .end local v6           #start:I
    :cond_2
    move v6, v8

    .line 1327
    goto :goto_1

    .line 1336
    .restart local v5       #i:I
    .restart local v6       #start:I
    :cond_3
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_4

    aget-char v10, v1, v5

    if-le v10, v13, :cond_7

    .line 1337
    :cond_4
    aget-char v10, v1, v5

    const/16 v11, 0x61

    if-lt v10, v11, :cond_5

    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-le v10, v11, :cond_7

    .line 1338
    :cond_5
    aget-char v10, v1, v5

    const/16 v11, 0x41

    if-lt v10, v11, :cond_6

    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-le v10, v11, :cond_7

    :cond_6
    move v2, v8

    .line 1339
    goto :goto_0

    .line 1335
    :cond_7
    add-int/lit8 v5, v5, 0x1

    :cond_8
    array-length v10, v1

    if-lt v5, v10, :cond_3

    move v2, v9

    .line 1342
    goto :goto_0

    .line 1345
    .end local v5           #i:I
    :cond_9
    add-int/lit8 v7, v7, -0x1

    .line 1347
    move v5, v6

    .line 1350
    .restart local v5       #i:I
    :goto_2
    if-lt v5, v7, :cond_b

    add-int/lit8 v10, v7, 0x1

    if-ge v5, v10, :cond_a

    if-eqz v0, :cond_a

    if-eqz v2, :cond_b

    .line 1383
    :cond_a
    array-length v10, v1

    if-ge v5, v10, :cond_20

    .line 1384
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_17

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_17

    move v2, v9

    .line 1386
    goto :goto_0

    .line 1351
    :cond_b
    aget-char v10, v1, v5

    if-lt v10, v12, :cond_c

    aget-char v10, v1, v5

    if-gt v10, v13, :cond_c

    .line 1352
    const/4 v2, 0x1

    .line 1353
    const/4 v0, 0x0

    .line 1381
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 1355
    :cond_c
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_f

    .line 1356
    if-nez v3, :cond_d

    if-eqz v4, :cond_e

    :cond_d
    move v2, v8

    .line 1358
    goto/16 :goto_0

    .line 1360
    :cond_e
    const/4 v3, 0x1

    .line 1361
    goto :goto_3

    :cond_f
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_10

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-ne v10, v11, :cond_13

    .line 1363
    :cond_10
    if-eqz v4, :cond_11

    move v2, v8

    .line 1365
    goto/16 :goto_0

    .line 1367
    :cond_11
    if-nez v2, :cond_12

    move v2, v8

    .line 1368
    goto/16 :goto_0

    .line 1370
    :cond_12
    const/4 v4, 0x1

    .line 1371
    const/4 v0, 0x1

    .line 1372
    goto :goto_3

    :cond_13
    aget-char v10, v1, v5

    const/16 v11, 0x2b

    if-eq v10, v11, :cond_14

    aget-char v10, v1, v5

    if-ne v10, v14, :cond_16

    .line 1373
    :cond_14
    if-nez v0, :cond_15

    move v2, v8

    .line 1374
    goto/16 :goto_0

    .line 1376
    :cond_15
    const/4 v0, 0x0

    .line 1377
    const/4 v2, 0x0

    .line 1378
    goto :goto_3

    :cond_16
    move v2, v8

    .line 1379
    goto/16 :goto_0

    .line 1388
    :cond_17
    aget-char v10, v1, v5

    const/16 v11, 0x65

    if-eq v10, v11, :cond_18

    aget-char v10, v1, v5

    const/16 v11, 0x45

    if-ne v10, v11, :cond_19

    :cond_18
    move v2, v8

    .line 1390
    goto/16 :goto_0

    .line 1392
    :cond_19
    aget-char v10, v1, v5

    const/16 v11, 0x2e

    if-ne v10, v11, :cond_1b

    .line 1393
    if-nez v3, :cond_1a

    if-eqz v4, :cond_0

    :cond_1a
    move v2, v8

    .line 1395
    goto/16 :goto_0

    .line 1400
    :cond_1b
    if-nez v0, :cond_1c

    .line 1401
    aget-char v10, v1, v5

    const/16 v11, 0x64

    if-eq v10, v11, :cond_0

    .line 1402
    aget-char v10, v1, v5

    const/16 v11, 0x44

    if-eq v10, v11, :cond_0

    .line 1403
    aget-char v10, v1, v5

    const/16 v11, 0x66

    if-eq v10, v11, :cond_0

    .line 1404
    aget-char v10, v1, v5

    const/16 v11, 0x46

    if-eq v10, v11, :cond_0

    .line 1407
    :cond_1c
    aget-char v10, v1, v5

    const/16 v11, 0x6c

    if-eq v10, v11, :cond_1d

    .line 1408
    aget-char v10, v1, v5

    const/16 v11, 0x4c

    if-ne v10, v11, :cond_1f

    .line 1410
    :cond_1d
    if-eqz v2, :cond_1e

    if-nez v4, :cond_1e

    move v2, v9

    goto/16 :goto_0

    :cond_1e
    move v2, v8

    goto/16 :goto_0

    :cond_1f
    move v2, v8

    .line 1413
    goto/16 :goto_0

    .line 1417
    :cond_20
    if-nez v0, :cond_21

    if-eqz v2, :cond_21

    move v2, v9

    goto/16 :goto_0

    :cond_21
    move v2, v8

    goto/16 :goto_0
.end method

.method public static max(BBB)B
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1239
    if-le p1, p0, :cond_0

    .line 1240
    move p0, p1

    .line 1242
    :cond_0
    if-le p2, p0, :cond_1

    .line 1243
    move p0, p2

    .line 1245
    :cond_1
    return p0
.end method

.method public static max([B)B
    .locals 4
    .parameter "array"

    .prologue
    .line 989
    if-nez p0, :cond_0

    .line 990
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 991
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 992
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 996
    :cond_1
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 997
    .local v1, max:B
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 1003
    return v1

    .line 998
    :cond_2
    aget-byte v2, p0, v0

    if-le v2, v1, :cond_3

    .line 999
    aget-byte v1, p0, v0

    .line 997
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(DDD)D
    .locals 2
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1261
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->max(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static max([D)D
    .locals 5
    .parameter "array"

    .prologue
    .line 1017
    if-nez p0, :cond_0

    .line 1018
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1019
    :cond_0
    array-length v3, p0

    if-nez v3, :cond_1

    .line 1020
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Array cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1024
    :cond_1
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 1025
    .local v1, max:D
    const/4 v0, 0x1

    .local v0, j:I
    :goto_0
    array-length v3, p0

    if-lt v0, v3, :cond_2

    .line 1034
    .end local v1           #max:D
    :goto_1
    return-wide v1

    .line 1026
    .restart local v1       #max:D
    :cond_2
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 1027
    const-wide/high16 v1, 0x7ff8

    goto :goto_1

    .line 1029
    :cond_3
    aget-wide v3, p0, v0

    cmpl-double v3, v3, v1

    if-lez v3, :cond_4

    .line 1030
    aget-wide v1, p0, v0

    .line 1025
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(FFF)F
    .locals 1
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1277
    invoke-static {p0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method public static max([F)F
    .locals 4
    .parameter "array"

    .prologue
    .line 1048
    if-nez p0, :cond_0

    .line 1049
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1050
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 1051
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1055
    :cond_1
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 1056
    .local v1, max:F
    const/4 v0, 0x1

    .local v0, j:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 1065
    .end local v1           #max:F
    :goto_1
    return v1

    .line 1057
    .restart local v1       #max:F
    :cond_2
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1058
    const/high16 v1, 0x7fc0

    goto :goto_1

    .line 1060
    :cond_3
    aget v2, p0, v0

    cmpl-float v2, v2, v1

    if-lez v2, :cond_4

    .line 1061
    aget v1, p0, v0

    .line 1056
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(III)I
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1203
    if-le p1, p0, :cond_0

    .line 1204
    move p0, p1

    .line 1206
    :cond_0
    if-le p2, p0, :cond_1

    .line 1207
    move p0, p2

    .line 1209
    :cond_1
    return p0
.end method

.method public static max([I)I
    .locals 4
    .parameter "array"

    .prologue
    .line 935
    if-nez p0, :cond_0

    .line 936
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 937
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 938
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 942
    :cond_1
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 943
    .local v1, max:I
    const/4 v0, 0x1

    .local v0, j:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 949
    return v1

    .line 944
    :cond_2
    aget v2, p0, v0

    if-le v2, v1, :cond_3

    .line 945
    aget v1, p0, v0

    .line 943
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(JJJ)J
    .locals 1
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1185
    cmp-long v0, p2, p0

    if-lez v0, :cond_0

    .line 1186
    move-wide p0, p2

    .line 1188
    :cond_0
    cmp-long v0, p4, p0

    if-lez v0, :cond_1

    .line 1189
    move-wide p0, p4

    .line 1191
    :cond_1
    return-wide p0
.end method

.method public static max([J)J
    .locals 5
    .parameter "array"

    .prologue
    .line 908
    if-nez p0, :cond_0

    .line 909
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 910
    :cond_0
    array-length v3, p0

    if-nez v3, :cond_1

    .line 911
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Array cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 915
    :cond_1
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 916
    .local v1, max:J
    const/4 v0, 0x1

    .local v0, j:I
    :goto_0
    array-length v3, p0

    if-lt v0, v3, :cond_2

    .line 922
    return-wide v1

    .line 917
    :cond_2
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-lez v3, :cond_3

    .line 918
    aget-wide v1, p0, v0

    .line 916
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static max(SSS)S
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1221
    if-le p1, p0, :cond_0

    .line 1222
    move p0, p1

    .line 1224
    :cond_0
    if-le p2, p0, :cond_1

    .line 1225
    move p0, p2

    .line 1227
    :cond_1
    return p0
.end method

.method public static max([S)S
    .locals 4
    .parameter "array"

    .prologue
    .line 962
    if-nez p0, :cond_0

    .line 963
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 964
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 965
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 969
    :cond_1
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 970
    .local v1, max:S
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 976
    return v1

    .line 971
    :cond_2
    aget-short v2, p0, v0

    if-le v2, v1, :cond_3

    .line 972
    aget-short v1, p0, v0

    .line 970
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(BBB)B
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1133
    if-ge p1, p0, :cond_0

    .line 1134
    move p0, p1

    .line 1136
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1137
    move p0, p2

    .line 1139
    :cond_1
    return p0
.end method

.method public static min([B)B
    .locals 4
    .parameter "array"

    .prologue
    .line 817
    if-nez p0, :cond_0

    .line 818
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 819
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 820
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 824
    :cond_1
    const/4 v2, 0x0

    aget-byte v1, p0, v2

    .line 825
    .local v1, min:B
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 831
    return v1

    .line 826
    :cond_2
    aget-byte v2, p0, v0

    if-ge v2, v1, :cond_3

    .line 827
    aget-byte v1, p0, v0

    .line 825
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(DDD)D
    .locals 2
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1155
    invoke-static {p0, p1, p2, p3}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-static {v0, v1, p4, p5}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    return-wide v0
.end method

.method public static min([D)D
    .locals 5
    .parameter "array"

    .prologue
    .line 845
    if-nez p0, :cond_0

    .line 846
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 847
    :cond_0
    array-length v3, p0

    if-nez v3, :cond_1

    .line 848
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Array cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 852
    :cond_1
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 853
    .local v1, min:D
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v3, p0

    if-lt v0, v3, :cond_2

    .line 862
    .end local v1           #min:D
    :goto_1
    return-wide v1

    .line 854
    .restart local v1       #min:D
    :cond_2
    aget-wide v3, p0, v0

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 855
    const-wide/high16 v1, 0x7ff8

    goto :goto_1

    .line 857
    :cond_3
    aget-wide v3, p0, v0

    cmpg-double v3, v3, v1

    if-gez v3, :cond_4

    .line 858
    aget-wide v1, p0, v0

    .line 853
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(FFF)F
    .locals 1
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1171
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public static min([F)F
    .locals 4
    .parameter "array"

    .prologue
    .line 876
    if-nez p0, :cond_0

    .line 877
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 878
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 879
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 883
    :cond_1
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 884
    .local v1, min:F
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 893
    .end local v1           #min:F
    :goto_1
    return v1

    .line 885
    .restart local v1       #min:F
    :cond_2
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 886
    const/high16 v1, 0x7fc0

    goto :goto_1

    .line 888
    :cond_3
    aget v2, p0, v0

    cmpg-float v2, v2, v1

    if-gez v2, :cond_4

    .line 889
    aget v1, p0, v0

    .line 884
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(III)I
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1097
    if-ge p1, p0, :cond_0

    .line 1098
    move p0, p1

    .line 1100
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1101
    move p0, p2

    .line 1103
    :cond_1
    return p0
.end method

.method public static min([I)I
    .locals 4
    .parameter "array"

    .prologue
    .line 763
    if-nez p0, :cond_0

    .line 764
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 765
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 766
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 770
    :cond_1
    const/4 v2, 0x0

    aget v1, p0, v2

    .line 771
    .local v1, min:I
    const/4 v0, 0x1

    .local v0, j:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 777
    return v1

    .line 772
    :cond_2
    aget v2, p0, v0

    if-ge v2, v1, :cond_3

    .line 773
    aget v1, p0, v0

    .line 771
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(JJJ)J
    .locals 1
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1079
    cmp-long v0, p2, p0

    if-gez v0, :cond_0

    .line 1080
    move-wide p0, p2

    .line 1082
    :cond_0
    cmp-long v0, p4, p0

    if-gez v0, :cond_1

    .line 1083
    move-wide p0, p4

    .line 1085
    :cond_1
    return-wide p0
.end method

.method public static min([J)J
    .locals 5
    .parameter "array"

    .prologue
    .line 736
    if-nez p0, :cond_0

    .line 737
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The Array must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 738
    :cond_0
    array-length v3, p0

    if-nez v3, :cond_1

    .line 739
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Array cannot be empty."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 743
    :cond_1
    const/4 v3, 0x0

    aget-wide v1, p0, v3

    .line 744
    .local v1, min:J
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v3, p0

    if-lt v0, v3, :cond_2

    .line 750
    return-wide v1

    .line 745
    :cond_2
    aget-wide v3, p0, v0

    cmp-long v3, v3, v1

    if-gez v3, :cond_3

    .line 746
    aget-wide v1, p0, v0

    .line 744
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static min(SSS)S
    .locals 0
    .parameter "a"
    .parameter "b"
    .parameter "c"

    .prologue
    .line 1115
    if-ge p1, p0, :cond_0

    .line 1116
    move p0, p1

    .line 1118
    :cond_0
    if-ge p2, p0, :cond_1

    .line 1119
    move p0, p2

    .line 1121
    :cond_1
    return p0
.end method

.method public static min([S)S
    .locals 4
    .parameter "array"

    .prologue
    .line 790
    if-nez p0, :cond_0

    .line 791
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 792
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 793
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array cannot be empty."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 797
    :cond_1
    const/4 v2, 0x0

    aget-short v1, p0, v2

    .line 798
    .local v1, min:S
    const/4 v0, 0x1

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_2

    .line 804
    return v1

    .line 799
    :cond_2
    aget-short v2, p0, v0

    if-ge v2, v1, :cond_3

    .line 800
    aget-short v1, p0, v0

    .line 798
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static toByte(Ljava/lang/String;)B
    .locals 1
    .parameter "str"

    .prologue
    .line 310
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toByte(Ljava/lang/String;B)B

    move-result v0

    return v0
.end method

.method public static toByte(Ljava/lang/String;B)B
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 331
    if-nez p0, :cond_0

    .line 337
    .end local p1
    :goto_0
    return p1

    .line 335
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 336
    :catch_0
    move-exception v0

    .line 337
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toDouble(Ljava/lang/String;)D
    .locals 2
    .parameter "str"

    .prologue
    .line 258
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toDouble(Ljava/lang/String;D)D

    move-result-wide v0

    return-wide v0
.end method

.method public static toDouble(Ljava/lang/String;D)D
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 281
    if-nez p0, :cond_0

    .line 287
    .end local p1
    :goto_0
    return-wide p1

    .line 285
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    goto :goto_0

    .line 286
    :catch_0
    move-exception v0

    .line 287
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toFloat(Ljava/lang/String;)F
    .locals 1
    .parameter "str"

    .prologue
    .line 206
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toFloat(Ljava/lang/String;F)F

    move-result v0

    return v0
.end method

.method public static toFloat(Ljava/lang/String;F)F
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 229
    if-nez p0, :cond_0

    .line 235
    .end local p1
    :goto_0
    return p1

    .line 233
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 234
    :catch_0
    move-exception v0

    .line 235
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toInt(Ljava/lang/String;)I
    .locals 1
    .parameter "str"

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static toInt(Ljava/lang/String;I)I
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 128
    if-nez p0, :cond_0

    .line 134
    .end local p1
    :goto_0
    return p1

    .line 132
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toLong(Ljava/lang/String;)J
    .locals 2
    .parameter "str"

    .prologue
    .line 156
    const-wide/16 v0, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/math/NumberUtils;->toLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static toLong(Ljava/lang/String;J)J
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 177
    if-nez p0, :cond_0

    .line 183
    .end local p1
    :goto_0
    return-wide p1

    .line 181
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide p1

    goto :goto_0

    .line 182
    :catch_0
    move-exception v0

    .line 183
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method

.method public static toShort(Ljava/lang/String;)S
    .locals 1
    .parameter "str"

    .prologue
    .line 359
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/math/NumberUtils;->toShort(Ljava/lang/String;S)S

    move-result v0

    return v0
.end method

.method public static toShort(Ljava/lang/String;S)S
    .locals 1
    .parameter "str"
    .parameter "defaultValue"

    .prologue
    .line 380
    if-nez p0, :cond_0

    .line 386
    .end local p1
    :goto_0
    return p1

    .line 384
    .restart local p1
    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result p1

    goto :goto_0

    .line 385
    :catch_0
    move-exception v0

    .line 386
    .local v0, nfe:Ljava/lang/NumberFormatException;
    goto :goto_0
.end method
