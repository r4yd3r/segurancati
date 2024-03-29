.class public abstract Lorg/apache/commons/lang3/text/StrLookup;
.super Ljava/lang/Object;
.source "StrLookup.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final NONE_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/commons/lang3/text/StrLookup",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SYSTEM_PROPERTIES_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/apache/commons/lang3/text/StrLookup",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 49
    new-instance v4, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;-><init>(Ljava/util/Map;)V

    sput-object v4, Lorg/apache/commons/lang3/text/StrLookup;->NONE_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;

    .line 50
    const/4 v1, 0x0

    .line 52
    .local v1, lookup:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<Ljava/lang/String;>;"
    :try_start_0
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v2

    .line 54
    .local v2, propMap:Ljava/util/Map;,"Ljava/util/Map<**>;"
    move-object v3, v2

    .line 55
    .local v3, properties:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v1, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;

    .end local v1           #lookup:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<Ljava/lang/String;>;"
    invoke-direct {v1, v3}, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;-><init>(Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v2           #propMap:Ljava/util/Map;,"Ljava/util/Map<**>;"
    .end local v3           #properties:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v1       #lookup:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<Ljava/lang/String;>;"
    :goto_0
    sput-object v1, Lorg/apache/commons/lang3/text/StrLookup;->SYSTEM_PROPERTIES_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;

    .line 60
    return-void

    .line 56
    .end local v1           #lookup:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<Ljava/lang/String;>;"
    :catch_0
    move-exception v0

    .line 57
    .local v0, ex:Ljava/lang/SecurityException;
    sget-object v1, Lorg/apache/commons/lang3/text/StrLookup;->NONE_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;

    .restart local v1       #lookup:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<Ljava/lang/String;>;"
    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 105
    .local p0, this:Lorg/apache/commons/lang3/text/StrLookup;,"Lorg/apache/commons/lang3/text/StrLookup<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    return-void
.end method

.method public static mapLookup(Ljava/util/Map;)Lorg/apache/commons/lang3/text/StrLookup;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TV;>;)",
            "Lorg/apache/commons/lang3/text/StrLookup",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;TV;>;"
    new-instance v0, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;

    invoke-direct {v0, p0}, Lorg/apache/commons/lang3/text/StrLookup$MapStrLookup;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public static noneLookup()Lorg/apache/commons/lang3/text/StrLookup;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/commons/lang3/text/StrLookup",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 69
    sget-object v0, Lorg/apache/commons/lang3/text/StrLookup;->NONE_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;

    return-object v0
.end method

.method public static systemPropertiesLookup()Lorg/apache/commons/lang3/text/StrLookup;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/apache/commons/lang3/text/StrLookup",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 84
    sget-object v0, Lorg/apache/commons/lang3/text/StrLookup;->SYSTEM_PROPERTIES_LOOKUP:Lorg/apache/commons/lang3/text/StrLookup;

    return-object v0
.end method


# virtual methods
.method public abstract lookup(Ljava/lang/String;)Ljava/lang/String;
.end method
