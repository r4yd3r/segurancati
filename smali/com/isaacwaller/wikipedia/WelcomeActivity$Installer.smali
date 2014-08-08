.class public final enum Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;
.super Ljava/lang/Enum;
.source "WelcomeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/WelcomeActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Installer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AMAZON_APPSTORE:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

.field public static final enum ANDROID_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

.field public static final enum DEVICE_BUNDLING_NO_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

.field private static final synthetic ENUM$VALUES:[Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 62
    new-instance v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    const-string v1, "ANDROID_MARKET"

    invoke-direct {v0, v1, v2}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ANDROID_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    .line 63
    new-instance v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    const-string v1, "AMAZON_APPSTORE"

    invoke-direct {v0, v1, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->AMAZON_APPSTORE:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    .line 64
    new-instance v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    const-string v1, "DEVICE_BUNDLING_NO_MARKET"

    invoke-direct {v0, v1, v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->DEVICE_BUNDLING_NO_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    .line 61
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ANDROID_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    aput-object v1, v0, v2

    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->AMAZON_APPSTORE:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    aput-object v1, v0, v3

    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->DEVICE_BUNDLING_NO_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    aput-object v1, v0, v4

    sput-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 61
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static final getInstaller()Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ANDROID_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    return-object v0
.end method

.method public static values()[Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    array-length v1, v0

    new-array v2, v1, [Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
