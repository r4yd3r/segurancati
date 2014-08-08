.class public Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;
.super Ljava/lang/Object;
.source "HomePagePrinter.java"


# static fields
.field private static final dailyFeatureTemplates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final didYouKnowTemplates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final inTheNewsTemplates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;

    invoke-direct {v0}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;-><init>()V

    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->dailyFeatureTemplates:Ljava/util/Map;

    .line 29
    new-instance v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;

    invoke-direct {v0}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;-><init>()V

    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->inTheNewsTemplates:Ljava/util/Map;

    .line 36
    new-instance v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;

    invoke-direct {v0}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;-><init>()V

    sput-object v0, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->didYouKnowTemplates:Ljava/util/Map;

    .line 41
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static generate(Landroid/content/Context;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/util/Map;)Ljava/lang/String;
    .locals 3
    .parameter "c"
    .parameter "w"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/isaacwaller/wikipedia/newloader/Wiki;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    .local p2, templates:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getLanguagePart()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Language part: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getLanguagePart()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v0, "{{"

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getLanguagePart()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "}}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->parseWithWiki(Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    :goto_0
    return-object v0

    .line 62
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Language part: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getLanguagePart()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 63
    invoke-static {p0}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->notAvailableOnThisWiki(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static final makeHomePage(Lcom/isaacwaller/wikipedia/newloader/Wiki;Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "wiki"
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "homepagetemplate.html"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, result:Ljava/lang/String;
    const-string v1, "DAILY_FEATURE_GOES_HERE"

    sget-object v2, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->dailyFeatureTemplates:Ljava/util/Map;

    invoke-static {p1, p0, v2}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->generate(Landroid/content/Context;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 47
    const-string v1, "IN_THE_NEWS_GOES_HERE"

    sget-object v2, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->inTheNewsTemplates:Ljava/util/Map;

    invoke-static {p1, p0, v2}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->generate(Landroid/content/Context;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 48
    const-string v1, "DID_YOU_KNOW_GOES_HERE"

    sget-object v2, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->didYouKnowTemplates:Ljava/util/Map;

    invoke-static {p1, p0, v2}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;->generate(Landroid/content/Context;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 49
    const-string v2, "SAVED_PAGES_ICON_OPACITY"

    invoke-static {p1}, Lcom/isaacwaller/wikipedia/ProManager;->isPro(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "1.0"

    :goto_0
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 50
    const-string v2, "AD_GOES_HERE"

    invoke-static {p1}, Lcom/isaacwaller/wikipedia/ProManager;->isPro(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, ""

    :goto_1
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 51
    const-string v1, "INITIAL_SCALE"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 53
    return-object v0

    .line 49
    :cond_0
    const-string v1, "0.4"

    goto :goto_0

    .line 50
    :cond_1
    invoke-static {}, Lcom/isaacwaller/wikipedia/pageparser/AdPrinter;->generateAd()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method private static notAvailableOnThisWiki(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .parameter "c"

    .prologue
    .line 74
    const v0, 0x7f0b0057

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static parseWithWiki(Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "wiki"
    .parameter "wikitext"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getUrlOfAPIPage()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?action=parse&text="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&format=json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 69
    .local v1, url:Ljava/net/URL;
    new-instance v0, Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {v1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 70
    .local v0, apiResult:Lorg/json/JSONObject;
    const-string v2, "parse"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "text"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "*"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
