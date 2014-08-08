.class Lcom/isaacwaller/wikipedia/WelcomeActivity$1;
.super Ljava/util/TimerTask;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;


# direct methods
.method constructor <init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$1;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    .line 213
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity$1;->this$0:Lcom/isaacwaller/wikipedia/WelcomeActivity;

    iget-object v0, v0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->postInvalidate()V

    .line 220
    return-void
.end method
