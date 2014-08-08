.class Lcom/isaacwaller/wikipedia/WelcomeActivity$2;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;->onCreate(Landroid/os/Bundle;)V
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
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    .line 427
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 8
    .parameter "v"

    .prologue
    const/4 v5, 0x0

    .line 431
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v4, v4, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v4}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    move-result-object v0

    .line 433
    .local v0, hitTestResult:Landroid/webkit/WebView$HitTestResult;
    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getType()I

    move-result v4

    const/4 v6, 0x7

    if-ne v4, v6, :cond_1

    .line 435
    invoke-virtual {v0}, Landroid/webkit/WebView$HitTestResult;->getExtra()Ljava/lang/String;

    move-result-object v3

    .line 436
    .local v3, url:Ljava/lang/String;
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 438
    .local v2, uri:Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v4

    const-string v6, "wikipedia.org"

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 439
    invoke-virtual {v2}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v6, "wiki"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 442
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-static {v4, v2}, Lcom/isaacwaller/wikipedia/HomeScreenShortcutActivity;->getArticleNameFromURL(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v1

    .line 443
    .local v1, title:Ljava/lang/String;
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getApplication()Landroid/app/Application;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Added \'"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\' to queue."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    .line 444
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v4, v4, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mQueueFragment:Lcom/isaacwaller/wikipedia/QueueFragment;

    invoke-virtual {v4, v3}, Lcom/isaacwaller/wikipedia/QueueFragment;->addToQueue(Ljava/lang/String;)V

    .line 447
    .end local v1           #title:Ljava/lang/String;
    :cond_0
    const/4 v4, 0x1

    .line 450
    .end local v2           #uri:Landroid/net/Uri;
    .end local v3           #url:Ljava/lang/String;
    :goto_0
    return v4

    :cond_1
    move v4, v5

    goto :goto_0
.end method
