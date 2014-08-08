.class Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;
.super Landroid/webkit/WebChromeClient;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WikidroidWebChromeClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;


# direct methods
.method private constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 91
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 91
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 4
    .parameter "view"
    .parameter "newProgress"

    .prologue
    .line 95
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    add-int/lit8 v1, p2, 0x32

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "onProgressChanged "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->setProgressBarProgress(ILjava/lang/String;)V
    invoke-static {v0, v1, v2}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity;ILjava/lang/String;)V

    .line 96
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2
    .parameter "view"
    .parameter "title"

    .prologue
    .line 102
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v0

    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 103
    return-void
.end method
