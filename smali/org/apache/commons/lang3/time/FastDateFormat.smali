.class public Lorg/apache/commons/lang3/time/FastDateFormat;
.super Ljava/text/Format;
.source "FastDateFormat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/time/FastDateFormat$CharacterLiteral;,
        Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;,
        Lorg/apache/commons/lang3/time/FastDateFormat$PaddedNumberField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$Pair;,
        Lorg/apache/commons/lang3/time/FastDateFormat$Rule;,
        Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TextField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNumberRule;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TwentyFourHourField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitMonthField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitNumberField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitYearField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedMonthField;,
        Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedNumberField;
    }
.end annotation


# static fields
.field public static final FULL:I = 0x0

.field public static final LONG:I = 0x1

.field public static final MEDIUM:I = 0x2

.field public static final SHORT:I = 0x3

.field private static final cDateInstanceCache:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lorg/apache/commons/lang3/time/FastDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final cDateTimeInstanceCache:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lorg/apache/commons/lang3/time/FastDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static cDefaultPattern:Ljava/lang/String; = null

.field private static final cInstanceCache:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/apache/commons/lang3/time/FastDateFormat;",
            "Lorg/apache/commons/lang3/time/FastDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final cTimeInstanceCache:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Lorg/apache/commons/lang3/time/FastDateFormat;",
            ">;"
        }
    .end annotation
.end field

.field private static final cTimeZoneDisplayCache:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final mLocale:Ljava/util/Locale;

.field private final mLocaleForced:Z

.field private transient mMaxLengthEstimate:I

.field private final mPattern:Ljava/lang/String;

.field private transient mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

.field private final mTimeZone:Ljava/util/TimeZone;

.field private final mTimeZoneForced:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x7

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    .line 113
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    .line 115
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)V
    .locals 3
    .parameter "pattern"
    .parameter "timeZone"
    .parameter "locale"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 535
    invoke-direct {p0}, Ljava/text/Format;-><init>()V

    .line 536
    if-nez p1, :cond_0

    .line 537
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The pattern must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 539
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    .line 541
    if-eqz p2, :cond_3

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    .line 542
    if-nez p2, :cond_1

    .line 543
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object p2

    .line 545
    :cond_1
    iput-object p2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    .line 547
    if-eqz p3, :cond_4

    :goto_1
    iput-boolean v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocaleForced:Z

    .line 548
    if-nez p3, :cond_2

    .line 549
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 551
    :cond_2
    iput-object p3, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    .line 552
    return-void

    :cond_3
    move v0, v2

    .line 541
    goto :goto_0

    :cond_4
    move v1, v2

    .line 547
    goto :goto_1
.end method

