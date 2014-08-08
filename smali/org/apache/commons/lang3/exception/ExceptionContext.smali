.class public interface abstract Lorg/apache/commons/lang3/exception/ExceptionContext;
.super Ljava/lang/Object;
.source "ExceptionContext.java"


# virtual methods
.method public abstract addValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;
.end method

.method public abstract getFormattedExceptionMessage(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getLabelSet()Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getValue(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract replaceValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;
.end method
