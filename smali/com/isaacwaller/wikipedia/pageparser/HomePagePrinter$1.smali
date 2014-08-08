.class Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;
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
    .line 21
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 22
    const-string v0, "en"

    const-string v1, "Wikipedia:Today\'s featured article/{{#time:F j, Y}}"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    const-string v0, "de"

    const-string v1, "Wikipedia:Hauptseite/Artikel des Tages/{{LOCALDAYNAME}}"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    const-string v0, "it"

    const-string v1, "Pagina principale/2011/Vetrina"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    const-string v0, "fr"

    const-string v1, "Lumi\u00e8re sur/Aujourd\'hui"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    const-string v0, "ja"

    const-string v1, "\u79c0\u9038\u30d4\u30c3\u30af\u30a2\u30c3\u30d7"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    return-void
.end method