.method public static getDateInstance(I)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"

    .prologue
    const/4 v0, 0x0

    .line 235
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateInstance(ILjava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"
    .parameter "locale"

    .prologue
    .line 250
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateInstance(ILjava/util/TimeZone;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"
    .parameter "timeZone"

    .prologue
    .line 266
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDateInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 10
    .parameter "style"
    .parameter "timeZone"
    .parameter "locale"

    .prologue
    .line 281
    const-class v7, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 282
    .local v3, key:Ljava/lang/Integer;
    if-eqz p1, :cond_2

    .line 283
    new-instance v4, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p1}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 286
    .end local v3           #key:Ljava/lang/Integer;
    :goto_0
    if-nez p2, :cond_0

    .line 287
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p2

    .line 290
    :cond_0
    new-instance v3, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p2}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 292
    .local v3, key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang3/time/FastDateFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    .local v1, format:Lorg/apache/commons/lang3/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 295
    :try_start_1
    invoke-static {p0, p2}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 296
    .local v2, formatter:Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 297
    .local v5, pattern:Ljava/lang/String;
    invoke-static {v5, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v1

    .line 298
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    .line 304
    .end local v2           #formatter:Ljava/text/SimpleDateFormat;
    .end local v5           #pattern:Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 300
    :catch_0
    move-exception v0

    .line 301
    .local v0, ex:Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "No date pattern for locale: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 281
    .end local v0           #ex:Ljava/lang/ClassCastException;
    .end local v1           #format:Lorg/apache/commons/lang3/time/FastDateFormat;
    .end local v3           #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .local v3, key:Ljava/lang/Integer;
    :cond_2
    move-object v4, v3

    .local v4, key:Ljava/lang/Object;
    goto :goto_0
.end method

.method public static getDateTimeInstance(II)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"

    .prologue
    const/4 v0, 0x0

    .line 407
    invoke-static {p0, p1, v0, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateTimeInstance(IILjava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"
    .parameter "locale"

    .prologue
    .line 424
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getDateTimeInstance(IILjava/util/TimeZone;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "dateStyle"
    .parameter "timeStyle"
    .parameter "timeZone"

    .prologue
    .line 442
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getDateTimeInstance(IILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 10
    .parameter "dateStyle"
    .parameter "timeStyle"
    .parameter "timeZone"
    .parameter "locale"

    .prologue
    .line 460
    const-class v7, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    new-instance v3, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-direct {v3, v6, v8}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 461
    .local v3, key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    if-eqz p2, :cond_2

    .line 462
    new-instance v4, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p2}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 464
    .end local v3           #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    .local v4, key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    :goto_0
    if-nez p3, :cond_0

    .line 465
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 467
    :cond_0
    new-instance v3, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p3}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 469
    .end local v4           #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    .restart local v3       #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang3/time/FastDateFormat;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 470
    .local v1, format:Lorg/apache/commons/lang3/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 472
    :try_start_1
    invoke-static {p0, p1, p3}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 474
    .local v2, formatter:Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 475
    .local v5, pattern:Ljava/lang/String;
    invoke-static {v5, p2, p3}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v1

    .line 476
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cDateTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    .line 482
    .end local v2           #formatter:Ljava/text/SimpleDateFormat;
    .end local v5           #pattern:Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 478
    :catch_0
    move-exception v0

    .line 479
    .local v0, ex:Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "No date time pattern for locale: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 460
    .end local v0           #ex:Ljava/lang/ClassCastException;
    .end local v1           #format:Lorg/apache/commons/lang3/time/FastDateFormat;
    .end local v3           #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    .restart local v3       #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    :cond_2
    move-object v4, v3

    .end local v3           #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    .restart local v4       #key:Lorg/apache/commons/lang3/time/FastDateFormat$Pair;
    goto :goto_0
.end method

.method private static declared-synchronized getDefaultPattern()Ljava/lang/String;
    .locals 2

    .prologue
    .line 513
    const-class v1, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 514
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0}, Ljava/text/SimpleDateFormat;-><init>()V

    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;

    .line 516
    :cond_0
    sget-object v0, Lorg/apache/commons/lang3/time/FastDateFormat;->cDefaultPattern:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 513
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getInstance()Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 154
    invoke-static {}, Lorg/apache/commons/lang3/time/FastDateFormat;->getDefaultPattern()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1, v1}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "pattern"

    .prologue
    const/4 v0, 0x0

    .line 167
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "pattern"
    .parameter "locale"

    .prologue
    .line 196
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;Ljava/util/TimeZone;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "pattern"
    .parameter "timeZone"

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 4
    .parameter "pattern"
    .parameter "timeZone"
    .parameter "locale"

    .prologue
    .line 213
    const-class v3, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v3

    :try_start_0
    new-instance v0, Lorg/apache/commons/lang3/time/FastDateFormat;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;-><init>(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 214
    .local v0, emptyFormat:Lorg/apache/commons/lang3/time/FastDateFormat;
    sget-object v2, Lorg/apache/commons/lang3/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang3/time/FastDateFormat;

    .line 215
    .local v1, format:Lorg/apache/commons/lang3/time/FastDateFormat;
    if-nez v1, :cond_0

    .line 216
    move-object v1, v0

    .line 217
    invoke-virtual {v1}, Lorg/apache/commons/lang3/time/FastDateFormat;->init()V

    .line 218
    sget-object v2, Lorg/apache/commons/lang3/time/FastDateFormat;->cInstanceCache:Ljava/util/Map;

    invoke-interface {v2, v1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    :cond_0
    monitor-exit v3

    return-object v1

    .line 213
    .end local v0           #emptyFormat:Lorg/apache/commons/lang3/time/FastDateFormat;
    .end local v1           #format:Lorg/apache/commons/lang3/time/FastDateFormat;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static getTimeInstance(I)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"

    .prologue
    const/4 v0, 0x0

    .line 319
    invoke-static {p0, v0, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeInstance(ILjava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"
    .parameter "locale"

    .prologue
    .line 334
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static getTimeInstance(ILjava/util/TimeZone;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 1
    .parameter "style"
    .parameter "timeZone"

    .prologue
    .line 350
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized getTimeInstance(ILjava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;
    .locals 10
    .parameter "style"
    .parameter "timeZone"
    .parameter "locale"

    .prologue
    .line 366
    const-class v7, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v7

    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 367
    .local v3, key:Ljava/lang/Integer;
    if-eqz p1, :cond_3

    .line 368
    new-instance v4, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v4, v3, p1}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 370
    .end local v3           #key:Ljava/lang/Integer;
    :goto_0
    if-eqz p2, :cond_2

    .line 371
    new-instance v3, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;

    invoke-direct {v3, v4, p2}, Lorg/apache/commons/lang3/time/FastDateFormat$Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 374
    :goto_1
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/lang3/time/FastDateFormat;

    .line 375
    .local v1, format:Lorg/apache/commons/lang3/time/FastDateFormat;
    if-nez v1, :cond_1

    .line 376
    if-nez p2, :cond_0

    .line 377
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object p2

    .line 381
    :cond_0
    :try_start_1
    invoke-static {p0, p2}, Ljava/text/DateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v2

    check-cast v2, Ljava/text/SimpleDateFormat;

    .line 382
    .local v2, formatter:Ljava/text/SimpleDateFormat;
    invoke-virtual {v2}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v5

    .line 383
    .local v5, pattern:Ljava/lang/String;
    invoke-static {v5, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->getInstance(Ljava/lang/String;Ljava/util/TimeZone;Ljava/util/Locale;)Lorg/apache/commons/lang3/time/FastDateFormat;

    move-result-object v1

    .line 384
    sget-object v6, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeInstanceCache:Ljava/util/Map;

    invoke-interface {v6, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_0

    .line 390
    .end local v2           #formatter:Ljava/text/SimpleDateFormat;
    .end local v5           #pattern:Ljava/lang/String;
    :cond_1
    monitor-exit v7

    return-object v1

    .line 386
    :catch_0
    move-exception v0

    .line 387
    .local v0, ex:Ljava/lang/ClassCastException;
    :try_start_2
    new-instance v6, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "No date pattern for locale: "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 366
    .end local v0           #ex:Ljava/lang/ClassCastException;
    .end local v1           #format:Lorg/apache/commons/lang3/time/FastDateFormat;
    :catchall_0
    move-exception v6

    monitor-exit v7

    throw v6

    :cond_2
    move-object v3, v4

    goto :goto_1

    .restart local v3       #key:Ljava/lang/Integer;
    :cond_3
    move-object v4, v3

    .local v4, key:Ljava/lang/Object;
    goto :goto_0
.end method

.method static declared-synchronized getTimeZoneDisplay(Ljava/util/TimeZone;ZILjava/util/Locale;)Ljava/lang/String;
    .locals 4
    .parameter "tz"
    .parameter "daylight"
    .parameter "style"
    .parameter "locale"

    .prologue
    .line 497
    const-class v3, Lorg/apache/commons/lang3/time/FastDateFormat;

    monitor-enter v3

    :try_start_0
    new-instance v0, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;-><init>(Ljava/util/TimeZone;ZILjava/util/Locale;)V

    .line 498
    .local v0, key:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;
    sget-object v2, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 499
    .local v1, value:Ljava/lang/String;
    if-nez v1, :cond_0

    .line 501
    invoke-virtual {p0, p1, p2, p3}, Ljava/util/TimeZone;->getDisplayName(ZILjava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 502
    sget-object v2, Lorg/apache/commons/lang3/time/FastDateFormat;->cTimeZoneDisplayCache:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 504
    :cond_0
    monitor-exit v3

    return-object v1

    .line 497
    .end local v0           #key:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneDisplayKey;
    .end local v1           #value:Ljava/lang/String;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 0
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 1033
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1034
    invoke-virtual {p0}, Lorg/apache/commons/lang3/time/FastDateFormat;->init()V

    .line 1035
    return-void
.end method


# virtual methods
.method protected applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 4
    .parameter "calendar"
    .parameter "buf"

    .prologue
    .line 888
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    .line 889
    .local v2, rules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    array-length v1, v3

    .line 890
    .local v1, len:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 893
    return-object p2

    .line 891
    :cond_0
    aget-object v3, v2, v0

    invoke-interface {v3, p2, p1}, Lorg/apache/commons/lang3/time/FastDateFormat$Rule;->appendTo(Ljava/lang/StringBuffer;Ljava/util/Calendar;)V

    .line 890
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 980
    instance-of v2, p1, Lorg/apache/commons/lang3/time/FastDateFormat;

    if-nez v2, :cond_1

    .line 993
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 983
    check-cast v0, Lorg/apache/commons/lang3/time/FastDateFormat;

    .line 985
    .local v0, other:Lorg/apache/commons/lang3/time/FastDateFormat;
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 986
    :cond_2
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 987
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    iget-object v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 988
    :cond_4
    iget-boolean v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    iget-boolean v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    if-ne v2, v3, :cond_0

    .line 989
    iget-boolean v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocaleForced:Z

    iget-boolean v3, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocaleForced:Z

    if-ne v2, v3, :cond_0

    .line 991
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public format(J)Ljava/lang/String;
    .locals 1
    .parameter "millis"

    .prologue
    .line 810
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Calendar;)Ljava/lang/String;
    .locals 2
    .parameter "calendar"

    .prologue
    .line 832
    new-instance v0, Ljava/lang/StringBuffer;

    iget v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mMaxLengthEstimate:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;)Ljava/lang/String;
    .locals 3
    .parameter "date"

    .prologue
    .line 820
    new-instance v0, Ljava/util/GregorianCalendar;

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 821
    .local v0, c:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 822
    new-instance v1, Ljava/lang/StringBuffer;

    iget v2, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mMaxLengthEstimate:I

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lorg/apache/commons/lang3/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 1
    .parameter "millis"
    .parameter "buf"

    .prologue
    .line 845
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/lang/Object;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .locals 3
    .parameter "obj"
    .parameter "toAppendTo"
    .parameter "pos"

    .prologue
    .line 790
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_0

    .line 791
    check-cast p1, Ljava/util/Date;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 795
    :goto_0
    return-object v0

    .line 792
    .restart local p1
    :cond_0
    instance-of v0, p1, Ljava/util/Calendar;

    if-eqz v0, :cond_1

    .line 793
    check-cast p1, Ljava/util/Calendar;

    .end local p1
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_0

    .line 794
    .restart local p1
    :cond_1
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_2

    .line 795
    check-cast p1, Ljava/lang/Long;

    .end local p1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->format(JLjava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    goto :goto_0

    .line 797
    .restart local p1
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v0, "Unknown class: "

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 798
    if-nez p1, :cond_3

    const-string v0, "<null>"

    :goto_1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 797
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 798
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public format(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 1
    .parameter "calendar"
    .parameter "buf"

    .prologue
    .line 871
    iget-boolean v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    if-eqz v0, :cond_0

    .line 872
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 873
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object p1

    .end local p1
    check-cast p1, Ljava/util/Calendar;

    .line 874
    .restart local p1
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {p1, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 876
    :cond_0
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v0

    return-object v0
.end method

.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 2
    .parameter "date"
    .parameter "buf"

    .prologue
    .line 857
    new-instance v0, Ljava/util/GregorianCalendar;

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-direct {v0, v1}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;)V

    .line 858
    .local v0, c:Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 859
    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/lang3/time/FastDateFormat;->applyRules(Ljava/util/Calendar;Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v1

    return-object v1
.end method

.method public getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 954
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    return-object v0
.end method

.method public getMaxLengthEstimate()I
    .locals 1

    .prologue
    .line 967
    iget v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mMaxLengthEstimate:I

    return v0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 920
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    return-object v0
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .locals 1

    .prologue
    .line 934
    iget-object v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    return-object v0
.end method

.method public getTimeZoneOverridesCalendar()Z
    .locals 1

    .prologue
    .line 945
    iget-boolean v0, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1003
    const/4 v0, 0x0

    .line 1004
    .local v0, total:I
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1005
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1006
    iget-boolean v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    if-eqz v1, :cond_0

    move v1, v2

    :goto_0
    add-int/2addr v0, v1

    .line 1007
    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    invoke-virtual {v1}, Ljava/util/Locale;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 1008
    iget-boolean v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocaleForced:Z

    if-eqz v1, :cond_1

    :goto_1
    add-int/2addr v0, v2

    .line 1009
    return v0

    :cond_0
    move v1, v3

    .line 1006
    goto :goto_0

    :cond_1
    move v2, v3

    .line 1008
    goto :goto_1
.end method

.method protected init()V
    .locals 4

    .prologue
    .line 558
    invoke-virtual {p0}, Lorg/apache/commons/lang3/time/FastDateFormat;->parsePattern()Ljava/util/List;

    move-result-object v2

    .line 559
    .local v2, rulesList:Ljava/util/List;,"Ljava/util/List<Lorg/apache/commons/lang3/time/FastDateFormat$Rule;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    iput-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    .line 561
    const/4 v1, 0x0

    .line 562
    .local v1, len:I
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    array-length v0, v3

    .local v0, i:I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-gez v0, :cond_0

    .line 566
    iput v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mMaxLengthEstimate:I

    .line 567
    return-void

    .line 563
    :cond_0
    iget-object v3, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mRules:[Lorg/apache/commons/lang3/time/FastDateFormat$Rule;

    aget-object v3, v3, v0

    invoke-interface {v3}, Lorg/apache/commons/lang3/time/FastDateFormat$Rule;->estimateLength()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0
.end method

.method public parseObject(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/lang/Object;
    .locals 1
    .parameter "source"
    .parameter "pos"

    .prologue
    const/4 v0, 0x0

    .line 907
    invoke-virtual {p2, v0}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 908
    invoke-virtual {p2, v0}, Ljava/text/ParsePosition;->setErrorIndex(I)V

    .line 909
    const/4 v0, 0x0

    return-object v0
.end method

.method protected parsePattern()Ljava/util/List;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/commons/lang3/time/FastDateFormat$Rule;",
            ">;"
        }
    .end annotation

    .prologue
    .line 578
    new-instance v16, Ljava/text/DateFormatSymbols;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v20, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/text/DateFormatSymbols;-><init>(Ljava/util/Locale;)V

    .line 579
    .local v16, symbols:Ljava/text/DateFormatSymbols;
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 581
    .local v12, rules:Ljava/util/List;,"Ljava/util/List<Lorg/apache/commons/lang3/time/FastDateFormat$Rule;>;"
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getEras()[Ljava/lang/String;

    move-result-object v5

    .line 582
    .local v5, ERAs:[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getMonths()[Ljava/lang/String;

    move-result-object v10

    .line 583
    .local v10, months:[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getShortMonths()[Ljava/lang/String;

    move-result-object v13

    .line 584
    .local v13, shortMonths:[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getWeekdays()[Ljava/lang/String;

    move-result-object v19

    .line 585
    .local v19, weekdays:[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getShortWeekdays()[Ljava/lang/String;

    move-result-object v14

    .line 586
    .local v14, shortWeekdays:[Ljava/lang/String;
    invoke-virtual/range {v16 .. v16}, Ljava/text/DateFormatSymbols;->getAmPmStrings()[Ljava/lang/String;

    move-result-object v4

    .line 588
    .local v4, AmPmStrings:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v9

    .line 589
    .local v9, length:I
    const/16 v20, 0x1

    move/from16 v0, v20

    new-array v8, v0, [I

    .line 591
    .local v8, indexRef:[I
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    if-lt v7, v9, :cond_1

    .line 697
    :cond_0
    return-object v12

    .line 592
    :cond_1
    const/16 v20, 0x0

    aput v7, v8, v20

    .line 593
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v8}, Lorg/apache/commons/lang3/time/FastDateFormat;->parseToken(Ljava/lang/String;[I)Ljava/lang/String;

    move-result-object v17

    .line 594
    .local v17, token:Ljava/lang/String;
    const/16 v20, 0x0

    aget v7, v8, v20

    .line 596
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v18

    .line 597
    .local v18, tokenLen:I
    if-eqz v18, :cond_0

    .line 602
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 604
    .local v6, c:C
    sparse-switch v6, :sswitch_data_0

    .line 691
    new-instance v20, Ljava/lang/IllegalArgumentException;

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Illegal pattern component: "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v20

    .line 606
    :sswitch_0
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-direct {v11, v0, v5}, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 694
    .local v11, rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :goto_1
    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 591
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 609
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_1
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_2

    .line 610
    const/16 v20, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 611
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 612
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_2
    sget-object v11, Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitYearField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitYearField;

    .line 614
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 616
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_2
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_3

    .line 617
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v11, v0, v10}, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 618
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_3
    const/16 v20, 0x3

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_4

    .line 619
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;

    const/16 v20, 0x2

    move/from16 v0, v20

    invoke-direct {v11, v0, v13}, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 620
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_4
    const/16 v20, 0x2

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_5

    .line 621
    sget-object v11, Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitMonthField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitMonthField;

    .line 622
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 623
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_5
    sget-object v11, Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedMonthField;->INSTANCE:Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedMonthField;

    .line 625
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 627
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_3
    const/16 v20, 0x5

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 628
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 630
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_4
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;

    const/16 v20, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang3/time/FastDateFormat$TwelveHourField;-><init>(Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;)V

    .line 631
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 633
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_5
    const/16 v20, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 634
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto :goto_1

    .line 636
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_6
    const/16 v20, 0xc

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 637
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 639
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_7
    const/16 v20, 0xd

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 640
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 642
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_8
    const/16 v20, 0xe

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 643
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 645
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_9
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;

    const/16 v21, 0x7

    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-ge v0, v1, :cond_6

    move-object/from16 v20, v14

    :goto_2
    move/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v11, v0, v1}, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 646
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_6
    move-object/from16 v20, v19

    .line 645
    goto :goto_2

    .line 648
    :sswitch_a
    const/16 v20, 0x6

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 649
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 651
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_b
    const/16 v20, 0x8

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 652
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 654
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_c
    const/16 v20, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 655
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 657
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_d
    const/16 v20, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 658
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 660
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_e
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;

    const/16 v20, 0x9

    move/from16 v0, v20

    invoke-direct {v11, v0, v4}, Lorg/apache/commons/lang3/time/FastDateFormat$TextField;-><init>(I[Ljava/lang/String;)V

    .line 661
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 663
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_f
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TwentyFourHourField;

    const/16 v20, 0xb

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang3/time/FastDateFormat$TwentyFourHourField;-><init>(Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;)V

    .line 664
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 666
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_10
    const/16 v20, 0xa

    move-object/from16 v0, p0

    move/from16 v1, v20

    move/from16 v2, v18

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/time/FastDateFormat;->selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;

    move-result-object v11

    .line 667
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 669
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_11
    const/16 v20, 0x4

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_7

    .line 670
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;ZLjava/util/Locale;I)V

    .line 671
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 672
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_7
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZone:Ljava/util/TimeZone;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mTimeZoneForced:Z

    move/from16 v21, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/lang3/time/FastDateFormat;->mLocale:Ljava/util/Locale;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move-object/from16 v0, v20

    move/from16 v1, v21

    move-object/from16 v2, v22

    move/from16 v3, v23

    invoke-direct {v11, v0, v1, v2, v3}, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNameRule;-><init>(Ljava/util/TimeZone;ZLjava/util/Locale;I)V

    .line 674
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 676
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_12
    const/16 v20, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_8

    .line 677
    sget-object v11, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNumberRule;->INSTANCE_NO_COLON:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNumberRule;

    .line 678
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 679
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_8
    sget-object v11, Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNumberRule;->INSTANCE_COLON:Lorg/apache/commons/lang3/time/FastDateFormat$TimeZoneNumberRule;

    .line 681
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 683
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :sswitch_13
    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v15

    .line 684
    .local v15, sub:Ljava/lang/String;
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v20

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_9

    .line 685
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$CharacterLiteral;

    const/16 v20, 0x0

    move/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/String;->charAt(I)C

    move-result v20

    move/from16 v0, v20

    invoke-direct {v11, v0}, Lorg/apache/commons/lang3/time/FastDateFormat$CharacterLiteral;-><init>(C)V

    .line 686
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 687
    .end local v11           #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    :cond_9
    new-instance v11, Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;

    invoke-direct {v11, v15}, Lorg/apache/commons/lang3/time/FastDateFormat$StringLiteral;-><init>(Ljava/lang/String;)V

    .line 689
    .restart local v11       #rule:Lorg/apache/commons/lang3/time/FastDateFormat$Rule;
    goto/16 :goto_1

    .line 604
    nop

    :sswitch_data_0
    .sparse-switch
        0x27 -> :sswitch_13
        0x44 -> :sswitch_a
        0x45 -> :sswitch_9
        0x46 -> :sswitch_b
        0x47 -> :sswitch_0
        0x48 -> :sswitch_5
        0x4b -> :sswitch_10
        0x4d -> :sswitch_2
        0x53 -> :sswitch_8
        0x57 -> :sswitch_d
        0x5a -> :sswitch_12
        0x61 -> :sswitch_e
        0x64 -> :sswitch_3
        0x68 -> :sswitch_4
        0x6b -> :sswitch_f
        0x6d -> :sswitch_6
        0x73 -> :sswitch_7
        0x77 -> :sswitch_c
        0x79 -> :sswitch_1
        0x7a -> :sswitch_11
    .end sparse-switch
.end method

.method protected parseToken(Ljava/lang/String;[I)Ljava/lang/String;
    .locals 12
    .parameter "pattern"
    .parameter "indexRef"

    .prologue
    const/16 v11, 0x61

    const/16 v10, 0x5a

    const/16 v9, 0x41

    const/16 v8, 0x27

    const/4 v6, 0x0

    .line 708
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 710
    .local v0, buf:Ljava/lang/StringBuilder;
    aget v2, p2, v6

    .line 711
    .local v2, i:I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 713
    .local v4, length:I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 714
    .local v1, c:C
    if-lt v1, v9, :cond_0

    if-le v1, v10, :cond_1

    :cond_0
    if-lt v1, v11, :cond_4

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_4

    .line 717
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 719
    :goto_0
    add-int/lit8 v7, v2, 0x1

    if-lt v7, v4, :cond_3

    .line 755
    :cond_2
    :goto_1
    aput v2, p2, v6

    .line 756
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 720
    :cond_3
    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 721
    .local v5, peek:C
    if-ne v5, v1, :cond_2

    .line 722
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 723
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 730
    .end local v5           #peek:C
    :cond_4
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 732
    const/4 v3, 0x0

    .line 734
    .local v3, inLiteral:Z
    :goto_2
    if-ge v2, v4, :cond_2

    .line 735
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 737
    if-ne v1, v8, :cond_7

    .line 738
    add-int/lit8 v7, v2, 0x1

    if-ge v7, v4, :cond_5

    add-int/lit8 v7, v2, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_5

    .line 740
    add-int/lit8 v2, v2, 0x1

    .line 741
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 734
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 743
    :cond_5
    if-eqz v3, :cond_6

    move v3, v6

    .line 745
    :goto_4
    goto :goto_3

    .line 743
    :cond_6
    const/4 v3, 0x1

    goto :goto_4

    .line 745
    :cond_7
    if-nez v3, :cond_a

    .line 746
    if-lt v1, v9, :cond_8

    if-le v1, v10, :cond_9

    :cond_8
    if-lt v1, v11, :cond_a

    const/16 v7, 0x7a

    if-gt v1, v7, :cond_a

    .line 747
    :cond_9
    add-int/lit8 v2, v2, -0x1

    .line 748
    goto :goto_1

    .line 750
    :cond_a
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3
.end method

.method protected selectNumberRule(II)Lorg/apache/commons/lang3/time/FastDateFormat$NumberRule;
    .locals 1
    .parameter "field"
    .parameter "padding"

    .prologue
    .line 767
    packed-switch p2, :pswitch_data_0

    .line 773
    new-instance v0, Lorg/apache/commons/lang3/time/FastDateFormat$PaddedNumberField;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/lang3/time/FastDateFormat$PaddedNumberField;-><init>(II)V

    :goto_0
    return-object v0

    .line 769
    :pswitch_0
    new-instance v0, Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang3/time/FastDateFormat$UnpaddedNumberField;-><init>(I)V

    goto :goto_0

    .line 771
    :pswitch_1
    new-instance v0, Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitNumberField;

    invoke-direct {v0, p1}, Lorg/apache/commons/lang3/time/FastDateFormat$TwoDigitNumberField;-><init>(I)V

    goto :goto_0

    .line 767
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1019
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FastDateFormat["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/commons/lang3/time/FastDateFormat;->mPattern:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
