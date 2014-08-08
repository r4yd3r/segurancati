.class Lcom/isaacwaller/wikipedia/PreferencesActivity$2;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/PreferencesActivity;->showLanguageDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

.field private final synthetic val$entryValues:Ljava/util/List;

.field private final synthetic val$key:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->val$entryValues:Ljava/util/List;

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 3
    .parameter "dialog"
    .parameter "which"
    .parameter "isChecked"

    .prologue
    .line 100
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->val$key:Ljava/lang/String;

    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$2;->val$entryValues:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 101
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 102
    return-void
.end method
