.class Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;
.super Ljava/lang/Object;
.source "FastDateFormat.java"

# interfaces
.implements Lorg/apache/commons/lang3/time/FastDateFormat$Rule;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringLiteral"
.end annotation


# instance fields
.field private final mValue:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "value"

    .prologue
    .line 1115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1116
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;->mValue:Ljava/lang/String;

    .line 1117
    return-void
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .locals 1
    .parameter "buffer"
    .parameter "calendar"

    .prologue
    .line 1130
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;->mValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1131
    return-void
.end method

.method public estimateLength()I
    .locals 1

    .prologue
    .line 1123
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;->mValue:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method
