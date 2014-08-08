.class public final enum Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
.super Ljava/lang/Enum;
.source "ApplicationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/ApplicationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Application"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/isaacwaller/wikipedia/ApplicationManager$Application;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

.field public static final enum MINECRAFT_WIKI:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

.field public static final enum WIKIDROID:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;


# instance fields
.field packageName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 7
    new-instance v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    const-string v1, "MINECRAFT_WIKI"

    const-string v2, "com.siriusapplications.minecraftwiki"

    invoke-direct {v0, v1, v3, v2}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->MINECRAFT_WIKI:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    .line 8
    new-instance v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    const-string v1, "WIKIDROID"

    const-string v2, "com.isaacwaller.wikipedia"

    invoke-direct {v0, v1, v4, v2}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->WIKIDROID:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    .line 6
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->MINECRAFT_WIKI:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    aput-object v1, v0, v3

    sget-object v1, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->WIKIDROID:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    aput-object v1, v0, v4

    sput-object v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter "packageName"

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 12
    iput-object p3, p0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->packageName:Ljava/lang/String;

    .line 13
    return-void
.end method

.method public static getApplicationFromPackageName(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    .locals 5
    .parameter "packageName"

    .prologue
    .line 16
    invoke-static {}, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->values()[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v3, :cond_0

    .line 20
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    :cond_0
    aget-object v0, v2, v1

    .line 17
    .local v0, a:Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    iget-object v4, v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->packageName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-object v0

    .line 16
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    return-object v0
.end method

.method public static values()[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/isaacwaller/wikipedia/ApplicationManager$Application;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    array-length v1, v0

    new-array v2, v1, [Lcom/isaacwaller/wikipedia/ApplicationManager$Application;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
