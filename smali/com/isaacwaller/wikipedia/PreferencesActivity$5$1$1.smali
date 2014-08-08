.class Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;

.field private final synthetic val$toastMessage:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;->this$2:Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;->val$toastMessage:Ljava/lang/String;

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 167
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;->this$2:Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;)Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    move-result-object v0

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;->val$toastMessage:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 168
    return-void
.end method
