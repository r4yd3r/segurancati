.class Lcom/isaacwaller/wikipedia/WelcomeActivity$5;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

.field private final synthetic val$reference:Lcom/isaacwaller/wikipedia/PageReference;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/PageReference;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->val$reference:Lcom/isaacwaller/wikipedia/PageReference;

    .line 621
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 624
    :try_start_0
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->val$reference:Lcom/isaacwaller/wikipedia/PageReference;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    invoke-virtual {v2, v3}, Lcom/isaacwaller/wikipedia/PageReference;->loadPage(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    move-result-object v2

    iput-object v2, v1, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    .line 625
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadCurrentPage()V
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$3(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 633
    :goto_0
    return-void

    .line 627
    :catch_0
    move-exception v0

    .line 628
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 631
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadErrorPage()V
    invoke-static {v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$4(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    goto :goto_0
.end method
