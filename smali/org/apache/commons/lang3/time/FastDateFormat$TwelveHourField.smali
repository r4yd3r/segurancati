.class Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;
.super Ljava/lang/Object;
.source "FastDateFormat.java"

# interfaces
.implements Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TwelveHourField"
.end annotation


# instance fields
.field private final mRule:Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;


# direct methods
.method constructor <init>(Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;)V
    .locals 0
    .parameter "rule"

    .prologue
    .line 1448
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1449
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;->mRule:Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    .line 1450
    return-void
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuffer;I)V
    .locals 1
    .parameter "buffer"
    .parameter "value"

    .prologue
    .line 1474
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;->mRule:Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 1475
    return-void
.end method

.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .locals 2
    .parameter "buffer"
    .parameter "calendar"

    .prologue
    const/16 v1, 0xa

    .line 1463
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->get(I)I

    move-result v0

    .line 1464
    .local v0, value:I
    if-nez v0, :cond_0

    .line 1465
    invoke-virtual {p2, v1}, Ljava/util/Calendar;->getLeastMaximum(I)I

    move-result v1

    add-int/lit8 v0, v1, 0x1

    .line 1467
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;->mRule:Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    invoke-interface {v1, p1, v0}, Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;->appendTo(Ljava/lang/StringBuffer;I)V

    .line 1468
    return-void
.end method

.method public estimateLength()I
    .locals 1

    .prologue
    .line 1456
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;->mRule:Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    invoke-interface {v0}, Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;->estimateLength()I

    move-result v0

    return v0
.end method
