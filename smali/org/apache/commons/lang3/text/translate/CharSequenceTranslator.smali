.class public abstract Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
.super Ljava/lang/Object;
.source "CharSequenceTranslator.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hex(I)Ljava/lang/String;
    .locals 2
    .parameter "codepoint"

    .prologue
    .line 130
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public abstract translate(Ljava/lang/CharSequence;ILjava/io/Writer;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final translate(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 3
    .parameter "input"

    .prologue
    .line 55
    if-nez p1, :cond_0

    .line 56
    const/4 v2, 0x0

    .line 61
    :goto_0
    return-object v2

    .line 59
    :cond_0
    :try_start_0
    new-instance v1, Ljava/io/StringWriter;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/io/StringWriter;-><init>(I)V

    .line 60
    .local v1, writer:Ljava/io/StringWriter;
    invoke-virtual {p0, p1, v1}, Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;->translate(Ljava/lang/CharSequence;Ljava/io/Writer;)V

    .line 61
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 62
    .end local v1           #writer:Ljava/io/StringWriter;
    :catch_0
    move-exception v0

    .line 64
    .local v0, ioe:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public final translate(Ljava/lang/CharSequence;Ljava/io/Writer;)V
    .locals 6
    .parameter "input"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    if-nez p2, :cond_0

    .line 79
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The Writer must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 81
    :cond_0
    if-nez p1, :cond_2

    .line 106
    :cond_1
    return-void

    .line 84
    :cond_2
    const/4 v4, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-static {p1, v4, v5}, Ljava/lang/Character;->codePointCount(Ljava/lang/CharSequence;II)I

    move-result v3

    .line 85
    .local v3, sz:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 88
    invoke-virtual {p0, p1, v1, p2}, Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;->translate(Ljava/lang/CharSequence;ILjava/io/Writer;)I

    move-result v0

    .line 90
    .local v0, consumed:I
    if-nez v0, :cond_3

    .line 91
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/io/Writer;->write([C)V

    .line 85
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 94
    :cond_3
    const/4 v2, 0x0

    .local v2, j:I
    :goto_2
    if-lt v2, v0, :cond_4

    .line 103
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 95
    :cond_4
    add-int/lit8 v4, v3, -0x2

    if-ge v1, v4, :cond_5

    .line 96
    invoke-static {p1, v1}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Character;->charCount(I)I

    move-result v4

    add-int/2addr v1, v4

    .line 94
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 99
    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method public final varargs with([Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;)Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
    .locals 4
    .parameter "translators"

    .prologue
    const/4 v3, 0x0

    .line 116
    array-length v1, p1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;

    .line 117
    .local v0, newArray:[Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
    aput-object p0, v0, v3

    .line 118
    const/4 v1, 0x1

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 119
    new-instance v1, Lorg/apache/commons/lang3/text/translate/AggregateTranslator;

    invoke-direct {v1, v0}, Lorg/apache/commons/lang3/text/translate/AggregateTranslator;-><init>([Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;)V

    return-object v1
.end method
