.class public Lcom/isaacwaller/wikipedia/ApplicationManager;
.super Ljava/lang/Object;
.source "ApplicationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    }
.end annotation


# static fields
.field private static MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/isaacwaller/wikipedia/ApplicationManager;->MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplication(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    .locals 2
    .parameter "c"

    .prologue
    .line 32
    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager;->MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager;->MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    .line 36
    :goto_0
    return-object v1

    .line 34
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 35
    .local v0, myPackageName:Ljava/lang/String;
    invoke-static {v0}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->getApplicationFromPackageName(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    move-result-object v1

    sput-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager;->MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    .line 36
    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager;->MY_APPLICATION:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    goto :goto_0
.end method
