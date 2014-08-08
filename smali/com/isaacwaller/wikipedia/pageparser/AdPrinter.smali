.class public Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;
.super Ljava/lang/Object;
.source "AdPrinter.java"


# static fields
.field private static LINES:[[Ljava/lang/String;

.field private static PACKAGES:[Ljava/lang/String;

.field private static RANDOM:Ljava/util/Random;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 8
    new-array v0, v6, [Ljava/lang/String;

    .line 9
    const-string v1, "com.siriusapplications.eclairwidgets"

    aput-object v1, v0, v3

    .line 10
    const-string v1, "com.isaacwaller.wikipedia.plus"

    aput-object v1, v0, v4

    .line 11
    const-string v1, "com.siriusapplications.takeoff.release"

    aput-object v1, v0, v5

    .line 8
    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->PACKAGES:[Ljava/lang/String;

    .line 14
    new-array v0, v6, [[Ljava/lang/String;

    .line 15
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "Take control of your Android device"

    aput-object v2, v1, v3

    const-string v2, "Control almost any function of your device,"

    aput-object v2, v1, v4

    const-string v2, "directly from the home screen."

    aput-object v2, v1, v5

    aput-object v1, v0, v3

    .line 16
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "Remove ads with Wikidroid Plus"

    aput-object v2, v1, v3

    const-string v2, "Purchase Wikidroid Plus to remove ads"

    aput-object v2, v1, v4

    const-string v2, "and support the developers!"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 17
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "Takeoff"

    aput-object v2, v1, v3

    const-string v2, "Take to the skies with Takeoff,"

    aput-object v2, v1, v4

    const-string v2, "an arcade flight game for Android."

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    .line 14
    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->LINES:[[Ljava/lang/String;

    .line 20
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->RANDOM:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateAd()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 24
    sget-object v3, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->RANDOM:Ljava/util/Random;

    sget-object v4, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->PACKAGES:[Ljava/lang/String;

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 26
    .local v2, type:I
    sget-object v3, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->PACKAGES:[Ljava/lang/String;

    aget-object v1, v3, v2

    .line 27
    .local v1, packag:Ljava/lang/String;
    sget-object v3, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->LINES:[[Ljava/lang/String;

    aget-object v0, v3, v2

    .line 29
    .local v0, lines:[Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "<a href=\'http://play.google.com/store/apps/details?id=%2$s\' id=\'wikidroid-anchor\'><div id=\'wikidroid-ad\' class=\'wikidroid-ad-%1$d\'><div id=\'wikidroid-ad-inner\' class=\'wikidroid-ad-inner-%1$d\'><span id=\'wikidroid-ad-text1\'>%3$s</span><br /><span id=\'wikidroid-ad-text2\'>%4$s<br />%5$s</span></div></div></a>"

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/Object;

    .line 37
    add-int/lit8 v6, v2, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    aput-object v1, v5, v8

    aget-object v6, v0, v7

    aput-object v6, v5, v9

    const/4 v6, 0x3

    aget-object v7, v0, v8

    aput-object v7, v5, v6

    const/4 v6, 0x4

    aget-object v7, v0, v9

    aput-object v7, v5, v6

    .line 29
    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
