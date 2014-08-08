.class public final enum Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;
.super Ljava/lang/Enum;
.source "UnicodeUnescaper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "OPTION"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

.field public static final enum escapePlus:Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 35
    new-instance v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    const-string v1, "escapePlus"

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;->escapePlus:Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    const/4 v0, 0x1

    new-array v0, v0, [Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    sget-object v1, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;->escapePlus:Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    aput-object v1, v0, v2

    sput-object v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;->ENUM$VALUES:[Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;
    .locals 1
    .parameter

    .prologue
    .line 1
    const-class v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    return-object v0
.end method

.method public static values()[Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;->ENUM$VALUES:[Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    array-length v1, v0

    new-array v2, v1, [Lorg/apache/commons/lang3/text/translate/UnicodeUnescaper$OPTION;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
