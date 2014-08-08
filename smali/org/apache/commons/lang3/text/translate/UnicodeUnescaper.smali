.class public Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;
.super Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;
.source "UnicodeUnescaper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;
    }
.end annotation


# instance fields
.field private final options:Ljava/util/EnumSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/EnumSet",
            "<",
            "Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>([Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;)V
    .locals 1
    .parameter "options"

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/commons/lang3/text/translate/CharSequenceTranslator;-><init>()V

    .line 41
    array-length v0, p1

    if-lez v0, :cond_0

    .line 42
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;->options:Ljava/util/EnumSet;

    .line 46
    :goto_0
    return-void

    .line 44
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;->options:Ljava/util/EnumSet;

    goto :goto_0
.end method


# virtual methods
.method public isSet(Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;)Z
    .locals 1
    .parameter "opt"

    .prologue
    .line 49
    iget-object v0, p0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;->options:Ljava/util/EnumSet;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;->options:Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/util/EnumSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public translate(Ljava/lang/CharSequence;ILjava/io/Writer;)I
    .locals 7
    .parameter "input"
    .parameter "index"
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x75

    .line 57
    invoke-interface {p1, p2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x5c

    if-ne v4, v5, :cond_4

    .line 58
    add-int/lit8 v4, p2, 0x1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v4, v5, :cond_4

    add-int/lit8 v4, p2, 0x1

    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_4

    .line 60
    const/4 v0, 0x2

    .line 61
    .local v0, i:I
    :goto_0
    add-int v4, p2, v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v4, v5, :cond_0

    add-int v4, p2, v0

    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-eq v4, v6, :cond_2

    .line 66
    :cond_0
    sget-object v4, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;->escapePlus:Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    invoke-virtual {p0, v4}, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;->isSet(Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 67
    add-int v4, p2, v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-ge v4, v5, :cond_1

    add-int v4, p2, v0

    invoke-interface {p1, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0x2b

    if-ne v4, v5, :cond_1

    .line 68
    add-int/lit8 v0, v0, 0x1

    .line 72
    :cond_1
    add-int v4, p2, v0

    add-int/lit8 v4, v4, 0x4

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-gt v4, v5, :cond_3

    .line 74
    add-int v4, p2, v0

    add-int v5, p2, v0

    add-int/lit8 v5, v5, 0x4

    invoke-interface {p1, v4, v5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    .line 77
    .local v2, unicode:Ljava/lang/CharSequence;
    :try_start_0
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v3

    .line 78
    .local v3, value:I
    int-to-char v4, v3

    invoke-virtual {p3, v4}, Ljava/io/Writer;->write(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    add-int/lit8 v4, v0, 0x4

    .line 90
    .end local v0           #i:I
    .end local v2           #unicode:Ljava/lang/CharSequence;
    .end local v3           #value:I
    :goto_1
    return v4

    .line 62
    .restart local v0       #i:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 79
    .restart local v2       #unicode:Ljava/lang/CharSequence;
    :catch_0
    move-exception v1

    .line 80
    .local v1, nfe:Ljava/lang/NumberFormatException;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Unable to parse unicode value: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 84
    .end local v1           #nfe:Ljava/lang/NumberFormatException;
    .end local v2           #unicode:Ljava/lang/CharSequence;
    :cond_3
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Less than 4 hex digits in unicode value: \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    invoke-interface {p1, p2, v6}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 86
    const-string v6, "\' due to end of CharSequence"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 84
    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 90
    .end local v0           #i:I
    :cond_4
    const/4 v4, 0x0

    goto :goto_1
.end method
