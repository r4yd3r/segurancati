.class Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->onPreferenceClick(Landroid/preference/Preference;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;)Lcom/isaacwaller/wikipedia/PreferencesActivity$5;
    .locals 1
    .parameter

    .prologue
    .line 152
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 154
    const/4 v1, 0x0

    .line 157
    .local v1, error:Z
    :try_start_0
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v3}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v3

    invoke-static {v3}, Lcom/isaacwaller/wikipedia/BookmarkExporter;->saveBookmarks(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    :goto_0
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v3}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v4

    if-eqz v1, :cond_0

    const v3, 0x7f0b0032

    :goto_1
    invoke-virtual {v4, v3}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 165
    .local v2, toastMessage:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;->this$1:Lcom/isaacwaller/wikipedia/PreferencesActivity$5;

    #getter for: Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;
    invoke-static {v3}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5;->access$0(Lcom/isaacwaller/wikipedia/PreferencesActivity$5;)Lcom/isaacwaller/wikipedia/PreferencesActivity;

    move-result-object v3

    new-instance v4, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;

    invoke-direct {v4, p0, v2}, Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1$1;-><init>(Lcom/isaacwaller/wikipedia/PreferencesActivity$5$1;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/isaacwaller/wikipedia/PreferencesActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 170
    return-void

    .line 158
    .end local v2           #toastMessage:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 159
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 160
    const/4 v1, 0x1

    goto :goto_0

    .line 164
    .end local v0           #e:Ljava/io/IOException;
    :cond_0
    const v3, 0x7f0b0033

    goto :goto_1
.end method
