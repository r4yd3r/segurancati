.class Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;
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
    .line 36
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 37
    const-string v0, "en"

    const-string v1, "Did you know"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    const-string v0, "de"

    const-string v1, "Wikipedia:Hauptseite/Schon gewusst/{{LOCALDAYNAME}}"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    const-string v0, "it"

    const-string v1, "Pagina principale/Sapevi/{{LOCALDAY}}"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    const-string v0, "fr"

    const-string v1, "Wikip\u00e9dia:Le saviez-vous ?"

    invoke-virtual {p0, v0, v1}, Lcom/isaacwaller/wikipedia/pageparser/HomePagePrinter$3;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1
    return-void
.end method
