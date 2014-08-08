.class public final enum Lcom/isaacwaller/wikipedia/PageReference$PageType;
.super Ljava/lang/Enum;
.source "PageReference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/PageReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/isaacwaller/wikipedia/PageReference$PageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/isaacwaller/wikipedia/PageReference$PageType;

.field public static final enum HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

.field public static final enum OFFLINE_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

.field public static final enum SEARCH_RESULTS:Lcom/isaacwaller/wikipedia/PageReference$PageType;

.field public static final enum WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 26
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    const-string v1, "HOME_PAGE"

    invoke-direct {v0, v1, v2}, Lcom/isaacwaller/wikipedia/PageReference$PageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 27
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    const-string v1, "SEARCH_RESULTS"

    invoke-direct {v0, v1, v3}, Lcom/isaacwaller/wikipedia/PageReference$PageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->SEARCH_RESULTS:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 28
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    const-string v1, "WIKI_PAGE"

    invoke-direct {v0, v1, v4}, Lcom/isaacwaller/wikipedia/PageReference$PageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 29
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    const-string v1, "OFFLINE_PAGE"

    invoke-direct {v0, v1, v5}, Lcom/isaacwaller/wikipedia/PageReference$PageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->OFFLINE_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 25
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/isaacwaller/wikipedia/PageReference$PageType;

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->SEARCH_RESULTS:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->OFFLINE_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/PageReference$PageType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/isaacwaller/wikipedia/PageReference$PageType;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;

    return-object v0
.end method

.method public static values()[Lcom/isaacwaller/wikipedia/PageReference$PageType;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/isaacwaller/wikipedia/PageReference$PageType;->ENUM$VALUES:[Lcom/isaacwaller/wikipedia/PageReference$PageType;

    array-length v1, v0

    new-array v2, v1, [Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
