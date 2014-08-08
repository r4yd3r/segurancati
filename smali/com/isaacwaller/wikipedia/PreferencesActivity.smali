.class public Lcom/isaacwaller/wikipedia/PreferencesActivity;
.super Landroid/preference/PreferenceActivity;
.source "PreferencesActivity.java"


# static fields
.field public static final KEY_FULLSCREEN:Ljava/lang/String; = "com.isaacwaller.wikipedia.FullScreen"

.field public static final KEY_KEEP_SCREEN_ON:Ljava/lang/String; = "com.isaacwaller.wikipedia.KeepScreenOn"

.field public static final KEY_LOAD_HOME_PAGE:Ljava/lang/String; = "loadHomePage"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 64
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->showLanguageDialog(Ljava/lang/String;)V

    return-void
.end method

.method private showLanguageDialog(Ljava/lang/String;)V
    .locals 12
    .parameter "key"

    .prologue
    const/4 v11, 0x1

    .line 65
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 67
    .local v2, dialog:Landroid/app/AlertDialog$Builder;
    const v9, 0x7f0b0015

    invoke-virtual {v2, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    .line 68
    const v9, 0x104000a

    new-instance v10, Lcom/isaacwaller/wikipedia/PreferencesActivity$1;

    invoke-direct {v10, p0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$1;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;)V

    invoke-virtual {v2, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 75
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .local v4, entries:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .local v7, entryValues:Ljava/util/List;,"Ljava/util/List<Ljava/lang/CharSequence;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->getLanugages()Ljava/util/Map;

    move-result-object v8

    .line 80
    .local v8, languages:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    .line 82
    .local v6, entrySet:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v9

    if-nez v9, :cond_1

    .line 92
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "en"

    invoke-interface {v9, p1, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, current:Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    new-array v0, v9, [Z

    .line 95
    .local v0, checked:[Z
    invoke-interface {v7, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v7, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    aput-boolean v11, v0, v9

    .line 97
    :cond_0
    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/CharSequence;

    invoke-interface {v4, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/CharSequence;

    new-instance v10, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;

    invoke-direct {v10, p0, p1, v7}, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {v2, v9, v0, v10}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    .line 106
    new-instance v9, Lcom/isaacwaller/wikipedia/PreferencesActivity$3;

    invoke-direct {v9, p0, v2}, Lcom/isaacwaller/wikipedia/PreferencesActivity$3;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;Landroid/app/AlertDialog$Builder;)V

    invoke-virtual {p0, v9}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 111
    .end local v0           #checked:[Z
    .end local v1           #current:Ljava/lang/String;
    .end local v6           #entrySet:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v8           #languages:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    return-void

    .line 82
    .restart local v6       #entrySet:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    .restart local v8       #languages:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    :try_start_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 83
    .local v5, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 86
    .end local v5           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6           #entrySet:Ljava/util/Set;,"Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;>;"
    .end local v8           #languages:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception v3

    .line 87
    .local v3, e:Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 88
    const v9, 0x7f0b004b

    invoke-static {p0, v9, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v9

    invoke-virtual {v9}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method


# virtual methods
.method getLanugages()Ljava/util/Map;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v9, Lorg/json/JSONObject;

    new-instance v11, Lorg/json/JSONTokener;

    new-instance v12, Ljava/net/URL;

    const-string v13, "http://en.wikipedia.org/w/api.php?action=sitematrix&format=json"

    invoke-direct {v12, v13}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-static {v12}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v11}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 36
    .local v9, siteMatrix:Lorg/json/JSONObject;
    const-string v11, "sitematrix"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 38
    new-instance v5, Ljava/util/TreeMap;

    invoke-direct {v5}, Ljava/util/TreeMap;-><init>()V

    .line 40
    .local v5, languages:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v9}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v7

    .line 41
    .local v7, names:Lorg/json/JSONArray;
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v1

    .line 42
    .local v1, count:I
    const/4 v2, 0x2

    .local v2, i:I
    :goto_0
    if-lt v2, v1, :cond_0

    .line 61
    return-object v5

    .line 43
    :cond_0
    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v12, "[1234567890]*"

    invoke-virtual {v11, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 42
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {v7, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 45
    .local v4, lang:Lorg/json/JSONObject;
    const-string v11, "code"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, code:Ljava/lang/String;
    const-string v11, "name"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 48
    .local v6, name:Ljava/lang/String;
    const-string v11, "site"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 51
    .local v10, sites:Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, j:I
    :goto_1
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v3, v11, :cond_1

    .line 52
    invoke-virtual {v10, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 53
    .local v8, site:Lorg/json/JSONObject;
    const-string v11, "code"

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "wiki"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 56
    invoke-interface {v5, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 115
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 117
    const/high16 v4, 0x7f05

    invoke-virtual {p0, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->addPreferencesFromResource(I)V

    .line 119
    const-string v4, "com.isaacwaller.wikipedia.Language"

    invoke-virtual {p0, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 120
    .local v1, language:Landroid/preference/Preference;
    const-string v4, "language2"

    invoke-virtual {p0, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    .line 122
    .local v2, language2:Landroid/preference/Preference;
    new-instance v3, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;

    invoke-direct {v3, p0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;)V

    .line 145
    .local v3, languageOnClick:Landroid/preference/Preference$OnPreferenceClickListener;
    invoke-virtual {v1, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 146
    invoke-virtual {v2, v3}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 148
    const-string v4, "com.isaacwaller.wikipedia.ExportBookmarks"

    invoke-virtual {p0, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 149
    .local v0, exportBookmarks:Landroid/preference/Preference;
    new-instance v4, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    invoke-direct {v4, p0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;)V

    invoke-virtual {v0, v4}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 175
    return-void
.end method
