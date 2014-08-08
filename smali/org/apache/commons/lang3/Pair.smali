.class public final Lorg/apache/commons/lang3/Pair;
.super Ljava/lang/Object;
.source "Pair.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x44c3687a6deaffd1L


# instance fields
.field public final left:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "T",
            "L;"
        }
    .end annotation
.end field

.field public final right:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(T",
            "L;",
            "TR;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p0, this:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<TL;TR;>;"
    .local p1, left:Ljava/lang/Object;,"TL;"
    .local p2, right:Ljava/lang/Object;,"TR;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    .line 48
    iput-object p2, p0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    .line 49
    return-void
.end method

.method public static of(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/Pair;
    .locals 1
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(T",
            "L;",
            "TR;)",
            "Lorg/apache/commons/lang3/Pair",
            "<T",
            "L;",
            "TR;>;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, left:Ljava/lang/Object;,"TL;"
    .local p1, right:Ljava/lang/Object;,"TR;"
    new-instance v0, Lorg/apache/commons/lang3/Pair;

    invoke-direct {v0, p0, p1}, Lorg/apache/commons/lang3/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    .local p0, this:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<TL;TR;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 56
    if-ne p1, p0, :cond_1

    .line 63
    :cond_0
    :goto_0
    return v1

    .line 59
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang3/Pair;

    if-nez v3, :cond_2

    move v1, v2

    .line 60
    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 62
    check-cast v0, Lorg/apache/commons/lang3/Pair;

    .line 63
    .local v0, other:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<**>;"
    iget-object v3, p0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_3
    move v1, v2

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 71
    .local p0, this:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<TL;TR;>;"
    new-instance v0, Lorg/apache/commons/lang3/builder/HashCodeBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang3/builder/HashCodeBuilder;-><init>()V

    iget-object v1, p0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/HashCodeBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/apache/commons/lang3/builder/HashCodeBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/HashCodeBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/builder/HashCodeBuilder;->toHashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 79
    .local p0, this:Lorg/apache/commons/lang3/Pair;,"Lorg/apache/commons/lang3/Pair<TL;TR;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v0, builder:Ljava/lang/StringBuilder;
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    iget-object v1, p0, Lorg/apache/commons/lang3/Pair;->left:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    iget-object v1, p0, Lorg/apache/commons/lang3/Pair;->right:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
