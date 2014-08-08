.class public Lorg/apache/commons/lang3/exception/ContextedRuntimeException;
.super Ljava/lang/RuntimeException;
.source "ContextedRuntimeException.java"

# interfaces
.implements Lorg/apache/commons/lang3/exception/ExceptionContext;


# static fields
.field private static final serialVersionUID:J = 0x1441de1501834869L


# instance fields
.field private final exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 83
    new-instance v0, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;

    invoke-direct {v0}, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "message"

    .prologue
    .line 94
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 95
    new-instance v0, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;

    invoke-direct {v0}, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 96
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .parameter "message"
    .parameter "cause"

    .prologue
    .line 119
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    new-instance v0, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;

    invoke-direct {v0}, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/commons/lang3/exception/ExceptionContext;)V
    .locals 0
    .parameter "message"
    .parameter "cause"
    .parameter "context"

    .prologue
    .line 131
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 132
    if-nez p3, :cond_0

    .line 133
    new-instance p3, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;

    .end local p3
    invoke-direct {p3}, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;-><init>()V

    .line 135
    .restart local p3
    :cond_0
    iput-object p3, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 136
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 1
    .parameter "cause"

    .prologue
    .line 106
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 107
    new-instance v0, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;

    invoke-direct {v0}, Lorg/apache/commons/lang3/exception/DefaultExceptionContext;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 108
    return-void
.end method


# virtual methods
.method public addValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ContextedRuntimeException;
    .locals 1
    .parameter "label"
    .parameter "value"

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/lang3/exception/ExceptionContext;->addValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 154
    return-object p0
.end method

.method public bridge synthetic addValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->addValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ContextedRuntimeException;

    move-result-object v0

    return-object v0
.end method

.method public getFormattedExceptionMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "baseMessage"

    .prologue
    .line 209
    iget-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    invoke-interface {v0, p1}, Lorg/apache/commons/lang3/exception/ExceptionContext;->getFormattedExceptionMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLabelSet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 191
    iget-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    invoke-interface {v0}, Lorg/apache/commons/lang3/exception/ExceptionContext;->getLabelSet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 202
    invoke-super {p0}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->getFormattedExceptionMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .parameter "label"

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    invoke-interface {v0, p1}, Lorg/apache/commons/lang3/exception/ExceptionContext;->getValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public replaceValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ContextedRuntimeException;
    .locals 1
    .parameter "label"
    .parameter "value"

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->exceptionContext:Lorg/apache/commons/lang3/exception/ExceptionContext;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/lang3/exception/ExceptionContext;->replaceValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;

    .line 172
    return-object p0
.end method

.method public bridge synthetic replaceValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ExceptionContext;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/exception/ContextedRuntimeException;->replaceValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/commons/lang3/exception/ContextedRuntimeException;

    move-result-object v0

    return-object v0
.end method
