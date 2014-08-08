.class Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;
.super Ljava/lang/Object;
.source "WelcomeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;

.field private final synthetic val$_toastText:Ljava/lang/String;

.field private final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->val$_toastText:Ljava/lang/String;

    iput-object p3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->val$dialog:Landroid/app/ProgressDialog;

    .line 340
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 342
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->access$2(Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->val$_toastText:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 343
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 345
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask$1;->this$1:Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;

    #getter for: Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->access$2(Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;)Lcom/isaacwaller/wikipedia/WelcomeActivity;

    move-result-object v0

    #calls: Lcom/isaacwaller/wikipedia/WelcomeActivity;->updateProFeatures()V
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->access$2(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    .line 346
    return-void
.end method
