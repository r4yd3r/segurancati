.class Lcom/isaacwaller/wikipedia/PreferencesActivity$5;
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
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)Lcom/isaacwaller/wikipedia/PreferencesActivity;
    .locals 1
    .parameter

    .prologue
    .line 149
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    return-object v0
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 2
    .parameter "preference"

    .prologue
    .line 152
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;

    invoke-direct {v1, p0}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 171
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 172
    const/4 v0, 0x0

    return v0
.end method
