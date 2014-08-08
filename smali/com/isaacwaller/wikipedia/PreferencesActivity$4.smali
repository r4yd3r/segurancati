.class Lcom/isaacwaller/wikipedia/PreferencesActivity$4;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PreferencesActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$4;)Lcom/isaacwaller/wikipedia/PreferencesActivity;
    .locals 1
    .parameter

    .prologue
    .line 122
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    return-object v0
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 6
    .parameter "preference"

    .prologue
    const/4 v5, 0x1

    .line 125
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    const v4, 0x7f0b0015

    invoke-virtual {v3, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .local v2, title:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    const v4, 0x7f0b003f

    invoke-virtual {v3, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 126
    .local v1, message:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$4;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    const/4 v4, 0x0

    invoke-static {v3, v2, v1, v5, v4}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 128
    .local v0, dialog:Landroid/app/ProgressDialog;
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;

    invoke-direct {v4, p0, p1, v0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$4$1;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$4;Landroid/preference/Preference;Landroid/app/ProgressDialog;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 138
    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 141
    return v5
.end method
