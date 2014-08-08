.class public Lcom/isaacwaller/wikipedia/newloader/Page;
.super Ljava/lang/Object;
.source "Page.java"


# instance fields
.field protected displayTitle:Ljava/lang/String;

.field protected langlinks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected text:Ljava/lang/String;

.field protected wiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method


# virtual methods
.method public getDisplayTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Page;->displayTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getLanglinks()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Page;->langlinks:Ljava/util/Map;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Page;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getWiki()Lcom/isaacwaller/wikipedia/newloader/Wiki;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Page;->wiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    return-object v0
.end method
