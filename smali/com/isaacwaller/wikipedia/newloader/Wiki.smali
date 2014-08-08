.class public Lcom/isaacwaller/wikipedia/newloader/Wiki;
.super Ljava/lang/Object;
.source "Wiki.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private isMinecraftWiki:Z

.field private languagePart:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "languagePart"

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->languagePart:Ljava/lang/String;

    .line 13
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .parameter "isMinecraftWiki"

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-boolean p1, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    .line 17
    return-void
.end method


# virtual methods
.method public getFullScriptPath()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 27
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getServer()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 28
    .local v0, uri:Landroid/net/Uri$Builder;
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getScriptPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 29
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public getLanguagePart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->languagePart:Ljava/lang/String;

    return-object v0
.end method

.method public getRights()Ljava/lang/String;
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    if-eqz v0, :cond_0

    const-string v0, "<a href=\'http://www.curse.com/content/TermsofService.aspx\'>Curse Terms Of Service</a>"

    .line 53
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "Creative Commons Attribution-ShareAlike License"

    goto :goto_0
.end method

.method public getScript()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-boolean v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    if-eqz v0, :cond_0

    const-string v0, "/api.php"

    .line 43
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/w/api.php"

    goto :goto_0
.end method

.method public getScriptPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    if-eqz v0, :cond_0

    const-string v0, "/"

    .line 34
    :goto_0
    return-object v0

    :cond_0
    const-string v0, "/w/"

    goto :goto_0
.end method

.method public getServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    if-eqz v0, :cond_0

    const-string v0, "http://www.minecraftwiki.net"

    .line 48
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "http://"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->languagePart:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".wikipedia.org"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getUrlOfAPIPage()Landroid/net/Uri;
    .locals 2

    .prologue
    .line 20
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getServer()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    .line 21
    .local v0, uri:Landroid/net/Uri$Builder;
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getScriptPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 22
    const-string v1, "api.php"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 23
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-boolean v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->isMinecraftWiki:Z

    if-eqz v0, :cond_0

    const-string v0, "MINECRAFTWIKI"

    .line 58
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/newloader/Wiki;->languagePart:Ljava/lang/String;

    goto :goto_0
.end method
