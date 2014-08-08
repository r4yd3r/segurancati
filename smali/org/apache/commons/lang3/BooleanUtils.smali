.class public Lorg/apache/commons/lang3/BooleanUtils;
.super Ljava/lang/Object;
.source "BooleanUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    return-void
.end method

.method public static isFalse(Ljava/lang/Boolean;)Z
    .locals 2
    .parameter "bool"

    .prologue
    const/4 v0, 0x0

    .line 127
    if-nez p0, :cond_1

    .line 130
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNotFalse(Ljava/lang/Boolean;)Z
    .locals 1
    .parameter "bool"

    .prologue
    .line 148
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->isFalse(Ljava/lang/Boolean;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isNotTrue(Ljava/lang/Boolean;)Z
    .locals 1
    .parameter "bool"

    .prologue
    .line 109
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->isTrue(Ljava/lang/Boolean;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isTrue(Ljava/lang/Boolean;)Z
    .locals 2
    .parameter "bool"

    .prologue
    const/4 v0, 0x0

    .line 88
    if-nez p0, :cond_1

    .line 91
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static negate(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1
    .parameter "bool"

    .prologue
    .line 65
    if-nez p0, :cond_0

    .line 66
    const/4 v0, 0x0

    .line 68
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBoolean(I)Z
    .locals 1
    .parameter "value"

    .prologue
    .line 210
    if-nez p0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static toBoolean(III)Z
    .locals 2
    .parameter "value"
    .parameter "trueValue"
    .parameter "falseValue"

    .prologue
    .line 271
    if-ne p0, p1, :cond_0

    .line 272
    const/4 v0, 0x1

    .line 274
    :goto_0
    return v0

    .line 273
    :cond_0
    if-ne p0, p2, :cond_1

    .line 274
    const/4 v0, 0x0

    goto :goto_0

    .line 277
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/Boolean;)Z
    .locals 2
    .parameter "bool"

    .prologue
    const/4 v0, 0x0

    .line 167
    if-nez p0, :cond_1

    .line 170
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static toBoolean(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Z
    .locals 3
    .parameter "value"
    .parameter "trueValue"
    .parameter "falseValue"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 300
    if-nez p0, :cond_2

    .line 301
    if-nez p1, :cond_1

    .line 309
    :cond_0
    :goto_0
    return v0

    .line 303
    :cond_1
    if-nez p2, :cond_3

    move v0, v1

    .line 304
    goto :goto_0

    .line 306
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 308
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 309
    goto :goto_0

    .line 312
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBoolean(Ljava/lang/String;)Z
    .locals 2
    .parameter "str"

    .prologue
    .line 698
    invoke-static {p0}, Lorg/apache/commons/lang3/BooleanUtils;->toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .parameter "str"
    .parameter "trueString"
    .parameter "falseString"

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 720
    if-nez p0, :cond_2

    .line 721
    if-nez p1, :cond_1

    .line 729
    :cond_0
    :goto_0
    return v0

    .line 723
    :cond_1
    if-nez p2, :cond_3

    move v0, v1

    .line 724
    goto :goto_0

    .line 726
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 728
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    move v0, v1

    .line 729
    goto :goto_0

    .line 732
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match either specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanDefaultIfNull(Ljava/lang/Boolean;Z)Z
    .locals 1
    .parameter "bool"
    .parameter "valueIfNull"

    .prologue
    .line 187
    if-nez p0, :cond_0

    .line 190
    .end local p1
    :goto_0
    return p1

    .restart local p1
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    move p1, v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static toBooleanObject(I)Ljava/lang/Boolean;
    .locals 1
    .parameter "value"

    .prologue
    .line 228
    if-nez p0, :cond_0

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBooleanObject(IIII)Ljava/lang/Boolean;
    .locals 2
    .parameter "value"
    .parameter "trueValue"
    .parameter "falseValue"
    .parameter "nullValue"

    .prologue
    .line 332
    if-ne p0, p1, :cond_0

    .line 333
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 337
    :goto_0
    return-object v0

    .line 334
    :cond_0
    if-ne p0, p2, :cond_1

    .line 335
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 336
    :cond_1
    if-ne p0, p3, :cond_2

    .line 337
    const/4 v0, 0x0

    goto :goto_0

    .line 340
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1
    .parameter "value"

    .prologue
    .line 248
    if-nez p0, :cond_0

    .line 249
    const/4 v0, 0x0

    .line 251
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static toBooleanObject(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 2
    .parameter "value"
    .parameter "trueValue"
    .parameter "falseValue"
    .parameter "nullValue"

    .prologue
    const/4 v0, 0x0

    .line 363
    if-nez p0, :cond_4

    .line 364
    if-nez p1, :cond_1

    .line 365
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 376
    :cond_0
    :goto_0
    return-object v0

    .line 366
    :cond_1
    if-nez p2, :cond_2

    .line 367
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 368
    :cond_2
    if-eqz p3, :cond_0

    .line 379
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Integer did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 371
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 372
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 373
    :cond_5
    invoke-virtual {p0, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 374
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 375
    :cond_6
    invoke-virtual {p0, p3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0
.end method

.method public static toBooleanObject(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 11
    .parameter "str"

    .prologue
    const/16 v10, 0x46

    const/16 v9, 0x45

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 553
    const-string v5, "true"

    if-ne p0, v5, :cond_0

    .line 554
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 625
    :goto_0
    return-object v5

    .line 556
    :cond_0
    if-nez p0, :cond_1

    .line 557
    const/4 v5, 0x0

    goto :goto_0

    .line 559
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 625
    :cond_2
    const/4 v5, 0x0

    goto :goto_0

    .line 561
    :pswitch_0
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 562
    .local v0, ch0:C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 563
    .local v1, ch1:C
    const/16 v5, 0x6f

    if-eq v0, v5, :cond_3

    const/16 v5, 0x4f

    if-ne v0, v5, :cond_5

    .line 564
    :cond_3
    const/16 v5, 0x6e

    if-eq v1, v5, :cond_4

    const/16 v5, 0x4e

    if-ne v1, v5, :cond_5

    .line 566
    :cond_4
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 568
    :cond_5
    const/16 v5, 0x6e

    if-eq v0, v5, :cond_6

    const/16 v5, 0x4e

    if-ne v0, v5, :cond_2

    .line 569
    :cond_6
    const/16 v5, 0x6f

    if-eq v1, v5, :cond_7

    const/16 v5, 0x4f

    if-ne v1, v5, :cond_2

    .line 571
    :cond_7
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 576
    .end local v0           #ch0:C
    .end local v1           #ch1:C
    :pswitch_1
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 577
    .restart local v0       #ch0:C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 578
    .restart local v1       #ch1:C
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 579
    .local v2, ch2:C
    const/16 v5, 0x79

    if-eq v0, v5, :cond_8

    const/16 v5, 0x59

    if-ne v0, v5, :cond_b

    .line 580
    :cond_8
    const/16 v5, 0x65

    if-eq v1, v5, :cond_9

    if-ne v1, v9, :cond_b

    .line 581
    :cond_9
    const/16 v5, 0x73

    if-eq v2, v5, :cond_a

    const/16 v5, 0x53

    if-ne v2, v5, :cond_b

    .line 583
    :cond_a
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 585
    :cond_b
    const/16 v5, 0x6f

    if-eq v0, v5, :cond_c

    const/16 v5, 0x4f

    if-ne v0, v5, :cond_2

    .line 586
    :cond_c
    const/16 v5, 0x66

    if-eq v1, v5, :cond_d

    if-ne v1, v10, :cond_2

    .line 587
    :cond_d
    const/16 v5, 0x66

    if-eq v2, v5, :cond_e

    if-ne v2, v10, :cond_2

    .line 589
    :cond_e
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 594
    .end local v0           #ch0:C
    .end local v1           #ch1:C
    .end local v2           #ch2:C
    :pswitch_2
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 595
    .restart local v0       #ch0:C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 596
    .restart local v1       #ch1:C
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 597
    .restart local v2       #ch2:C
    const/4 v5, 0x3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 598
    .local v3, ch3:C
    const/16 v5, 0x74

    if-eq v0, v5, :cond_f

    const/16 v5, 0x54

    if-ne v0, v5, :cond_2

    .line 599
    :cond_f
    const/16 v5, 0x72

    if-eq v1, v5, :cond_10

    const/16 v5, 0x52

    if-ne v1, v5, :cond_2

    .line 600
    :cond_10
    const/16 v5, 0x75

    if-eq v2, v5, :cond_11

    const/16 v5, 0x55

    if-ne v2, v5, :cond_2

    .line 601
    :cond_11
    const/16 v5, 0x65

    if-eq v3, v5, :cond_12

    if-ne v3, v9, :cond_2

    .line 603
    :cond_12
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 608
    .end local v0           #ch0:C
    .end local v1           #ch1:C
    .end local v2           #ch2:C
    .end local v3           #ch3:C
    :pswitch_3
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 609
    .restart local v0       #ch0:C
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 610
    .restart local v1       #ch1:C
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 611
    .restart local v2       #ch2:C
    const/4 v5, 0x3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 612
    .restart local v3       #ch3:C
    const/4 v5, 0x4

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 613
    .local v4, ch4:C
    const/16 v5, 0x66

    if-eq v0, v5, :cond_13

    if-ne v0, v10, :cond_2

    .line 614
    :cond_13
    const/16 v5, 0x61

    if-eq v1, v5, :cond_14

    const/16 v5, 0x41

    if-ne v1, v5, :cond_2

    .line 615
    :cond_14
    const/16 v5, 0x6c

    if-eq v2, v5, :cond_15

    const/16 v5, 0x4c

    if-ne v2, v5, :cond_2

    .line 616
    :cond_15
    const/16 v5, 0x73

    if-eq v3, v5, :cond_16

    const/16 v5, 0x53

    if-ne v3, v5, :cond_2

    .line 617
    :cond_16
    const/16 v5, 0x65

    if-eq v4, v5, :cond_17

    if-ne v4, v9, :cond_2

    .line 619
    :cond_17
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto/16 :goto_0

    .line 559
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static toBooleanObject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2
    .parameter "str"
    .parameter "trueString"
    .parameter "falseString"
    .parameter "nullString"

    .prologue
    const/4 v0, 0x0

    .line 651
    if-nez p0, :cond_4

    .line 652
    if-nez p1, :cond_1

    .line 653
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 664
    :cond_0
    :goto_0
    return-object v0

    .line 654
    :cond_1
    if-nez p2, :cond_2

    .line 655
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 656
    :cond_2
    if-eqz p3, :cond_0

    .line 667
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The String did not match any specified value"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 659
    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 660
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 661
    :cond_5
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 662
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 663
    :cond_6
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_0
.end method

.method public static toInteger(Ljava/lang/Boolean;III)I
    .locals 1
    .parameter "bool"
    .parameter "trueValue"
    .parameter "falseValue"
    .parameter "nullValue"

    .prologue
    .line 470
    if-nez p0, :cond_0

    .line 473
    .end local p1
    .end local p3
    :goto_0
    return p3

    .restart local p1
    .restart local p3
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1
    :goto_1
    move p3, p1

    goto :goto_0

    .restart local p1
    :cond_1
    move p1, p2

    goto :goto_1
.end method

.method public static toInteger(Z)I
    .locals 1
    .parameter "bool"

    .prologue
    .line 397
    if-eqz p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toInteger(ZII)I
    .locals 0
    .parameter "bool"
    .parameter "trueValue"
    .parameter "falseValue"

    .prologue
    .line 451
    if-eqz p0, :cond_0

    .end local p1
    :goto_0
    return p1

    .restart local p1
    :cond_0
    move p1, p2

    goto :goto_0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;)Ljava/lang/Integer;
    .locals 1
    .parameter "bool"

    .prologue
    .line 431
    if-nez p0, :cond_0

    .line 432
    const/4 v0, 0x0

    .line 434
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    goto :goto_0

    :cond_1
    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public static toIntegerObject(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1
    .parameter "bool"
    .parameter "trueValue"
    .parameter "falseValue"
    .parameter "nullValue"

    .prologue
    .line 514
    if-nez p0, :cond_0

    .line 517
    .end local p1
    .end local p3
    :goto_0
    return-object p3

    .restart local p1
    .restart local p3
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1
    :goto_1
    move-object p3, p1

    goto :goto_0

    .restart local p1
    :cond_1
    move-object p1, p2

    goto :goto_1
.end method

.method public static toIntegerObject(Z)Ljava/lang/Integer;
    .locals 1
    .parameter "bool"

    .prologue
    .line 413
    if-eqz p0, :cond_0

    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ONE:Ljava/lang/Integer;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lorg/apache/commons/lang3/math/NumberUtils;->INTEGER_ZERO:Ljava/lang/Integer;

    goto :goto_0
.end method

.method public static toIntegerObject(ZLjava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0
    .parameter "bool"
    .parameter "trueValue"
    .parameter "falseValue"

    .prologue
    .line 492
    if-eqz p0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    move-object p1, p2

    goto :goto_0
.end method

.method public static toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "bool"
    .parameter "trueString"
    .parameter "falseString"
    .parameter "nullString"

    .prologue
    .line 810
    if-nez p0, :cond_0

    .line 813
    .end local p1
    .end local p3
    :goto_0
    return-object p3

    .restart local p1
    .restart local p3
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1

    .end local p1
    :goto_1
    move-object p3, p1

    goto :goto_0

    .restart local p1
    :cond_1
    move-object p1, p2

    goto :goto_1
.end method

.method public static toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "bool"
    .parameter "trueString"
    .parameter "falseString"

    .prologue
    .line 885
    if-eqz p0, :cond_0

    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    move-object p1, p2

    goto :goto_0
.end method

.method public static toStringOnOff(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .parameter "bool"

    .prologue
    .line 770
    const-string v0, "on"

    const-string v1, "off"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringOnOff(Z)Ljava/lang/String;
    .locals 2
    .parameter "bool"

    .prologue
    .line 849
    const-string v0, "on"

    const-string v1, "off"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .parameter "bool"

    .prologue
    .line 752
    const-string v0, "true"

    const-string v1, "false"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringTrueFalse(Z)Ljava/lang/String;
    .locals 2
    .parameter "bool"

    .prologue
    .line 832
    const-string v0, "true"

    const-string v1, "false"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Ljava/lang/Boolean;)Ljava/lang/String;
    .locals 3
    .parameter "bool"

    .prologue
    .line 788
    const-string v0, "yes"

    const-string v1, "no"

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/apache/commons/lang3/BooleanUtils;->toString(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toStringYesNo(Z)Ljava/lang/String;
    .locals 2
    .parameter "bool"

    .prologue
    .line 866
    const-string v0, "yes"

    const-string v1, "no"

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/BooleanUtils;->toString(ZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static varargs xor([Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 4
    .parameter "array"

    .prologue
    .line 946
    if-nez p0, :cond_0

    .line 947
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 948
    :cond_0
    array-length v2, p0

    if-nez v2, :cond_1

    .line 949
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 951
    :cond_1
    const/4 v1, 0x0

    .line 953
    .local v1, primitive:[Z
    :try_start_0
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->toPrimitive([Ljava/lang/Boolean;)[Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 957
    invoke-static {v1}, Lorg/apache/commons/lang3/BooleanUtils;->xor([Z)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_0
    return-object v2

    .line 954
    :catch_0
    move-exception v0

    .line 955
    .local v0, ex:Ljava/lang/NullPointerException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The array must not contain any null elements"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 957
    .end local v0           #ex:Ljava/lang/NullPointerException;
    :cond_2
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public static varargs xor([Z)Z
    .locals 6
    .parameter "array"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 906
    if-nez p0, :cond_0

    .line 907
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The Array must not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 908
    :cond_0
    array-length v4, p0

    if-nez v4, :cond_1

    .line 909
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array is empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 913
    :cond_1
    const/4 v1, 0x0

    .line 914
    .local v1, trueCount:I
    array-length v5, p0

    move v4, v2

    :goto_0
    if-lt v4, v5, :cond_3

    .line 927
    if-ne v1, v3, :cond_2

    move v2, v3

    :cond_2
    return v2

    .line 914
    :cond_3
    aget-boolean v0, p0, v4

    .line 917
    .local v0, element:Z
    if-eqz v0, :cond_4

    .line 918
    if-ge v1, v3, :cond_2

    .line 919
    add-int/lit8 v1, v1, 0x1

    .line 914
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method
