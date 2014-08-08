.class public Lcom/isaacwaller/wikipedia/newloader/WikiManager;
.super Ljava/lang/Object;
.source "WikiManager.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application:[I = null

.field public static final KEY_LANGUAGE:Ljava/lang/String; = "com.isaacwaller.wikipedia.Language"

.field public static final KEY_LANGUAGE_ALT:Ljava/lang/String; = "language2"


# direct methods
.method static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application()[I
    .locals 3

    .prologue
    .line 17
    sget-object v0, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->$SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->values()[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->MINECRAFT_WIKI:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    :try_start_1
    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->WIKIDROID:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_2
    sput-object v0, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->$SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createMinecraftWiki()Lcom/isaacwaller/wikipedia/newloader/Wiki;
    .locals 2

    .prologue
    .line 51
    new-instance v0, Lcom/isaacwaller/wikipedia/newloader/Wiki;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;-><init>(Z)V

    return-object v0
.end method

.method public static createWikipedia(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/newloader/Wiki;
    .locals 1
    .parameter "languagePart"

    .prologue
    .line 47
    new-instance v0, Lcom/isaacwaller/wikipedia/newloader/Wiki;

    invoke-direct {v0, p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;
    .locals 4
    .parameter "c"

    .prologue
    .line 25
    invoke-static {}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->$SWITCH_TABLE$com$isaacwaller$wikipedia$ApplicationManager$Application()[I

    move-result-object v2

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/ApplicationManager;->getApplication(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    move-result-object v3

    invoke-virtual {v3}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 35
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Bad application"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 28
    :pswitch_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 29
    .local v1, prefs:Landroid/content/SharedPreferences;
    const-string v2, "com.isaacwaller.wikipedia.Language"

    const-string v3, "en"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 30
    .local v0, languagePart:Ljava/lang/String;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->createWikipedia(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    .line 32
    .end local v0           #languagePart:Ljava/lang/String;
    .end local v1           #prefs:Landroid/content/SharedPreferences;
    :goto_0
    return-object v2

    :pswitch_1
    invoke-static {}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->createMinecraftWiki()Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    goto :goto_0

    .line 25
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static queryWikiForRandomPage(Lcom/isaacwaller/wikipedia/newloader/Wiki;)Ljava/lang/String;
    .locals 4
    .parameter "wiki"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 41
    new-instance v1, Ljava/net/URL;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getUrlOfAPIPage()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?action=query&list=random&rnnamespace=0&rnlimit=1&format=json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 42
    .local v1, url:Ljava/net/URL;
    new-instance v0, Lorg/json/JSONObject;

    new-instance v2, Lorg/json/JSONTokener;

    invoke-virtual {v1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 43
    .local v0, obj:Lorg/json/JSONObject;
    const-string v2, "query"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "random"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "title"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
