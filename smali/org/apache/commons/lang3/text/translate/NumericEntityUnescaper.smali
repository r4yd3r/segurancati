.class public Lorg/apache/commons/lang3/text/translate/NumericEntityUnescaper;
.super Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
.source "NumericEntityUnescaper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;-><init>()V

    return-void
.end method


# virtual methods
.method public translate(Ljava/lang/CharSequence;ILjava/io/Writer;)I
    .locals 11
    .parameter "input"
    .parameter "index"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 38
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x26

    if-ne v9, v10, :cond_2

    add-int/lit8 v9, p2, 0x1

    invoke-interface {p1, v9}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x23

    if-ne v9, v10, :cond_2

    .line 39
    add-int/lit8 v6, p2, 0x2

    .line 40
    .local v6, start:I
    const/4 v4, 0x0

    .line 42
    .local v4, isHex:Z
    invoke-interface {p1, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    .line 43
    .local v3, firstChar:C
    const/16 v9, 0x78

    if-eq v3, v9, :cond_0

    const/16 v9, 0x58

    if-ne v3, v9, :cond_1

    .line 44
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 45
    const/4 v4, 0x1

    .line 48
    :cond_1
    move v1, v6

    .line 49
    .local v1, end:I
    :goto_0
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x3b

    if-ne v9, v10, :cond_3

    .line 55
    if-eqz v4, :cond_4

    .line 56
    :try_start_0
    invoke-interface {p1, v6, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0x10

    invoke-static {v9, v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 64
    .local v2, entityValue:I
    :goto_1
    const v9, 0xffff

    if-le v2, v9, :cond_5

    .line 65
    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v0

    .line 66
    .local v0, chrs:[C
    aget-char v9, v0, v8

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 67
    aget-char v9, v0, v7

    invoke-virtual {p3, v9}, Ljava/io/Writer;->write(I)V

    .line 71
    .end local v0           #chrs:[C
    :goto_2
    sub-int v9, v1, v6

    add-int/lit8 v9, v9, 0x2

    if-eqz v4, :cond_6

    :goto_3
    add-int/2addr v7, v9

    add-int/lit8 v8, v7, 0x1

    .line 73
    .end local v1           #end:I
    .end local v2           #entityValue:I
    .end local v3           #firstChar:C
    .end local v4           #isHex:Z
    .end local v6           #start:I
    :cond_2
    :goto_4
    return v8

    .line 50
    .restart local v1       #end:I
    .restart local v3       #firstChar:C
    .restart local v4       #isHex:Z
    .restart local v6       #start:I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 58
    :cond_4
    :try_start_1
    invoke-interface {p1, v6, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v9

    invoke-interface {v9}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v9

    const/16 v10, 0xa

    invoke-static {v9, v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    move-result v2

    .restart local v2       #entityValue:I
    goto :goto_1

    .line 60
    .end local v2           #entityValue:I
    :catch_0
    move-exception v5

    .line 61
    .local v5, nfe:Ljava/lang/NumberFormatException;
    goto :goto_4

    .line 69
    .end local v5           #nfe:Ljava/lang/NumberFormatException;
    .restart local v2       #entityValue:I
    :cond_5
    invoke-virtual {p3, v2}, Ljava/io/Writer;->write(I)V

    goto :goto_2

    :cond_6
    move v7, v8

    .line 71
    goto :goto_3
.end method
