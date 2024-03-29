.class Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;
.super Ljava/lang/Object;
.source "FastDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/time/FastDateFormat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeZoneDisplayKey"
.end annotation


# instance fields
.field private final mLocale:Ljava/util/Locale;

.field private final mStyle:I

.field private final mTimeZone:Ljava/util/TimeZone;


# direct methods
.method constructor <init>(Ljava/util/TimeZone;ZILjava/util/Locale;)V
    .locals 1
    .parameter "timeZone"
    .parameter "daylight"
    .parameter "style"
    .parameter "locale"

    .prologue
    .line 1658
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1660
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mTimeZone:Ljava/util/TimeZone;

    .line 1661
    if-eqz p2, :cond_0

    .line 1662
    const/high16 v0, -0x8000

    or-int/2addr p3, v0

    .line 1664
    :cond_0
    iput p3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mStyle:I

    .line 1665
    iput-object p4, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mLocale:Ljava/util/Locale;

    .line 1666
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "obj"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1681
    if-ne p0, p1, :cond_1

    .line 1691
    :cond_0
    :goto_0
    return v1

    .line 1684
    :cond_1
    instance-of v3, p1, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 1685
    check-cast v0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;

    .line 1687
    .local v0, other:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mTimeZone:Ljava/util/TimeZone;

    iget-object v4, v0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1688
    iget v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mStyle:I

    iget v4, v0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mStyle:I

    if-ne v3, v4, :cond_2

    .line 1689
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mLocale:Ljava/util/Locale;

    iget-object v4, v0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mLocale:Ljava/util/Locale;

    invoke-virtual {v3, v4}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_2
    move v1, v2

    .line 1686
    goto :goto_0

    .end local v0           #other:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;
    :cond_3
    move v1, v2

    .line 1691
    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 1673
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mStyle:I

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;->mLocale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
