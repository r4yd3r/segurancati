.class Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WikidroidWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;


# direct methods
.method private constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 119
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 119
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    return-void
.end method


# virtual methods
.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .parameter "view"
    .parameter "url"

    .prologue
    const/4 v5, 0x1

    .line 123
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 124
    .local v1, uri:Landroid/net/Uri;
    const-string v2, "market.android.com"

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "play.google.com"

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 126
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 127
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "android.intent.category.BROWSABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 128
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "market://details?id="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "id"

    invoke-virtual {v1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&referrer=utm_source%3Dwikidroid%26utm_medium%3Dbanner%26utm_campaign%3Dwikidroid"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 129
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v2, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    .line 164
    .end local v0           #intent:Landroid/content/Intent;
    :goto_0
    return v5

    .line 133
    :cond_1
    const-string v2, "googleads.g.doubleclick.net"

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 135
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v2, v2, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 151
    :cond_2
    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 152
    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-string v3, "wikipedia.org"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    const-string v3, "minecraftwiki.net"

    invoke-virtual {v2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 154
    :cond_3
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Ljava/lang/String;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v3

    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V
    invoke-static {v2, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$1(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/PageReference;)V

    goto :goto_0

    .line 157
    :cond_4
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 158
    .restart local v0       #intent:Landroid/content/Intent;
    const-string v2, "android.intent.category.BROWSABLE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 160
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v2, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
