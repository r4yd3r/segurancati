.class public Lorg/apache/commons/lang3/CharSet;
.super Ljava/lang/Object;
.source "CharSet.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final ASCII_ALPHA:Lorg/apache/commons/lang3/CharSet; = null

.field public static final ASCII_ALPHA_LOWER:Lorg/apache/commons/lang3/CharSet; = null

.field public static final ASCII_ALPHA_UPPER:Lorg/apache/commons/lang3/CharSet; = null

.field public static final ASCII_NUMERIC:Lorg/apache/commons/lang3/CharSet; = null

.field protected static final COMMON:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/lang3/CharSet;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY:Lorg/apache/commons/lang3/CharSet; = null

.field private static final serialVersionUID:J = 0x528affa5f57a3936L


# instance fields
.field private final set:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/apache/commons/lang3/CharRange;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 52
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    invoke-direct {v0, v2}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->EMPTY:Lorg/apache/commons/lang3/CharSet;

    .line 58
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    const-string v1, "a-zA-Z"

    invoke-direct {v0, v1}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA:Lorg/apache/commons/lang3/CharSet;

    .line 64
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    const-string v1, "a-z"

    invoke-direct {v0, v1}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA_LOWER:Lorg/apache/commons/lang3/CharSet;

    .line 70
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    const-string v1, "A-Z"

    invoke-direct {v0, v1}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA_UPPER:Lorg/apache/commons/lang3/CharSet;

    .line 76
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    const-string v1, "0-9"

    invoke-direct {v0, v1}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->ASCII_NUMERIC:Lorg/apache/commons/lang3/CharSet;

    .line 83
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    .line 86
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    sget-object v1, Lorg/apache/commons/lang3/CharSet;->EMPTY:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, ""

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->EMPTY:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, "a-zA-Z"

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, "A-Za-z"

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, "a-z"

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA_LOWER:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, "A-Z"

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->ASCII_ALPHA_UPPER:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    const-string v1, "0-9"

    sget-object v2, Lorg/apache/commons/lang3/CharSet;->ASCII_NUMERIC:Lorg/apache/commons/lang3/CharSet;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "setStr"

    .prologue
    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    .line 174
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/CharSet;->add(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method protected constructor <init>([Ljava/lang/String;)V
    .locals 3
    .parameter "set"

    .prologue
    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    .line 186
    array-length v1, p1

    .line 187
    .local v1, sz:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 190
    return-void

    .line 188
    :cond_0
    aget-object v2, p1, v0

    invoke-virtual {p0, v2}, Lorg/apache/commons/lang3/CharSet;->add(Ljava/lang/String;)V

    .line 187
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static getInstance(Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;
    .locals 2
    .parameter "setStr"

    .prologue
    .line 143
    sget-object v1, Lorg/apache/commons/lang3/CharSet;->COMMON:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 144
    .local v0, set:Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 145
    check-cast v0, Lorg/apache/commons/lang3/CharSet;

    .line 147
    .end local v0           #set:Ljava/lang/Object;
    :goto_0
    return-object v0

    .restart local v0       #set:Ljava/lang/Object;
    :cond_0
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    .end local v0           #set:Ljava/lang/Object;
    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/CharSet;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getInstance([Ljava/lang/String;)Lorg/apache/commons/lang3/CharSet;
    .locals 1
    .parameter "setStrs"

    .prologue
    .line 159
    if-nez p0, :cond_0

    .line 160
    const/4 v0, 0x0

    .line 162
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/apache/commons/lang3/CharSet;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/CharSet;-><init>([Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected add(Ljava/lang/String;)V
    .locals 8
    .parameter "str"

    .prologue
    const/16 v7, 0x5e

    const/16 v6, 0x2d

    .line 199
    if-nez p1, :cond_1

    .line 225
    :cond_0
    return-void

    .line 203
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 204
    .local v0, len:I
    const/4 v1, 0x0

    .line 205
    .local v1, pos:I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 206
    sub-int v2, v0, v1

    .line 207
    .local v2, remainder:I
    const/4 v3, 0x4

    if-lt v2, v3, :cond_2

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_2

    add-int/lit8 v3, v1, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_2

    .line 209
    iget-object v3, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v5, v1, 0x3

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lorg/apache/commons/lang3/CharRange;->isNotIn(CC)Lorg/apache/commons/lang3/CharRange;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 210
    add-int/lit8 v1, v1, 0x4

    .line 211
    goto :goto_0

    :cond_2
    const/4 v3, 0x3

    if-lt v2, v3, :cond_3

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v6, :cond_3

    .line 213
    iget-object v3, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    add-int/lit8 v5, v1, 0x2

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v4, v5}, Lorg/apache/commons/lang3/CharRange;->isIn(CC)Lorg/apache/commons/lang3/CharRange;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 214
    add-int/lit8 v1, v1, 0x3

    .line 215
    goto :goto_0

    :cond_3
    const/4 v3, 0x2

    if-lt v2, v3, :cond_4

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v7, :cond_4

    .line 217
    iget-object v3, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/apache/commons/lang3/CharRange;->isNot(C)Lorg/apache/commons/lang3/CharRange;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 218
    add-int/lit8 v1, v1, 0x2

    .line 219
    goto :goto_0

    .line 221
    :cond_4
    iget-object v3, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lorg/apache/commons/lang3/CharRange;->is(C)Lorg/apache/commons/lang3/CharRange;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 222
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public contains(C)Z
    .locals 3
    .parameter "ch"

    .prologue
    .line 247
    iget-object v1, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    .line 252
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 247
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang3/CharRange;

    .line 248
    .local v0, range:Lorg/apache/commons/lang3/CharRange;
    invoke-virtual {v0, p1}, Lorg/apache/commons/lang3/CharRange;->contains(C)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 249
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .parameter "obj"

    .prologue
    .line 270
    if-ne p1, p0, :cond_0

    .line 271
    const/4 v1, 0x1

    .line 277
    :goto_0
    return v1

    .line 273
    :cond_0
    instance-of v1, p1, Lorg/apache/commons/lang3/CharSet;

    if-nez v1, :cond_1

    .line 274
    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    move-object v0, p1

    .line 276
    check-cast v0, Lorg/apache/commons/lang3/CharSet;

    .line 277
    .local v0, other:Lorg/apache/commons/lang3/CharSet;
    iget-object v1, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    iget-object v2, v0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-interface {v1, v2}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getCharRanges()[Lorg/apache/commons/lang3/CharRange;
    .locals 2

    .prologue
    .line 235
    iget-object v0, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    iget-object v1, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/lang3/CharRange;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/lang3/CharRange;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x59

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 298
    iget-object v0, p0, Lorg/apache/commons/lang3/CharSet;->set:Ljava/util/Set;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
