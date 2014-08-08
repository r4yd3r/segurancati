.class public Lorg/apache/commons/lang3/text/translate/EntityArrays;
.super Ljava/lang/Object;
.source "EntityArrays.java"


# static fields
.field private static final APOS_ESCAPE:[[Ljava/lang/String;

.field private static final APOS_UNESCAPE:[[Ljava/lang/String;

.field private static final BASIC_ESCAPE:[[Ljava/lang/String;

.field private static final BASIC_UNESCAPE:[[Ljava/lang/String;

.field private static final HTML40_EXTENDED_ESCAPE:[[Ljava/lang/String;

.field private static final HTML40_EXTENDED_UNESCAPE:[[Ljava/lang/String;

.field private static final ISO8859_1_ESCAPE:[[Ljava/lang/String;

.field private static final ISO8859_1_UNESCAPE:[[Ljava/lang/String;

.field private static final JAVA_CTRL_CHARS_ESCAPE:[[Ljava/lang/String;

.field private static final JAVA_CTRL_CHARS_UNESCAPE:[[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 31
    const/16 v0, 0x60

    new-array v0, v0, [[Ljava/lang/String;

    .line 32
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u00a0"

    aput-object v2, v1, v4

    const-string v2, "&nbsp;"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 33
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u00a1"

    aput-object v2, v1, v4

    const-string v2, "&iexcl;"

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    .line 34
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u00a2"

    aput-object v2, v1, v4

    const-string v2, "&cent;"

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    .line 35
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u00a3"

    aput-object v2, v1, v4

    const-string v2, "&pound;"

    aput-object v2, v1, v5

    aput-object v1, v0, v7

    .line 36
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u00a4"

    aput-object v2, v1, v4

    const-string v2, "&curren;"

    aput-object v2, v1, v5

    aput-object v1, v0, v8

    const/4 v1, 0x5

    .line 37
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00a5"

    aput-object v3, v2, v4

    const-string v3, "&yen;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 38
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00a6"

    aput-object v3, v2, v4

    const-string v3, "&brvbar;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 39
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00a7"

    aput-object v3, v2, v4

    const-string v3, "&sect;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 40
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00a8"

    aput-object v3, v2, v4

    const-string v3, "&uml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 41
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00a9"

    aput-object v3, v2, v4

    const-string v3, "&copy;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 42
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00aa"

    aput-object v3, v2, v4

    const-string v3, "&ordf;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 43
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ab"

    aput-object v3, v2, v4

    const-string v3, "&laquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 44
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ac"

    aput-object v3, v2, v4

    const-string v3, "&not;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 45
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ad"

    aput-object v3, v2, v4

    const-string v3, "&shy;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 46
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ae"

    aput-object v3, v2, v4

    const-string v3, "&reg;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 47
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00af"

    aput-object v3, v2, v4

    const-string v3, "&macr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 48
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b0"

    aput-object v3, v2, v4

    const-string v3, "&deg;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 49
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b1"

    aput-object v3, v2, v4

    const-string v3, "&plusmn;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 50
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b2"

    aput-object v3, v2, v4

    const-string v3, "&sup2;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 51
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b3"

    aput-object v3, v2, v4

    const-string v3, "&sup3;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 52
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b4"

    aput-object v3, v2, v4

    const-string v3, "&acute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 53
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b5"

    aput-object v3, v2, v4

    const-string v3, "&micro;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 54
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b6"

    aput-object v3, v2, v4

    const-string v3, "&para;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 55
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b7"

    aput-object v3, v2, v4

    const-string v3, "&middot;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 56
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b8"

    aput-object v3, v2, v4

    const-string v3, "&cedil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 57
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00b9"

    aput-object v3, v2, v4

    const-string v3, "&sup1;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 58
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ba"

    aput-object v3, v2, v4

    const-string v3, "&ordm;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 59
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00bb"

    aput-object v3, v2, v4

    const-string v3, "&raquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 60
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00bc"

    aput-object v3, v2, v4

    const-string v3, "&frac14;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 61
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00bd"

    aput-object v3, v2, v4

    const-string v3, "&frac12;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 62
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00be"

    aput-object v3, v2, v4

    const-string v3, "&frac34;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 63
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00bf"

    aput-object v3, v2, v4

    const-string v3, "&iquest;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 64
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c0"

    aput-object v3, v2, v4

    const-string v3, "&Agrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 65
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c1"

    aput-object v3, v2, v4

    const-string v3, "&Aacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 66
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c2"

    aput-object v3, v2, v4

    const-string v3, "&Acirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 67
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c3"

    aput-object v3, v2, v4

    const-string v3, "&Atilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 68
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c4"

    aput-object v3, v2, v4

    const-string v3, "&Auml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 69
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c5"

    aput-object v3, v2, v4

    const-string v3, "&Aring;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 70
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c6"

    aput-object v3, v2, v4

    const-string v3, "&AElig;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 71
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c7"

    aput-object v3, v2, v4

    const-string v3, "&Ccedil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x28

    .line 72
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c8"

    aput-object v3, v2, v4

    const-string v3, "&Egrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x29

    .line 73
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00c9"

    aput-object v3, v2, v4

    const-string v3, "&Eacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    .line 74
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00cb"

    aput-object v3, v2, v4

    const-string v3, "&Ecirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    .line 75
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00cc"

    aput-object v3, v2, v4

    const-string v3, "&Euml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    .line 76
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00cd"

    aput-object v3, v2, v4

    const-string v3, "&Igrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    .line 77
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ce"

    aput-object v3, v2, v4

    const-string v3, "&Iacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    .line 78
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00cf"

    aput-object v3, v2, v4

    const-string v3, "&Icirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    .line 79
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d0"

    aput-object v3, v2, v4

    const-string v3, "&Iuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x30

    .line 80
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d1"

    aput-object v3, v2, v4

    const-string v3, "&ETH;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x31

    .line 81
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d2"

    aput-object v3, v2, v4

    const-string v3, "&Ntilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x32

    .line 82
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d3"

    aput-object v3, v2, v4

    const-string v3, "&Ograve;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x33

    .line 83
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d4"

    aput-object v3, v2, v4

    const-string v3, "&Oacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x34

    .line 84
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d5"

    aput-object v3, v2, v4

    const-string v3, "&Ocirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x35

    .line 85
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d6"

    aput-object v3, v2, v4

    const-string v3, "&Otilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x36

    .line 86
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d7"

    aput-object v3, v2, v4

    const-string v3, "&Ouml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x37

    .line 87
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d8"

    aput-object v3, v2, v4

    const-string v3, "&times;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x38

    .line 88
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00d9"

    aput-object v3, v2, v4

    const-string v3, "&Oslash;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x39

    .line 89
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00da"

    aput-object v3, v2, v4

    const-string v3, "&Ugrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    .line 90
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00db"

    aput-object v3, v2, v4

    const-string v3, "&Uacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    .line 91
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00dc"

    aput-object v3, v2, v4

    const-string v3, "&Ucirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    .line 92
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00dd"

    aput-object v3, v2, v4

    const-string v3, "&Uuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    .line 93
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00de"

    aput-object v3, v2, v4

    const-string v3, "&Yacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    .line 94
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00df"

    aput-object v3, v2, v4

    const-string v3, "&THORN;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    .line 95
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e0"

    aput-object v3, v2, v4

    const-string v3, "&szlig;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x40

    .line 96
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e1"

    aput-object v3, v2, v4

    const-string v3, "&agrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x41

    .line 97
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e2"

    aput-object v3, v2, v4

    const-string v3, "&aacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x42

    .line 98
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e3"

    aput-object v3, v2, v4

    const-string v3, "&acirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x43

    .line 99
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e4"

    aput-object v3, v2, v4

    const-string v3, "&atilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x44

    .line 100
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e5"

    aput-object v3, v2, v4

    const-string v3, "&auml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x45

    .line 101
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e5"

    aput-object v3, v2, v4

    const-string v3, "&aring;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x46

    .line 102
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e6"

    aput-object v3, v2, v4

    const-string v3, "&aelig;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x47

    .line 103
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e7"

    aput-object v3, v2, v4

    const-string v3, "&ccedil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x48

    .line 104
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e8"

    aput-object v3, v2, v4

    const-string v3, "&egrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x49

    .line 105
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00e9"

    aput-object v3, v2, v4

    const-string v3, "&eacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    .line 106
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ea"

    aput-object v3, v2, v4

    const-string v3, "&ecirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    .line 107
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00eb"

    aput-object v3, v2, v4

    const-string v3, "&euml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    .line 108
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ec"

    aput-object v3, v2, v4

    const-string v3, "&igrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    .line 109
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ed"

    aput-object v3, v2, v4

    const-string v3, "&iacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    .line 110
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ee"

    aput-object v3, v2, v4

    const-string v3, "&icirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    .line 111
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ef"

    aput-object v3, v2, v4

    const-string v3, "&iuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x50

    .line 112
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f0"

    aput-object v3, v2, v4

    const-string v3, "&eth;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x51

    .line 113
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f1"

    aput-object v3, v2, v4

    const-string v3, "&ntilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x52

    .line 114
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f3"

    aput-object v3, v2, v4

    const-string v3, "&ograve;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x53

    .line 115
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f3"

    aput-object v3, v2, v4

    const-string v3, "&oacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x54

    .line 116
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f4"

    aput-object v3, v2, v4

    const-string v3, "&ocirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x55

    .line 117
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f5"

    aput-object v3, v2, v4

    const-string v3, "&otilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x56

    .line 118
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f6"

    aput-object v3, v2, v4

    const-string v3, "&ouml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x57

    .line 119
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f7"

    aput-object v3, v2, v4

    const-string v3, "&divide;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x58

    .line 120
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f8"

    aput-object v3, v2, v4

    const-string v3, "&oslash;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x59

    .line 121
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00f9"

    aput-object v3, v2, v4

    const-string v3, "&ugrave;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    .line 122
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00fa"

    aput-object v3, v2, v4

    const-string v3, "&uacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    .line 123
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00fb"

    aput-object v3, v2, v4

    const-string v3, "&ucirc;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    .line 124
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00fc"

    aput-object v3, v2, v4

    const-string v3, "&uuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    .line 125
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00fd"

    aput-object v3, v2, v4

    const-string v3, "&yacute;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    .line 126
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00fe"

    aput-object v3, v2, v4

    const-string v3, "&thorn;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    .line 127
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u00ff"

    aput-object v3, v2, v4

    const-string v3, "&yuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    .line 31
    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->ISO8859_1_ESCAPE:[[Ljava/lang/String;

    .line 131
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->ISO8859_1_ESCAPE:[[Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/text/translate/EntityArrays;->invert([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->ISO8859_1_UNESCAPE:[[Ljava/lang/String;

    .line 135
    const/16 v0, 0x97

    new-array v0, v0, [[Ljava/lang/String;

    .line 137
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0192"

    aput-object v2, v1, v4

    const-string v2, "&fnof;"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 139
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0391"

    aput-object v2, v1, v4

    const-string v2, "&Alpha;"

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    .line 140
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0392"

    aput-object v2, v1, v4

    const-string v2, "&Beta;"

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    .line 141
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0393"

    aput-object v2, v1, v4

    const-string v2, "&Gamma;"

    aput-object v2, v1, v5

    aput-object v1, v0, v7

    .line 142
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0394"

    aput-object v2, v1, v4

    const-string v2, "&Delta;"

    aput-object v2, v1, v5

    aput-object v1, v0, v8

    const/4 v1, 0x5

    .line 143
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0395"

    aput-object v3, v2, v4

    const-string v3, "&Epsilon;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x6

    .line 144
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0396"

    aput-object v3, v2, v4

    const-string v3, "&Zeta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/4 v1, 0x7

    .line 145
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0397"

    aput-object v3, v2, v4

    const-string v3, "&Eta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8

    .line 146
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0398"

    aput-object v3, v2, v4

    const-string v3, "&Theta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x9

    .line 147
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0399"

    aput-object v3, v2, v4

    const-string v3, "&Iota;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xa

    .line 148
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039a"

    aput-object v3, v2, v4

    const-string v3, "&Kappa;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xb

    .line 149
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039b"

    aput-object v3, v2, v4

    const-string v3, "&Lambda;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xc

    .line 150
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039c"

    aput-object v3, v2, v4

    const-string v3, "&Mu;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xd

    .line 151
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039d"

    aput-object v3, v2, v4

    const-string v3, "&Nu;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xe

    .line 152
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039e"

    aput-object v3, v2, v4

    const-string v3, "&Xi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0xf

    .line 153
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u039f"

    aput-object v3, v2, v4

    const-string v3, "&Omicron;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x10

    .line 154
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a0"

    aput-object v3, v2, v4

    const-string v3, "&Pi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x11

    .line 155
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a1"

    aput-object v3, v2, v4

    const-string v3, "&Rho;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x12

    .line 157
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a3"

    aput-object v3, v2, v4

    const-string v3, "&Sigma;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x13

    .line 158
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a4"

    aput-object v3, v2, v4

    const-string v3, "&Tau;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x14

    .line 159
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a5"

    aput-object v3, v2, v4

    const-string v3, "&Upsilon;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x15

    .line 160
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a6"

    aput-object v3, v2, v4

    const-string v3, "&Phi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x16

    .line 161
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a7"

    aput-object v3, v2, v4

    const-string v3, "&Chi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x17

    .line 162
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a8"

    aput-object v3, v2, v4

    const-string v3, "&Psi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x18

    .line 163
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03a9"

    aput-object v3, v2, v4

    const-string v3, "&Omega;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x19

    .line 164
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b1"

    aput-object v3, v2, v4

    const-string v3, "&alpha;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    .line 165
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b2"

    aput-object v3, v2, v4

    const-string v3, "&beta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    .line 166
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b3"

    aput-object v3, v2, v4

    const-string v3, "&gamma;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    .line 167
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b4"

    aput-object v3, v2, v4

    const-string v3, "&delta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    .line 168
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b5"

    aput-object v3, v2, v4

    const-string v3, "&epsilon;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    .line 169
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b6"

    aput-object v3, v2, v4

    const-string v3, "&zeta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    .line 170
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b7"

    aput-object v3, v2, v4

    const-string v3, "&eta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x20

    .line 171
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b8"

    aput-object v3, v2, v4

    const-string v3, "&theta;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x21

    .line 172
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03b9"

    aput-object v3, v2, v4

    const-string v3, "&iota;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x22

    .line 173
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03ba"

    aput-object v3, v2, v4

    const-string v3, "&kappa;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x23

    .line 174
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03bb"

    aput-object v3, v2, v4

    const-string v3, "&lambda;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x24

    .line 175
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03bc"

    aput-object v3, v2, v4

    const-string v3, "&mu;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x25

    .line 176
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03bd"

    aput-object v3, v2, v4

    const-string v3, "&nu;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x26

    .line 177
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03be"

    aput-object v3, v2, v4

    const-string v3, "&xi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x27

    .line 178
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03bf"

    aput-object v3, v2, v4

    const-string v3, "&omicron;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x28

    .line 179
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c0"

    aput-object v3, v2, v4

    const-string v3, "&pi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x29

    .line 180
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c1"

    aput-object v3, v2, v4

    const-string v3, "&rho;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    .line 181
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c2"

    aput-object v3, v2, v4

    const-string v3, "&sigmaf;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    .line 182
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c3"

    aput-object v3, v2, v4

    const-string v3, "&sigma;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    .line 183
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c4"

    aput-object v3, v2, v4

    const-string v3, "&tau;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    .line 184
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c5"

    aput-object v3, v2, v4

    const-string v3, "&upsilon;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    .line 185
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c6"

    aput-object v3, v2, v4

    const-string v3, "&phi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    .line 186
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c7"

    aput-object v3, v2, v4

    const-string v3, "&chi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x30

    .line 187
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c8"

    aput-object v3, v2, v4

    const-string v3, "&psi;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x31

    .line 188
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03c9"

    aput-object v3, v2, v4

    const-string v3, "&omega;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x32

    .line 189
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03d1"

    aput-object v3, v2, v4

    const-string v3, "&thetasym;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x33

    .line 190
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03d2"

    aput-object v3, v2, v4

    const-string v3, "&upsih;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x34

    .line 191
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u03d6"

    aput-object v3, v2, v4

    const-string v3, "&piv;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x35

    .line 193
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2022"

    aput-object v3, v2, v4

    const-string v3, "&bull;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x36

    .line 195
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2026"

    aput-object v3, v2, v4

    const-string v3, "&hellip;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x37

    .line 196
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2032"

    aput-object v3, v2, v4

    const-string v3, "&prime;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x38

    .line 197
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2033"

    aput-object v3, v2, v4

    const-string v3, "&Prime;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x39

    .line 198
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u203e"

    aput-object v3, v2, v4

    const-string v3, "&oline;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    .line 199
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2044"

    aput-object v3, v2, v4

    const-string v3, "&frasl;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    .line 201
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2118"

    aput-object v3, v2, v4

    const-string v3, "&weierp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    .line 202
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2111"

    aput-object v3, v2, v4

    const-string v3, "&image;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    .line 203
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u211c"

    aput-object v3, v2, v4

    const-string v3, "&real;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    .line 204
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2122"

    aput-object v3, v2, v4

    const-string v3, "&trade;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    .line 205
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2135"

    aput-object v3, v2, v4

    const-string v3, "&alefsym;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x40

    .line 209
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2190"

    aput-object v3, v2, v4

    const-string v3, "&larr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x41

    .line 210
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2191"

    aput-object v3, v2, v4

    const-string v3, "&uarr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x42

    .line 211
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2192"

    aput-object v3, v2, v4

    const-string v3, "&rarr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x43

    .line 212
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2193"

    aput-object v3, v2, v4

    const-string v3, "&darr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x44

    .line 213
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2194"

    aput-object v3, v2, v4

    const-string v3, "&harr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x45

    .line 214
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21b5"

    aput-object v3, v2, v4

    const-string v3, "&crarr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x46

    .line 215
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21d0"

    aput-object v3, v2, v4

    const-string v3, "&lArr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x47

    .line 219
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21d1"

    aput-object v3, v2, v4

    const-string v3, "&uArr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x48

    .line 220
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21d2"

    aput-object v3, v2, v4

    const-string v3, "&rArr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x49

    .line 224
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21d3"

    aput-object v3, v2, v4

    const-string v3, "&dArr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    .line 225
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u21d4"

    aput-object v3, v2, v4

    const-string v3, "&hArr;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    .line 227
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2200"

    aput-object v3, v2, v4

    const-string v3, "&forall;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    .line 228
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2202"

    aput-object v3, v2, v4

    const-string v3, "&part;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    .line 229
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2203"

    aput-object v3, v2, v4

    const-string v3, "&exist;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    .line 230
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2205"

    aput-object v3, v2, v4

    const-string v3, "&empty;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    .line 231
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2207"

    aput-object v3, v2, v4

    const-string v3, "&nabla;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x50

    .line 232
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2208"

    aput-object v3, v2, v4

    const-string v3, "&isin;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x51

    .line 233
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2209"

    aput-object v3, v2, v4

    const-string v3, "&notin;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x52

    .line 234
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u220b"

    aput-object v3, v2, v4

    const-string v3, "&ni;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x53

    .line 236
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u220f"

    aput-object v3, v2, v4

    const-string v3, "&prod;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x54

    .line 239
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2211"

    aput-object v3, v2, v4

    const-string v3, "&sum;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x55

    .line 242
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2122"

    aput-object v3, v2, v4

    const-string v3, "&minus;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x56

    .line 243
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2217"

    aput-object v3, v2, v4

    const-string v3, "&lowast;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x57

    .line 244
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u221a"

    aput-object v3, v2, v4

    const-string v3, "&radic;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x58

    .line 245
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u221d"

    aput-object v3, v2, v4

    const-string v3, "&prop;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x59

    .line 246
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u221e"

    aput-object v3, v2, v4

    const-string v3, "&infin;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    .line 247
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2220"

    aput-object v3, v2, v4

    const-string v3, "&ang;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    .line 248
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2227"

    aput-object v3, v2, v4

    const-string v3, "&and;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    .line 249
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2228"

    aput-object v3, v2, v4

    const-string v3, "&or;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    .line 250
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2229"

    aput-object v3, v2, v4

    const-string v3, "&cap;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    .line 251
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u222a"

    aput-object v3, v2, v4

    const-string v3, "&cup;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    .line 252
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u222b"

    aput-object v3, v2, v4

    const-string v3, "&int;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x60

    .line 253
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2234"

    aput-object v3, v2, v4

    const-string v3, "&there4;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x61

    .line 254
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u223c"

    aput-object v3, v2, v4

    const-string v3, "&sim;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x62

    .line 257
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2245"

    aput-object v3, v2, v4

    const-string v3, "&cong;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x63

    .line 258
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2248"

    aput-object v3, v2, v4

    const-string v3, "&asymp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x64

    .line 259
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2260"

    aput-object v3, v2, v4

    const-string v3, "&ne;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x65

    .line 260
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2261"

    aput-object v3, v2, v4

    const-string v3, "&equiv;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x66

    .line 261
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2264"

    aput-object v3, v2, v4

    const-string v3, "&le;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x67

    .line 262
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2265"

    aput-object v3, v2, v4

    const-string v3, "&ge;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x68

    .line 263
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2282"

    aput-object v3, v2, v4

    const-string v3, "&sub;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x69

    .line 264
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2283"

    aput-object v3, v2, v4

    const-string v3, "&sup;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    .line 269
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2286"

    aput-object v3, v2, v4

    const-string v3, "&sube;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    .line 270
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2287"

    aput-object v3, v2, v4

    const-string v3, "&supe;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    .line 271
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2295"

    aput-object v3, v2, v4

    const-string v3, "&oplus;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    .line 272
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2297"

    aput-object v3, v2, v4

    const-string v3, "&otimes;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    .line 273
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u22a5"

    aput-object v3, v2, v4

    const-string v3, "&perp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    .line 274
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u22c5"

    aput-object v3, v2, v4

    const-string v3, "&sdot;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x70

    .line 277
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2308"

    aput-object v3, v2, v4

    const-string v3, "&lceil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x71

    .line 278
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2309"

    aput-object v3, v2, v4

    const-string v3, "&rceil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x72

    .line 279
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u230a"

    aput-object v3, v2, v4

    const-string v3, "&lfloor;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x73

    .line 280
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u230b"

    aput-object v3, v2, v4

    const-string v3, "&rfloor;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x74

    .line 281
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2329"

    aput-object v3, v2, v4

    const-string v3, "&lang;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x75

    .line 284
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u232a"

    aput-object v3, v2, v4

    const-string v3, "&rang;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x76

    .line 288
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u25ca"

    aput-object v3, v2, v4

    const-string v3, "&loz;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x77

    .line 290
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2660"

    aput-object v3, v2, v4

    const-string v3, "&spades;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x78

    .line 292
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2663"

    aput-object v3, v2, v4

    const-string v3, "&clubs;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x79

    .line 293
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2665"

    aput-object v3, v2, v4

    const-string v3, "&hearts;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    .line 294
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2666"

    aput-object v3, v2, v4

    const-string v3, "&diams;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    .line 297
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0152"

    aput-object v3, v2, v4

    const-string v3, "&OElig;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    .line 298
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0153"

    aput-object v3, v2, v4

    const-string v3, "&oelig;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    .line 300
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0160"

    aput-object v3, v2, v4

    const-string v3, "&Scaron;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    .line 301
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0161"

    aput-object v3, v2, v4

    const-string v3, "&scaron;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    .line 302
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u0178"

    aput-object v3, v2, v4

    const-string v3, "&Yuml;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x80

    .line 304
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u02c6"

    aput-object v3, v2, v4

    const-string v3, "&circ;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x81

    .line 305
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u02dc"

    aput-object v3, v2, v4

    const-string v3, "&tilde;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x82

    .line 307
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2002"

    aput-object v3, v2, v4

    const-string v3, "&ensp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x83

    .line 308
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2003"

    aput-object v3, v2, v4

    const-string v3, "&emsp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x84

    .line 309
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2009"

    aput-object v3, v2, v4

    const-string v3, "&thinsp;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x85

    .line 310
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u200c"

    aput-object v3, v2, v4

    const-string v3, "&zwnj;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x86

    .line 311
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u200d"

    aput-object v3, v2, v4

    const-string v3, "&zwj;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x87

    .line 312
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u200e"

    aput-object v3, v2, v4

    const-string v3, "&lrm;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x88

    .line 313
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u200f"

    aput-object v3, v2, v4

    const-string v3, "&rlm;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x89

    .line 314
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2013"

    aput-object v3, v2, v4

    const-string v3, "&ndash;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    .line 315
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2014"

    aput-object v3, v2, v4

    const-string v3, "&mdash;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    .line 316
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2018"

    aput-object v3, v2, v4

    const-string v3, "&lsquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    .line 317
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2019"

    aput-object v3, v2, v4

    const-string v3, "&rsquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    .line 318
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u201a"

    aput-object v3, v2, v4

    const-string v3, "&sbquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    .line 319
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u201c"

    aput-object v3, v2, v4

    const-string v3, "&ldquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    .line 320
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u201d"

    aput-object v3, v2, v4

    const-string v3, "&rdquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x90

    .line 321
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u201e"

    aput-object v3, v2, v4

    const-string v3, "&bdquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x91

    .line 322
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2020"

    aput-object v3, v2, v4

    const-string v3, "&dagger;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x92

    .line 323
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2021"

    aput-object v3, v2, v4

    const-string v3, "&Dagger;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x93

    .line 324
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2030"

    aput-object v3, v2, v4

    const-string v3, "&permil;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x94

    .line 325
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u2039"

    aput-object v3, v2, v4

    const-string v3, "&lsaquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x95

    .line 327
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u203a"

    aput-object v3, v2, v4

    const-string v3, "&rsaquo;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    const/16 v1, 0x96

    .line 329
    new-array v2, v6, [Ljava/lang/String;

    const-string v3, "\u20ac"

    aput-object v3, v2, v4

    const-string v3, "&euro;"

    aput-object v3, v2, v5

    aput-object v2, v0, v1

    .line 135
    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_ESCAPE:[[Ljava/lang/String;

    .line 333
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_ESCAPE:[[Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/text/translate/EntityArrays;->invert([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_UNESCAPE:[[Ljava/lang/String;

    .line 336
    new-array v0, v8, [[Ljava/lang/String;

    .line 337
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\""

    aput-object v2, v1, v4

    const-string v2, "&quot;"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 338
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "&"

    aput-object v2, v1, v4

    const-string v2, "&amp;"

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    .line 339
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "<"

    aput-object v2, v1, v4

    const-string v2, "&lt;"

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    .line 340
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, ">"

    aput-object v2, v1, v4

    const-string v2, "&gt;"

    aput-object v2, v1, v5

    aput-object v1, v0, v7

    .line 336
    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->BASIC_ESCAPE:[[Ljava/lang/String;

    .line 344
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->BASIC_ESCAPE:[[Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/text/translate/EntityArrays;->invert([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->BASIC_UNESCAPE:[[Ljava/lang/String;

    .line 347
    new-array v0, v5, [[Ljava/lang/String;

    .line 348
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\'"

    aput-object v2, v1, v4

    const-string v2, "&apos;"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 347
    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->APOS_ESCAPE:[[Ljava/lang/String;

    .line 352
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->APOS_ESCAPE:[[Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/text/translate/EntityArrays;->invert([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->APOS_UNESCAPE:[[Ljava/lang/String;

    .line 355
    const/4 v0, 0x5

    new-array v0, v0, [[Ljava/lang/String;

    .line 356
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u0008"

    aput-object v2, v1, v4

    const-string v2, "\\b"

    aput-object v2, v1, v5

    aput-object v1, v0, v4

    .line 357
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\n"

    aput-object v2, v1, v4

    const-string v2, "\\n"

    aput-object v2, v1, v5

    aput-object v1, v0, v5

    .line 358
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\t"

    aput-object v2, v1, v4

    const-string v2, "\\t"

    aput-object v2, v1, v5

    aput-object v1, v0, v6

    .line 359
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\u000c"

    aput-object v2, v1, v4

    const-string v2, "\\f"

    aput-object v2, v1, v5

    aput-object v1, v0, v7

    .line 360
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "\r"

    aput-object v2, v1, v4

    const-string v2, "\\r"

    aput-object v2, v1, v5

    aput-object v1, v0, v8

    .line 355
    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_ESCAPE:[[Ljava/lang/String;

    .line 364
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_ESCAPE:[[Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/commons/lang3/text/translate/EntityArrays;->invert([[Ljava/lang/String;)[[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_UNESCAPE:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static APOS_ESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 346
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->APOS_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static APOS_UNESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 351
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->APOS_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static BASIC_ESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 335
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->BASIC_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static BASIC_UNESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 343
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->BASIC_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static HTML40_EXTENDED_ESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static HTML40_EXTENDED_UNESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 332
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->HTML40_EXTENDED_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static ISO8859_1_ESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->ISO8859_1_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static ISO8859_1_UNESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->ISO8859_1_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static JAVA_CTRL_CHARS_ESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 354
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_ESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static JAVA_CTRL_CHARS_UNESCAPE()[[Ljava/lang/String;
    .locals 1

    .prologue
    .line 363
    sget-object v0, Lorg/apache/commons/lang3/text/translate/EntityArrays;->JAVA_CTRL_CHARS_UNESCAPE:[[Ljava/lang/String;

    invoke-virtual {v0}, [[Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/String;

    return-object v0
.end method

.method public static invert([[Ljava/lang/String;)[[Ljava/lang/String;
    .locals 6
    .parameter "array"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 372
    array-length v2, p0

    const/4 v3, 0x2

    filled-new-array {v2, v3}, [I

    move-result-object v2

    const-class v3, Ljava/lang/String;

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Ljava/lang/String;

    .line 373
    .local v1, newarray:[[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, p0

    if-lt v0, v2, :cond_0

    .line 377
    return-object v1

    .line 374
    :cond_0
    aget-object v2, v1, v0

    aget-object v3, p0, v0

    aget-object v3, v3, v5

    aput-object v3, v2, v4

    .line 375
    aget-object v2, v1, v0

    aget-object v3, p0, v0

    aget-object v3, v3, v4

    aput-object v3, v2, v5

    .line 373
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
