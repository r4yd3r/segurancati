.class Lcom/isaacwaller/wikipedia/WelcomeActivity$3;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;->savePage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

.field private final synthetic val$progress:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->val$progress:Landroid/app/ProgressDialog;

    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity$3;)Lcom/isaacwaller/wikipedia/WelcomeActivity;
    .locals 1
    .parameter

    .prologue
    .line 532
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 534
    const/4 v2, 0x1

    new-array v1, v2, [I

    .line 535
    .local v1, toastText:[I
    const v2, 0x7f0b003d

    aput v2, v1, v5

    .line 538
    :try_start_0
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v2, v2, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v4, v4, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-static {v3, v2}, Lcom/isaacwaller/wikipedia/OfflinePageSaver;->savePage(Landroid/content/Context;Lcom/isaacwaller/wikipedia/PageReference;)V
    :try_end_0
    .catch Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 549
    :goto_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    new-instance v3, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;->val$progress:Landroid/app/ProgressDialog;

    invoke-direct {v3, p0, v4, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$3$1;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$3;Landroid/app/ProgressDialog;[I)V

    invoke-virtual {v2, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 556
    return-void

    .line 539
    :catch_0
    move-exception v0

    .line 540
    .local v0, e:Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;->printStackTrace()V

    .line 542
    const v2, 0x7f0b003a

    aput v2, v1, v5

    goto :goto_0

    .line 543
    .end local v0           #e:Lcom/isaacwaller/wikipedia/OfflinePageSaver$PageAlreadyExistsException;
    :catch_1
    move-exception v0

    .line 544
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 546
    const v2, 0x7f0b003b

    aput v2, v1, v5

    goto :goto_0
.end method
