.class Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$4;

.field private final synthetic val$randomPage:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$4;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$4;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;->val$randomPage:Ljava/lang/String;

    .line 575
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 577
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$4;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$4;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v0

    new-instance v1, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v2, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$4;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;->access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$4;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v3

    .line 578
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$4$1;->val$randomPage:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    .line 577
    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V
    invoke-static {v0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$1(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 579
    return-void
.end method
