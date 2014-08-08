.class public Lcom/isaacwaller/wikipedia/ProManager;
.super Ljava/lang/Object;
.source "ProManager.java"


# static fields
.field protected static final KEY_PRO_ACTIVATED:Ljava/lang/String; = "com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated"

.field public static final TAG:Ljava/lang/String; = "ProManager"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isPro(Landroid/content/Context;)Z
    .locals 8
    .parameter "context"

    .prologue
    const/4 v7, 0x0

    .line 15
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 16
    .local v1, manager:Landroid/content/pm/PackageManager;
    const-string v4, "com.isaacwaller.wikipedia.plus"

    const/16 v5, 0x40

    invoke-virtual {v1, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 17
    .local v3, plusInfo:Landroid/content/pm/PackageInfo;
    const-string v4, "com.isaacwaller.wikipedia"

    const/16 v5, 0x40

    invoke-virtual {v1, v4, v5}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 19
    .local v2, meInfo:Landroid/content/pm/PackageInfo;
    iget-object v4, v3, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v4}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v2, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    const/4 v6, 0x0

    aget-object v5, v5, v6

    invoke-virtual {v5}, Landroid/content/pm/Signature;->toCharsString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 22
    .end local v1           #manager:Landroid/content/pm/PackageManager;
    .end local v2           #meInfo:Landroid/content/pm/PackageInfo;
    .end local v3           #plusInfo:Landroid/content/pm/PackageInfo;
    :goto_0
    return v4

    .line 20
    :catch_0
    move-exception v0

    .line 22
    .local v0, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    const-string v5, "com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated"

    invoke-interface {v4, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    goto :goto_0
.end method
