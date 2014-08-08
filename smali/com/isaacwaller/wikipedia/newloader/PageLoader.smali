.class public Lcom/isaacwaller/wikipedia/newloader/PageLoader;
.super Ljava/lang/Object;
.source "PageLoader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final loadPage(Ljava/lang/String;Lcom/isaacwaller/wikipedia/newloader/Wiki;)Lcom/isaacwaller/wikipedia/newloader/Page;
    .locals 24
    .parameter "pageName"
    .parameter "wiki"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/net/MalformedURLException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-virtual/range {p1 .. p1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getUrlOfAPIPage()Landroid/net/Uri;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v20

    const-string v21, "format"

    const-string v22, "json"

    invoke-virtual/range {v20 .. v22}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v20

    .line 26
    const-string v21, "page"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, p0

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v20

    .line 27
    const-string v21, "action"

    const-string v22, "parse"

    invoke-virtual/range {v20 .. v22}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v20

    .line 28
    const-string v21, "redirects"

    const-string v22, "true"

    invoke-virtual/range {v20 .. v22}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Landroid/net/Uri$Builder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 30
    .local v5, apiCall:Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 31
    .local v18, start:J
    new-instance v20, Ljava/net/URL;

    move-object/from16 v0, v20

    invoke-direct {v0, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v20 .. v20}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v8

    .line 33
    .local v8, in:Ljava/io/InputStream;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 34
    .local v11, openStream:J
    invoke-static {v8}, Lcom/isaacwaller/wikipedia/Utils;->slurp(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v6

    .line 36
    .local v6, content:Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    .line 37
    .local v16, slurp:J
    new-instance v15, Lorg/json/JSONObject;

    new-instance v20, Lorg/json/JSONTokener;

    move-object/from16 v0, v20

    invoke-direct {v0, v6}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-direct {v15, v0}, Lorg/json/JSONObject;-><init>(Lorg/json/JSONTokener;)V

    .line 39
    .local v15, result:Lorg/json/JSONObject;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 41
    .local v3, aparse:J
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Open stream: "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v22, v11, v18

    invoke-virtual/range {v21 .. v23}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 42
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Slurp: "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v22, v16, v11

    invoke-virtual/range {v21 .. v23}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    sget-object v20, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v21, Ljava/lang/StringBuilder;

    const-string v22, "Parse: "

    invoke-direct/range {v21 .. v22}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sub-long v22, v3, v16

    invoke-virtual/range {v21 .. v23}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    const-string v20, "parse"

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    .line 47
    .local v14, parse:Lorg/json/JSONObject;
    new-instance v13, Lcom/isaacwaller/wikipedia/newloader/Page;

    invoke-direct {v13}, Lcom/isaacwaller/wikipedia/newloader/Page;-><init>()V

    .line 49
    .local v13, page:Lcom/isaacwaller/wikipedia/newloader/Page;
    const-string v20, "text"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "*"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v13, Lcom/isaacwaller/wikipedia/newloader/Page;->text:Ljava/lang/String;

    .line 50
    const-string v20, "displaytitle"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v20

    iput-object v0, v13, Lcom/isaacwaller/wikipedia/newloader/Page;->displayTitle:Ljava/lang/String;

    .line 51
    move-object/from16 v0, p1

    iput-object v0, v13, Lcom/isaacwaller/wikipedia/newloader/Page;->wiki:Lcom/isaacwaller/wikipedia/newloader/Wiki;

    .line 53
    const-string v20, "langlinks"

    move-object/from16 v0, v20

    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 55
    .local v10, langlinks:Lorg/json/JSONArray;
    new-instance v20, Ljava/util/HashMap;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v20

    iput-object v0, v13, Lcom/isaacwaller/wikipedia/newloader/Page;->langlinks:Ljava/util/Map;

    .line 56
    const/4 v7, 0x0

    .local v7, i:I
    :goto_0
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v20

    move/from16 v0, v20

    if-lt v7, v0, :cond_0

    .line 61
    return-object v13

    .line 57
    :cond_0
    invoke-virtual {v10, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    .line 58
    .local v9, langlink:Lorg/json/JSONObject;
    iget-object v0, v13, Lcom/isaacwaller/wikipedia/newloader/Page;->langlinks:Ljava/util/Map;

    move-object/from16 v20, v0

    const-string v21, "lang"

    move-object/from16 v0, v21

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v22, "*"

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    invoke-interface/range {v20 .. v22}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method
