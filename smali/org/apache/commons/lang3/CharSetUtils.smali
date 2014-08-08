.class public Lorg/apache/commons/lang3/CharSetUtils;
.super Ljava/lang/Object;
.source "CharSetUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static count(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .parameter "str"
    .parameter "set"

    .prologue
    const/4 v1, 0x0

    .line 134
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 139
    :cond_0
    :goto_0
    return v1

    .line 137
    :cond_1
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/String;

    .line 138
    .local v0, strs:[Ljava/lang/String;
    aput-object p1, v0, v1

    .line 139
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/CharSetUtils;->count(Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public static count(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "str"
    .parameter "set"

    .prologue
    .line 157
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 158
    :cond_0
    const/4 v2, 0x0

    .line 169
    :cond_1
    return v2

    .line 160
    :cond_2
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v0

    .line 161
    .local v0, chars:Lorg/apache/commons/lang3/CharSet;
    const/4 v2, 0x0

    .line 162
    .local v2, count:I
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 163
    .local v1, chrs:[C
    array-length v4, v1

    .line 164
    .local v4, sz:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 165
    aget-char v5, v1, v3

    invoke-virtual {v0, v5}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 166
    add-int/lit8 v2, v2, 0x1

    .line 164
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static delete(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "set"

    .prologue
    .line 252
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 255
    .restart local p0
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 256
    .local v0, strs:[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 257
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/CharSetUtils;->delete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static delete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "set"

    .prologue
    .line 276
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 279
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .restart local p0
    :cond_1
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static keep(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "set"

    .prologue
    .line 194
    if-nez p0, :cond_0

    .line 195
    const/4 v1, 0x0

    .line 202
    :goto_0
    return-object v1

    .line 197
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 198
    :cond_1
    const-string v1, ""

    goto :goto_0

    .line 200
    :cond_2
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 201
    .local v0, strs:[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 202
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/CharSetUtils;->keep(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public static keep(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "str"
    .parameter "set"

    .prologue
    .line 222
    if-nez p0, :cond_0

    .line 223
    const/4 v0, 0x0

    .line 228
    :goto_0
    return-object v0

    .line 225
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 226
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 228
    :cond_2
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/CharSetUtils;->modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private static modify(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .parameter "str"
    .parameter "set"
    .parameter "expect"

    .prologue
    .line 292
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v1

    .line 293
    .local v1, chars:Lorg/apache/commons/lang3/CharSet;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 294
    .local v0, buffer:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    .line 295
    .local v2, chrs:[C
    array-length v4, v2

    .line 296
    .local v4, sz:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    if-lt v3, v4, :cond_0

    .line 301
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 297
    :cond_0
    aget-char v5, v2, v3

    invoke-virtual {v1, v5}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v5

    if-ne v5, p2, :cond_1

    .line 298
    aget-char v5, v2, v3

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 296
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method

.method public static squeeze(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "str"
    .parameter "set"

    .prologue
    .line 68
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 73
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 71
    .restart local p0
    :cond_1
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 72
    .local v0, strs:[Ljava/lang/String;
    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 73
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/CharSetUtils;->squeeze(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method

.method public static squeeze(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "str"
    .parameter "set"

    .prologue
    .line 91
    invoke-static {p0}, Lorg/apache/commons/lang3/StringUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 110
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 94
    .restart local p0
    :cond_1
    invoke-static {p1}, Lorg/apache/commons/lang3/CharSet;->getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;

    move-result-object v2

    .line 95
    .local v2, chars:Lorg/apache/commons/lang3/CharSet;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v0, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 96
    .local v0, buffer:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v3

    .line 97
    .local v3, chrs:[C
    array-length v6, v3

    .line 98
    .local v6, sz:I
    const/16 v5, 0x20

    .line 99
    .local v5, lastChar:C
    const/16 v1, 0x20

    .line 100
    .local v1, ch:C
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    if-lt v4, v6, :cond_2

    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 101
    :cond_2
    aget-char v1, v3, v4

    .line 102
    invoke-virtual {v2, v1}, Lorg/apache/commons/lang3/CharSet;->contains(C)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 103
    if-ne v1, v5, :cond_3

    if-eqz v4, :cond_3

    .line 100
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 107
    :cond_3
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    move v5, v1

    goto :goto_2
.end method
