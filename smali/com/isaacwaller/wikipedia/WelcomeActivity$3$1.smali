.class Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$3;

.field private final synthetic val$progress:Landroid/app/ProgressDialog;

.field private final synthetic val$toastText:[I


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$3;Landroid/app/ProgressDialog;[I)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$3;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->val$progress:Landroid/app/ProgressDialog;

    iput-object p3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->val$toastText:[I

    .line 549
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 551
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->val$progress:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 552
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$3;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$3;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->val$toastText:[I

    const/4 v2, 0x0

    aget v1, v1, v2

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 553
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$3;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$3;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v0

    iget-object v0, v0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->refreshPages()V

    .line 554
    return-void
.end method
