.class Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;
.super Ljava/util/HashMap;
.source "HomePagePrinter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 30
    const-string v0, "en"

    const-string v1, "In the news"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    const-string v0, "de"

    const-string v1, "Wikipedia:Hauptseite/Aktuelles"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    const-string v0, "it"

    const-string v1, "Pagina principale/Notizie"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    const-string v0, "fr"

    const-string v1, "Accueil actualit\u00e9"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$2;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    return-void
.end method
