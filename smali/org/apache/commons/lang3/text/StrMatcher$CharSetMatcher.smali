.class final Lorg/apache/commons/lang3/text/StrMatcher$CharSetMatcher;
.super Lorg/apache/commons/lang3/text/StrMatcher;
.source "StrMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/text/StrMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CharSetMatcher"
.end annotation


# instance fields
.field private final chars:[C


# direct methods
.method constructor <init>([C)V
    .locals 1
    .parameter "chars"

    .prologue
    .line 284
    invoke-direct {p0}, Lorg/apache/commons/lang3/text/StrMatcher;-><init>()V

    .line 285
    invoke-virtual {p1}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    iput-object v0, p0, Lorg/apache/commons/lang3/text/StrMatcher$CharSetMatcher;->chars:[C

    .line 286
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrMatcher$CharSetMatcher;->chars:[C

    invoke-static {v0}, Ljava/util/Arrays;->sort([C)V

    .line 287
    return-void
.end method


# virtual methods
.method public isMatch([CIII)I
    .locals 2
    .parameter "buffer"
    .parameter "pos"
    .parameter "bufferStart"
    .parameter "bufferEnd"

    .prologue
    .line 300
    iget-object v0, p0, Lorg/apache/commons/lang3/text/StrMatcher$CharSetMatcher;->chars:[C

    aget-char v1, p1, p2

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([CC)I

    move-result v0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
