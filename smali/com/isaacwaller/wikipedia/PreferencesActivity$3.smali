.class Lcom/isaacwaller/wikipedia/PreferencesActivity$3;
.super Ljava/lang/Object;
.source "PreferencesActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field private final synthetic val$dialog:Landroid/app/AlertDialog$Builder;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/PreferencesActivity;Landroid/app/AlertDialog$Builder;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$3;->this$0:Lcom/isaacwaller/wikipedia/PreferencesActivity;

    iput-object p2, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$3;->val$dialog:Landroid/app/AlertDialog$Builder;

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/PreferencesActivity$3;->val$dialog:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 109
    return-void
.end method
