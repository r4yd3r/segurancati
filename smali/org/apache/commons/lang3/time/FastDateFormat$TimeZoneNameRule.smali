.class Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;
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
    name = "TimeZoneNameRule"
.end annotation


# instance fields
.field private final mDaylight:Ljava/lang/String;

.field private final mLocale:Ljava/util/Locale;

.field private final mStandard:Ljava/lang/String;

.field private final mStyle:I

.field private final mTimeZone:Ljava/util/TimeZone;

.field private final mTimeZoneForced:Z


# direct methods
.method constructor <init>(Ljava/util/TimeZone;ZLjava/util/Locale;I)V
    .locals 1
    .parameter "timeZone"
    .parameter "timeZoneForced"
    .parameter "locale"
    .parameter "style"

    .prologue
    const/4 v0, 0x0

    .line 1539
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1540
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mTimeZone:Ljava/util/TimeZone;

    .line 1541
    iput-boolean p2, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mTimeZoneForced:Z

    .line 1542
    iput-object p3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mLocale:Ljava/util/Locale;

    .line 1543
    iput p4, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStyle:I

    .line 1545
    if-eqz p2, :cond_0

    .line 1546
    const/4 v0, 0x0

    invoke-static {p1, v0, p4, p3}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStandard:Ljava/lang/String;

    .line 1547
    const/4 v0, 0x1

    invoke-static {p1, v0, p4, p3}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mDaylight:Ljava/lang/String;

    .line 1552
    :goto_0
    return-void

    .line 1549
    :cond_0
    iput-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStandard:Ljava/lang/String;

    .line 1550
    iput-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mDaylight:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V
    .locals 4
    .parameter "buffer"
    .parameter "calendar"

    .prologue
    const/16 v2, 0x10

    .line 1571
    iget-boolean v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mTimeZoneForced:Z

    if-eqz v1, :cond_1

    .line 1572
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eqz v1, :cond_0

    .line 1573
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mDaylight:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1585
    :goto_0
    return-void

    .line 1575
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStandard:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1578
    :cond_1
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    .line 1579
    .local v0, timeZone:Ljava/util/TimeZone;
    invoke-virtual {v0}, Ljava/util/TimeZone;->useDaylightTime()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p2, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    if-eqz v1, :cond_2

    .line 1580
    const/4 v1, 0x1

    iget v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStyle:I

    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mLocale:Ljava/util/Locale;

    invoke-static {v0, v1, v2, v3}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 1582
    :cond_2
    const/4 v1, 0x0

    iget v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStyle:I

    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mLocale:Ljava/util/Locale;

    invoke-static {v0, v1, v2, v3}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method public estimateLength()I
    .locals 2

    .prologue
    .line 1558
    iget-boolean v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mTimeZoneForced:Z

    if-eqz v0, :cond_0

    .line 1559
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStandard:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mDaylight:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 1563
    :goto_0
    return v0

    .line 1560
    :cond_0
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;->mStyle:I

    if-nez v0, :cond_1

    .line 1561
    const/4 v0, 0x4

    goto :goto_0

    .line 1563
    :cond_1
    const/16 v0, 0x28

    goto :goto_0
.end method
