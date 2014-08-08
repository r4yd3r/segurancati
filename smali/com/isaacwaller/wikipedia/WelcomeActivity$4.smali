.class Lcom/isaacwaller/wikipedia/WelcomeActivity$4;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadRandomPage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    .line 570
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$4;)Lcom/isaacwaller/wikipedia/WelcomeActivity;
    .locals 1
    .parameter

    .prologue
    .line 570
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 573
    :try_start_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-static {v2}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    invoke-static {v2}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->queryWikiForRandomPage(Lcom/isaacwaller/wikipedia/newloader/Wiki;)Ljava/lang/String;

    move-result-object v1

    .line 575
    .local v1, randomPage:Ljava/lang/String;
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    new-instance v3, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;

    invoke-direct {v3, p0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$4;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 585
    .end local v1           #randomPage:Ljava/lang/String;
    :goto_0
    return-void

    .line 581
    :catch_0
    move-exception v0

    .line 582
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 583
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v2, v2, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    const-string v3, "file:///android_asset/loadingerror.html"

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0
.end method
