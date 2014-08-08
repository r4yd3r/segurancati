.class Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$4;

.field private final synthetic val$dialog:Landroid/app/ProgressDialog;

.field private final synthetic val$preference:Landroid/preference/Preference;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$4;Landroid/preference/Preference;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$4;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->val$preference:Landroid/preference/Preference;

    iput-object p3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->val$dialog:Landroid/app/ProgressDialog;

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 130
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$4;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$4;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->val$preference:Landroid/preference/Preference;

    invoke-virtual {v1}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v1

    #calls: Lcom/isaacwaller/wikipedia/PreferencesActivity;->showLanguageDialog(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity;Ljava/lang/String;)V

    .line 132
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$4;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$4;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v0

    new-instance v1, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1$1;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;->val$dialog:Landroid/app/ProgressDialog;

    invoke-direct {v1, p0, v2}, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1$1;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;Landroid/app/ProgressDialog;)V

    invoke-virtual {v0, v1}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 137
    return-void
.end method
