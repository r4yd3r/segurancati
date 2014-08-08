.class Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;
.super Landroid/os/AsyncTask;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ActivateElectionPlusTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;


# direct methods
.method private constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 312
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 312
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    return-void
.end method

.method static synthetic access$2(Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;)Lcom/isaacwaller/wikipedia/WelcomeActivity;
    .locals 1
    .parameter

    .prologue
    .line 312
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    return-object v0
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .parameter

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .locals 11
    .parameter "params"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 316
    aget-object v3, p1, v8

    check-cast v3, Ljava/lang/String;

    .line 317
    .local v3, id:Ljava/lang/String;
    aget-object v1, p1, v7

    check-cast v1, Landroid/app/ProgressDialog;

    .line 319
    .local v1, dialog:Landroid/app/ProgressDialog;
    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, "http://www.siriusapplications.com/wikidroidelectionsurvey/redeem.php?survey_id="

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 320
    .local v6, url:Ljava/lang/String;
    const/4 v5, 0x0

    .line 323
    .local v5, toastText:Ljava/lang/String;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    new-instance v7, Lorg/json/JSONTokener;

    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-static {v8}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v7}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 324
    .local v4, response:Lorg/json/JSONObject;
    const-string v7, "error"

    const-string v8, "status"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 325
    iget-object v7, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    const v8, 0x7f0b005b

    invoke-virtual {v7, v8}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "reason"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 339
    .end local v4           #response:Lorg/json/JSONObject;
    :cond_0
    :goto_0
    move-object v0, v5

    .line 340
    .local v0, _toastText:Ljava/lang/String;
    iget-object v7, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    new-instance v8, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;

    invoke-direct {v8, p0, v0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    invoke-virtual {v7, v8}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 348
    const/4 v7, 0x0

    return-object v7

    .line 326
    .end local v0           #_toastText:Ljava/lang/String;
    .restart local v4       #response:Lorg/json/JSONObject;
    :cond_1
    :try_start_1
    const-string v7, "success"

    const-string v8, "status"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 327
    iget-object v7, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-static {v7}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 328
    .local v2, e:Landroid/content/SharedPreferences$Editor;
    const-string v7, "com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated"

    const/4 v8, 0x1

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 329
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 331
    iget-object v7, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    const v8, 0x7f0b005c

    invoke-virtual {v7, v8}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_0

    .line 333
    .end local v2           #e:Landroid/content/SharedPreferences$Editor;
    .end local v4           #response:Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 334
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 336
    iget-object v7, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    const v8, 0x7f0b005a

    invoke-virtual {v7, v8}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method
