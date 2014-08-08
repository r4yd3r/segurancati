.class public Lorg/apache/commons/lang3/ArrayUtils;
.super Ljava/lang/Object;
.source "ArrayUtils.java"


# static fields
.field public static final EMPTY_BOOLEAN_ARRAY:[Z = null

.field public static final EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean; = null

.field public static final EMPTY_BYTE_ARRAY:[B = null

.field public static final EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte; = null

.field public static final EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character; = null

.field public static final EMPTY_CHAR_ARRAY:[C = null

.field public static final EMPTY_CLASS_ARRAY:[Ljava/lang/Class; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field public static final EMPTY_DOUBLE_ARRAY:[D = null

.field public static final EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double; = null

.field public static final EMPTY_FLOAT_ARRAY:[F = null

.field public static final EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float; = null

.field public static final EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer; = null

.field public static final EMPTY_INT_ARRAY:[I = null

.field public static final EMPTY_LONG_ARRAY:[J = null

.field public static final EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long; = null

.field public static final EMPTY_OBJECT_ARRAY:[Ljava/lang/Object; = null

.field public static final EMPTY_SHORT_ARRAY:[S = null

.field public static final EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short; = null

.field public static final EMPTY_STRING_ARRAY:[Ljava/lang/String; = null

.field public static final INDEX_NOT_FOUND:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 56
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 60
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CLASS_ARRAY:[Ljava/lang/Class;

    .line 64
    new-array v0, v1, [Ljava/lang/String;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 68
    new-array v0, v1, [J

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    .line 72
    new-array v0, v1, [Ljava/lang/Long;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    .line 76
    new-array v0, v1, [I

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    .line 80
    new-array v0, v1, [Ljava/lang/Integer;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    .line 84
    new-array v0, v1, [S

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    .line 88
    new-array v0, v1, [Ljava/lang/Short;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    .line 92
    new-array v0, v1, [B

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    .line 96
    new-array v0, v1, [Ljava/lang/Byte;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    .line 100
    new-array v0, v1, [D

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    .line 104
    new-array v0, v1, [Ljava/lang/Double;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    .line 108
    new-array v0, v1, [F

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    .line 112
    new-array v0, v1, [Ljava/lang/Float;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    .line 116
    new-array v0, v1, [Z

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    .line 120
    new-array v0, v1, [Ljava/lang/Boolean;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    .line 124
    new-array v0, v1, [C

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 128
    new-array v0, v1, [Ljava/lang/Character;

    sput-object v0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    .line 135
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    return-void
.end method

.method private static add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 6
    .parameter "array"
    .parameter "index"
    .parameter "element"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "I",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p3, clss:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 4306
    if-nez p0, :cond_1

    .line 4307
    if-eqz p1, :cond_0

    .line 4308
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Index: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Length: 0"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4310
    :cond_0
    const/4 v3, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 4311
    .local v0, joinedArray:Ljava/lang/Object;
    invoke-static {v0, v4, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4324
    .end local v0           #joinedArray:Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 4314
    :cond_1
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 4315
    .local v1, length:I
    if-gt p1, v1, :cond_2

    if-gez p1, :cond_3

    .line 4316
    :cond_2
    new-instance v3, Ljava/lang/IndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Index: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", Length: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 4318
    :cond_3
    add-int/lit8 v3, v1, 0x1

    invoke-static {p3, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    .line 4319
    .local v2, result:Ljava/lang/Object;
    invoke-static {p0, v4, v2, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4320
    invoke-static {v2, p1, p2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 4321
    if-ge p1, v1, :cond_4

    .line 4322
    add-int/lit8 v3, p1, 0x1

    sub-int v4, v1, p1

    invoke-static {p0, p1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_4
    move-object v0, v2

    .line 4324
    goto :goto_0
.end method

.method public static add([BB)[B
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3816
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 3817
    .local v0, newArray:[B
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-byte p1, v0, v1

    .line 3818
    return-object v0
.end method

.method public static add([BIB)[B
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4136
    invoke-static {p2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v0

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public static add([CC)[C
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3843
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    .line 3844
    .local v0, newArray:[C
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-char p1, v0, v1

    .line 3845
    return-object v0
.end method

.method public static add([CIC)[C
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4105
    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    return-object v0
.end method

.method public static add([DD)[D
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3870
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    .line 3871
    .local v0, newArray:[D
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-wide p1, v0, v1

    .line 3872
    return-object v0
.end method

.method public static add([DID)[D
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4291
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public static add([FF)[F
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3897
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    .line 3898
    .local v0, newArray:[F
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput p1, v0, v1

    .line 3899
    return-object v0
.end method

.method public static add([FIF)[F
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4260
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    return-object v0
.end method

.method public static add([II)[I
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3924
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    .line 3925
    .local v0, newArray:[I
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput p1, v0, v1

    .line 3926
    return-object v0
.end method

.method public static add([III)[I
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4198
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public static add([JIJ)[J
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4229
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    return-object v0
.end method

.method public static add([JJ)[J
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3951
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    .line 3952
    .local v0, newArray:[J
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-wide p1, v0, v1

    .line 3953
    return-object v0
.end method

.method public static add([Ljava/lang/Object;ILjava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .parameter "array"
    .parameter "index"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;ITT;)[TT;"
        }
    .end annotation

    .prologue
    .line 4032
    .local p2, element:Ljava/lang/Object;,"TT;"
    const/4 v0, 0x0

    .line 4033
    .local v0, clss:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    if-eqz p0, :cond_0

    .line 4034
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 4041
    :goto_0
    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 4042
    .local v1, newArray:[Ljava/lang/Object;
    return-object v1

    .line 4035
    .end local v1           #newArray:[Ljava/lang/Object;
    :cond_0
    if-eqz p2, :cond_1

    .line 4036
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 4037
    goto :goto_0

    .line 4038
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Array and element cannot both be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static add([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 4
    .parameter "array"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 3754
    .local p1, element:Ljava/lang/Object;,"TT;"
    if-eqz p0, :cond_0

    .line 3755
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 3762
    .local v1, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :goto_0
    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 3763
    .local v0, newArray:[Ljava/lang/Object;
    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    aput-object p1, v0, v2

    .line 3764
    return-object v0

    .line 3756
    .end local v0           #newArray:[Ljava/lang/Object;
    .end local v1           #type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_0
    if-eqz p1, :cond_1

    .line 3757
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 3758
    .restart local v1       #type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    goto :goto_0

    .line 3759
    .end local v1           #type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Arguments cannot both be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public static add([SIS)[S
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4167
    invoke-static {p2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    return-object v0
.end method

.method public static add([SS)[S
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3978
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    .line 3979
    .local v0, newArray:[S
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-short p1, v0, v1

    .line 3980
    return-object v0
.end method

.method public static add([ZIZ)[Z
    .locals 2
    .parameter "array"
    .parameter "index"
    .parameter "element"

    .prologue
    .line 4073
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->add(Ljava/lang/Object;ILjava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    return-object v0
.end method

.method public static add([ZZ)[Z
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 3789
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v1}, Lorg/apache/commons/lang3/ArrayUtils;->copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    .line 3790
    .local v0, newArray:[Z
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-boolean p1, v0, v1

    .line 3791
    return-object v0
.end method

.method public static varargs addAll([B[B)[B
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3568
    if-nez p0, :cond_0

    .line 3569
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([B)[B

    move-result-object v0

    .line 3576
    :goto_0
    return-object v0

    .line 3570
    :cond_0
    if-nez p1, :cond_1

    .line 3571
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([B)[B

    move-result-object v0

    goto :goto_0

    .line 3573
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [B

    .line 3574
    .local v0, joinedArray:[B
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3575
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([C[C)[C
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3539
    if-nez p0, :cond_0

    .line 3540
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([C)[C

    move-result-object v0

    .line 3547
    :goto_0
    return-object v0

    .line 3541
    :cond_0
    if-nez p1, :cond_1

    .line 3542
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([C)[C

    move-result-object v0

    goto :goto_0

    .line 3544
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [C

    .line 3545
    .local v0, joinedArray:[C
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3546
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([D[D)[D
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3713
    if-nez p0, :cond_0

    .line 3714
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([D)[D

    move-result-object v0

    .line 3721
    :goto_0
    return-object v0

    .line 3715
    :cond_0
    if-nez p1, :cond_1

    .line 3716
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([D)[D

    move-result-object v0

    goto :goto_0

    .line 3718
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [D

    .line 3719
    .local v0, joinedArray:[D
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3720
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([F[F)[F
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3684
    if-nez p0, :cond_0

    .line 3685
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([F)[F

    move-result-object v0

    .line 3692
    :goto_0
    return-object v0

    .line 3686
    :cond_0
    if-nez p1, :cond_1

    .line 3687
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([F)[F

    move-result-object v0

    goto :goto_0

    .line 3689
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [F

    .line 3690
    .local v0, joinedArray:[F
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3691
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([I[I)[I
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3626
    if-nez p0, :cond_0

    .line 3627
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([I)[I

    move-result-object v0

    .line 3634
    :goto_0
    return-object v0

    .line 3628
    :cond_0
    if-nez p1, :cond_1

    .line 3629
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([I)[I

    move-result-object v0

    goto :goto_0

    .line 3631
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [I

    .line 3632
    .local v0, joinedArray:[I
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3633
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([J[J)[J
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3655
    if-nez p0, :cond_0

    .line 3656
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([J)[J

    move-result-object v0

    .line 3663
    :goto_0
    return-object v0

    .line 3657
    :cond_0
    if-nez p1, :cond_1

    .line 3658
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([J)[J

    move-result-object v0

    goto :goto_0

    .line 3660
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [J

    .line 3661
    .local v0, joinedArray:[J
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3662
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 7
    .parameter "array1"
    .parameter "array2"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;[TT;)[TT;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 3465
    if-nez p0, :cond_0

    .line 3466
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 3489
    :goto_0
    return-object v1

    .line 3467
    :cond_0
    if-nez p1, :cond_1

    .line 3468
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 3470
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 3472
    .local v2, type1:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    array-length v4, p0

    array-length v5, p1

    add-int/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 3473
    .local v1, joinedArray:[Ljava/lang/Object;
    array-length v4, p0

    invoke-static {p0, v6, v1, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3475
    const/4 v4, 0x0

    :try_start_0
    array-length v5, p0

    array-length v6, p1

    invoke-static {p1, v4, v1, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/ArrayStoreException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3476
    :catch_0
    move-exception v0

    .line 3483
    .local v0, ase:Ljava/lang/ArrayStoreException;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    .line 3484
    .local v3, type2:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 3485
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Cannot store "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in an array of "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    .line 3487
    :cond_2
    throw v0
.end method

.method public static varargs addAll([S[S)[S
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3597
    if-nez p0, :cond_0

    .line 3598
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([S)[S

    move-result-object v0

    .line 3605
    :goto_0
    return-object v0

    .line 3599
    :cond_0
    if-nez p1, :cond_1

    .line 3600
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([S)[S

    move-result-object v0

    goto :goto_0

    .line 3602
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [S

    .line 3603
    .local v0, joinedArray:[S
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3604
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs addAll([Z[Z)[Z
    .locals 4
    .parameter "array1"
    .parameter "array2"

    .prologue
    const/4 v3, 0x0

    .line 3510
    if-nez p0, :cond_0

    .line 3511
    invoke-static {p1}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Z)[Z

    move-result-object v0

    .line 3518
    :goto_0
    return-object v0

    .line 3512
    :cond_0
    if-nez p1, :cond_1

    .line 3513
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Z)[Z

    move-result-object v0

    goto :goto_0

    .line 3515
    :cond_1
    array-length v1, p0

    array-length v2, p1

    add-int/2addr v1, v2

    new-array v0, v1, [Z

    .line 3516
    .local v0, joinedArray:[Z
    array-length v1, p0

    invoke-static {p0, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3517
    array-length v1, p0

    array-length v2, p1

    invoke-static {p1, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static clone([B)[B
    .locals 1
    .parameter "array"

    .prologue
    .line 392
    if-nez p0, :cond_0

    .line 393
    const/4 v0, 0x0

    .line 395
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    goto :goto_0
.end method

.method public static clone([C)[C
    .locals 1
    .parameter "array"

    .prologue
    .line 376
    if-nez p0, :cond_0

    .line 377
    const/4 v0, 0x0

    .line 379
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [C->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    goto :goto_0
.end method

.method public static clone([D)[D
    .locals 1
    .parameter "array"

    .prologue
    .line 408
    if-nez p0, :cond_0

    .line 409
    const/4 v0, 0x0

    .line 411
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [D->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    goto :goto_0
.end method

.method public static clone([F)[F
    .locals 1
    .parameter "array"

    .prologue
    .line 424
    if-nez p0, :cond_0

    .line 425
    const/4 v0, 0x0

    .line 427
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    goto :goto_0
.end method

.method public static clone([I)[I
    .locals 1
    .parameter "array"

    .prologue
    .line 344
    if-nez p0, :cond_0

    .line 345
    const/4 v0, 0x0

    .line 347
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    goto :goto_0
.end method

.method public static clone([J)[J
    .locals 1
    .parameter "array"

    .prologue
    .line 328
    if-nez p0, :cond_0

    .line 329
    const/4 v0, 0x0

    .line 331
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [J->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    goto :goto_0
.end method

.method public static clone([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .parameter "array"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 312
    if-nez p0, :cond_0

    .line 313
    const/4 v0, 0x0

    .line 315
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    goto :goto_0
.end method

.method public static clone([S)[S
    .locals 1
    .parameter "array"

    .prologue
    .line 360
    if-nez p0, :cond_0

    .line 361
    const/4 v0, 0x0

    .line 363
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [S->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    goto :goto_0
.end method

.method public static clone([Z)[Z
    .locals 1
    .parameter "array"

    .prologue
    .line 440
    if-nez p0, :cond_0

    .line 441
    const/4 v0, 0x0

    .line 443
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, [Z->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    goto :goto_0
.end method

.method public static contains([BB)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2232
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([BB)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([CC)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2129
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([CC)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([DD)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2439
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([DD)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([DDD)Z
    .locals 6
    .parameter "array"
    .parameter "valueToFind"
    .parameter "tolerance"

    .prologue
    const/4 v3, 0x0

    .line 2456
    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([DDID)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3
.end method

.method public static contains([FF)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2559
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([FF)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([II)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1918
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([II)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([JJ)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1815
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([JJ)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "array"
    .parameter "objectToFind"

    .prologue
    .line 1712
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([SS)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2021
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([SS)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static contains([ZZ)Z
    .locals 2
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2664
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([ZZ)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static copyArrayGrow1(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 5
    .parameter "array"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, newArrayComponentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 3993
    if-eqz p0, :cond_0

    .line 3994
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 3995
    .local v0, arrayLength:I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    add-int/lit8 v3, v0, 0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 3996
    .local v1, newArray:Ljava/lang/Object;
    invoke-static {p0, v4, v1, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3999
    .end local v0           #arrayLength:I
    .end local v1           #newArray:Ljava/lang/Object;
    :goto_0
    return-object v1

    :cond_0
    const/4 v2, 0x1

    invoke-static {p1, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public static getLength(Ljava/lang/Object;)I
    .locals 1
    .parameter "array"

    .prologue
    .line 1360
    if-nez p0, :cond_0

    .line 1361
    const/4 v0, 0x0

    .line 1363
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method

.method public static indexOf([BB)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2145
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([BBI)I

    move-result v0

    return v0
.end method

.method public static indexOf([BBI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2163
    if-nez p0, :cond_1

    move v0, v1

    .line 2174
    :cond_0
    :goto_0
    return v0

    .line 2166
    :cond_1
    if-gez p2, :cond_2

    .line 2167
    const/4 p2, 0x0

    .line 2169
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 2174
    goto :goto_0

    .line 2170
    :cond_3
    aget-byte v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2169
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([CC)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2038
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([CCI)I

    move-result v0

    return v0
.end method

.method public static indexOf([CCI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2057
    if-nez p0, :cond_1

    move v0, v1

    .line 2068
    :cond_0
    :goto_0
    return v0

    .line 2060
    :cond_1
    if-gez p2, :cond_2

    .line 2061
    const/4 p2, 0x0

    .line 2063
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 2068
    goto :goto_0

    .line 2064
    :cond_3
    aget-char v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2063
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([DD)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2248
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([DDI)I

    move-result v0

    return v0
.end method

.method public static indexOf([DDD)I
    .locals 6
    .parameter "array"
    .parameter "valueToFind"
    .parameter "tolerance"

    .prologue
    .line 2265
    const/4 v3, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([DDID)I

    move-result v0

    return v0
.end method

.method public static indexOf([DDI)I
    .locals 4
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2283
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([D)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2294
    :cond_0
    :goto_0
    return v0

    .line 2286
    :cond_1
    if-gez p3, :cond_2

    .line 2287
    const/4 p3, 0x0

    .line 2289
    :cond_2
    move v0, p3

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 2294
    goto :goto_0

    .line 2290
    :cond_3
    aget-wide v2, p0, v0

    cmpl-double v2, p1, v2

    if-eqz v2, :cond_0

    .line 2289
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([DDID)I
    .locals 8
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"
    .parameter "tolerance"

    .prologue
    const/4 v5, -0x1

    .line 2315
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([D)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v5

    .line 2328
    :cond_0
    :goto_0
    return v0

    .line 2318
    :cond_1
    if-gez p3, :cond_2

    .line 2319
    const/4 p3, 0x0

    .line 2321
    :cond_2
    sub-double v3, p1, p4

    .line 2322
    .local v3, min:D
    add-double v1, p1, p4

    .line 2323
    .local v1, max:D
    move v0, p3

    .local v0, i:I
    :goto_1
    array-length v6, p0

    if-lt v0, v6, :cond_3

    move v0, v5

    .line 2328
    goto :goto_0

    .line 2324
    :cond_3
    aget-wide v6, p0, v0

    cmpl-double v6, v6, v3

    if-ltz v6, :cond_4

    aget-wide v6, p0, v0

    cmpg-double v6, v6, v1

    if-lez v6, :cond_0

    .line 2323
    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([FF)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2472
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([FFI)I

    move-result v0

    return v0
.end method

.method public static indexOf([FFI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2490
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([F)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2501
    :cond_0
    :goto_0
    return v0

    .line 2493
    :cond_1
    if-gez p2, :cond_2

    .line 2494
    const/4 p2, 0x0

    .line 2496
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 2501
    goto :goto_0

    .line 2497
    :cond_3
    aget v2, p0, v0

    cmpl-float v2, p1, v2

    if-eqz v2, :cond_0

    .line 2496
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([II)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1831
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([III)I

    move-result v0

    return v0
.end method

.method public static indexOf([III)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1849
    if-nez p0, :cond_1

    move v0, v1

    .line 1860
    :cond_0
    :goto_0
    return v0

    .line 1852
    :cond_1
    if-gez p2, :cond_2

    .line 1853
    const/4 p2, 0x0

    .line 1855
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 1860
    goto :goto_0

    .line 1856
    :cond_3
    aget v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1855
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([JJ)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1728
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([JJI)I

    move-result v0

    return v0
.end method

.method public static indexOf([JJI)I
    .locals 4
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1746
    if-nez p0, :cond_1

    move v0, v1

    .line 1757
    :cond_0
    :goto_0
    return v0

    .line 1749
    :cond_1
    if-gez p3, :cond_2

    .line 1750
    const/4 p3, 0x0

    .line 1752
    :cond_2
    move v0, p3

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 1757
    goto :goto_0

    .line 1753
    :cond_3
    aget-wide v2, p0, v0

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 1752
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "array"
    .parameter "objectToFind"

    .prologue
    .line 1609
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static indexOf([Ljava/lang/Object;Ljava/lang/Object;I)I
    .locals 3
    .parameter "array"
    .parameter "objectToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1627
    if-nez p0, :cond_1

    move v0, v1

    .line 1646
    :cond_0
    :goto_0
    return v0

    .line 1630
    :cond_1
    if-gez p2, :cond_2

    .line 1631
    const/4 p2, 0x0

    .line 1633
    :cond_2
    if-nez p1, :cond_5

    .line 1634
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_4

    .end local v0           #i:I
    :cond_3
    move v0, v1

    .line 1646
    goto :goto_0

    .line 1635
    .restart local v0       #i:I
    :cond_4
    aget-object v2, p0, v0

    if-eqz v2, :cond_0

    .line 1634
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1639
    .end local v0           #i:I
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1640
    move v0, p2

    .restart local v0       #i:I
    :goto_2
    array-length v2, p0

    if-ge v0, v2, :cond_3

    .line 1641
    aget-object v2, p0, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1640
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public static indexOf([SS)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1934
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([SSI)I

    move-result v0

    return v0
.end method

.method public static indexOf([SSI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1952
    if-nez p0, :cond_1

    move v0, v1

    .line 1963
    :cond_0
    :goto_0
    return v0

    .line 1955
    :cond_1
    if-gez p2, :cond_2

    .line 1956
    const/4 p2, 0x0

    .line 1958
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 1963
    goto :goto_0

    .line 1959
    :cond_3
    aget-short v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1958
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static indexOf([ZZ)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2575
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([ZZI)I

    move-result v0

    return v0
.end method

.method public static indexOf([ZZI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2594
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2605
    :cond_0
    :goto_0
    return v0

    .line 2597
    :cond_1
    if-gez p2, :cond_2

    .line 2598
    const/4 p2, 0x0

    .line 2600
    :cond_2
    move v0, p2

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-lt v0, v2, :cond_3

    move v0, v1

    .line 2605
    goto :goto_0

    .line 2601
    :cond_3
    aget-boolean v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2600
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static isEmpty([B)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3293
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3294
    :cond_0
    const/4 v0, 0x1

    .line 3296
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([C)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3279
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3280
    :cond_0
    const/4 v0, 0x1

    .line 3282
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([D)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3307
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3308
    :cond_0
    const/4 v0, 0x1

    .line 3310
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([F)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3321
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3322
    :cond_0
    const/4 v0, 0x1

    .line 3324
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([I)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3251
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3252
    :cond_0
    const/4 v0, 0x1

    .line 3254
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([J)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3237
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3238
    :cond_0
    const/4 v0, 0x1

    .line 3240
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([Ljava/lang/Object;)Z
    .locals 1
    .parameter "array"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)Z"
        }
    .end annotation

    .prologue
    .line 3223
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3224
    :cond_0
    const/4 v0, 0x1

    .line 3226
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([S)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3265
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3266
    :cond_0
    const/4 v0, 0x1

    .line 3268
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEmpty([Z)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3335
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 3336
    :cond_0
    const/4 v0, 0x1

    .line 3338
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isEquals(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 195
    new-instance v0, Lorg/apache/commons/lang3/builder/EqualsBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/EqualsBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/builder/EqualsBuilder;->isEquals()Z

    move-result v0

    return v0
.end method

.method public static isNotEmpty([B)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3405
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([C)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3394
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([D)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3416
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([F)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3427
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([I)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3372
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([J)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3361
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([Ljava/lang/Object;)Z
    .locals 1
    .parameter "array"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)Z"
        }
    .end annotation

    .prologue
    .line 3350
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([S)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3383
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotEmpty([Z)Z
    .locals 1
    .parameter "array"

    .prologue
    .line 3438
    if-eqz p0, :cond_0

    array-length v0, p0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isSameLength([B[B)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1276
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1277
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1278
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1279
    :cond_2
    const/4 v0, 0x0

    .line 1281
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([C[C)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1258
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1259
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1260
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1261
    :cond_2
    const/4 v0, 0x0

    .line 1263
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([D[D)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1294
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1295
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1296
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1297
    :cond_2
    const/4 v0, 0x0

    .line 1299
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([F[F)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1312
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1313
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1314
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1315
    :cond_2
    const/4 v0, 0x0

    .line 1317
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([I[I)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1222
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1223
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1224
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1225
    :cond_2
    const/4 v0, 0x0

    .line 1227
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([J[J)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1204
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1205
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1206
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1207
    :cond_2
    const/4 v0, 0x0

    .line 1209
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([Ljava/lang/Object;[Ljava/lang/Object;)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1186
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1187
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1188
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1189
    :cond_2
    const/4 v0, 0x0

    .line 1191
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([S[S)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1240
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1241
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1242
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1243
    :cond_2
    const/4 v0, 0x0

    .line 1245
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameLength([Z[Z)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1330
    if-nez p0, :cond_0

    if-eqz p1, :cond_0

    array-length v0, p1

    if-gtz v0, :cond_2

    .line 1331
    :cond_0
    if-nez p1, :cond_1

    if-eqz p0, :cond_1

    array-length v0, p0

    if-gtz v0, :cond_2

    .line 1332
    :cond_1
    if-eqz p0, :cond_3

    if-eqz p1, :cond_3

    array-length v0, p0

    array-length v1, p1

    if-eq v0, v1, :cond_3

    .line 1333
    :cond_2
    const/4 v0, 0x0

    .line 1335
    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public static isSameType(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .parameter "array1"
    .parameter "array2"

    .prologue
    .line 1376
    if-eqz p0, :cond_0

    if-nez p1, :cond_1

    .line 1377
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The Array must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1379
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static lastIndexOf([BB)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2188
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([BBI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([BBI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2206
    if-nez p0, :cond_1

    move v0, v1

    .line 2219
    :cond_0
    :goto_0
    return v0

    .line 2209
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2210
    goto :goto_0

    .line 2211
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2212
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2214
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2219
    goto :goto_0

    .line 2215
    :cond_4
    aget-byte v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2214
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([CC)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2083
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([CCI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([CCI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2102
    if-nez p0, :cond_1

    move v0, v1

    .line 2115
    :cond_0
    :goto_0
    return v0

    .line 2105
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2106
    goto :goto_0

    .line 2107
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2108
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2110
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2115
    goto :goto_0

    .line 2111
    :cond_4
    aget-char v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2110
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([DD)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2342
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([DDI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([DDD)I
    .locals 6
    .parameter "array"
    .parameter "valueToFind"
    .parameter "tolerance"

    .prologue
    .line 2359
    const v3, 0x7fffffff

    move-object v0, p0

    move-wide v1, p1

    move-wide v4, p3

    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([DDID)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([DDI)I
    .locals 4
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2377
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([D)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2390
    :cond_0
    :goto_0
    return v0

    .line 2380
    :cond_1
    if-gez p3, :cond_2

    move v0, v1

    .line 2381
    goto :goto_0

    .line 2382
    :cond_2
    array-length v2, p0

    if-lt p3, v2, :cond_3

    .line 2383
    array-length v2, p0

    add-int/lit8 p3, v2, -0x1

    .line 2385
    :cond_3
    move v0, p3

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2390
    goto :goto_0

    .line 2386
    :cond_4
    aget-wide v2, p0, v0

    cmpl-double v2, p1, v2

    if-eqz v2, :cond_0

    .line 2385
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([DDID)I
    .locals 8
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"
    .parameter "tolerance"

    .prologue
    const/4 v5, -0x1

    .line 2411
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([D)Z

    move-result v6

    if-eqz v6, :cond_1

    move v0, v5

    .line 2426
    :cond_0
    :goto_0
    return v0

    .line 2414
    :cond_1
    if-gez p3, :cond_2

    move v0, v5

    .line 2415
    goto :goto_0

    .line 2416
    :cond_2
    array-length v6, p0

    if-lt p3, v6, :cond_3

    .line 2417
    array-length v6, p0

    add-int/lit8 p3, v6, -0x1

    .line 2419
    :cond_3
    sub-double v3, p1, p4

    .line 2420
    .local v3, min:D
    add-double v1, p1, p4

    .line 2421
    .local v1, max:D
    move v0, p3

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v5

    .line 2426
    goto :goto_0

    .line 2422
    :cond_4
    aget-wide v6, p0, v0

    cmpl-double v6, v6, v3

    if-ltz v6, :cond_5

    aget-wide v6, p0, v0

    cmpg-double v6, v6, v1

    if-lez v6, :cond_0

    .line 2421
    :cond_5
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([FF)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2515
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([FFI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([FFI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2533
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([F)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2546
    :cond_0
    :goto_0
    return v0

    .line 2536
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2537
    goto :goto_0

    .line 2538
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2539
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2541
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2546
    goto :goto_0

    .line 2542
    :cond_4
    aget v2, p0, v0

    cmpl-float v2, p1, v2

    if-eqz v2, :cond_0

    .line 2541
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([II)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1874
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([III)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([III)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1892
    if-nez p0, :cond_1

    move v0, v1

    .line 1905
    :cond_0
    :goto_0
    return v0

    .line 1895
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1896
    goto :goto_0

    .line 1897
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 1898
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 1900
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 1905
    goto :goto_0

    .line 1901
    :cond_4
    aget v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 1900
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([JJ)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1771
    const v0, 0x7fffffff

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([JJI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([JJI)I
    .locals 4
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1789
    if-nez p0, :cond_1

    move v0, v1

    .line 1802
    :cond_0
    :goto_0
    return v0

    .line 1792
    :cond_1
    if-gez p3, :cond_2

    move v0, v1

    .line 1793
    goto :goto_0

    .line 1794
    :cond_2
    array-length v2, p0

    if-lt p3, v2, :cond_3

    .line 1795
    array-length v2, p0

    add-int/lit8 p3, v2, -0x1

    .line 1797
    :cond_3
    move v0, p3

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 1802
    goto :goto_0

    .line 1798
    :cond_4
    aget-wide v2, p0, v0

    cmp-long v2, p1, v2

    if-eqz v2, :cond_0

    .line 1797
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .parameter "array"
    .parameter "objectToFind"

    .prologue
    .line 1660
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;I)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([Ljava/lang/Object;Ljava/lang/Object;I)I
    .locals 3
    .parameter "array"
    .parameter "objectToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1678
    if-nez p0, :cond_1

    move v0, v1

    .line 1699
    :cond_0
    :goto_0
    return v0

    .line 1681
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1682
    goto :goto_0

    .line 1683
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 1684
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 1686
    :cond_3
    if-nez p1, :cond_6

    .line 1687
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_5

    .end local v0           #i:I
    :cond_4
    move v0, v1

    .line 1699
    goto :goto_0

    .line 1688
    .restart local v0       #i:I
    :cond_5
    aget-object v2, p0, v0

    if-eqz v2, :cond_0

    .line 1687
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1692
    .end local v0           #i:I
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1693
    move v0, p2

    .restart local v0       #i:I
    :goto_2
    if-ltz v0, :cond_4

    .line 1694
    aget-object v2, p0, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 1693
    add-int/lit8 v0, v0, -0x1

    goto :goto_2
.end method

.method public static lastIndexOf([SS)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 1977
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([SSI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([SSI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 1995
    if-nez p0, :cond_1

    move v0, v1

    .line 2008
    :cond_0
    :goto_0
    return v0

    .line 1998
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 1999
    goto :goto_0

    .line 2000
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2001
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2003
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2008
    goto :goto_0

    .line 2004
    :cond_4
    aget-short v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2003
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static lastIndexOf([ZZ)I
    .locals 1
    .parameter "array"
    .parameter "valueToFind"

    .prologue
    .line 2620
    const v0, 0x7fffffff

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/ArrayUtils;->lastIndexOf([ZZI)I

    move-result v0

    return v0
.end method

.method public static lastIndexOf([ZZI)I
    .locals 3
    .parameter "array"
    .parameter "valueToFind"
    .parameter "startIndex"

    .prologue
    const/4 v1, -0x1

    .line 2638
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->isEmpty([Z)Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    .line 2651
    :cond_0
    :goto_0
    return v0

    .line 2641
    :cond_1
    if-gez p2, :cond_2

    move v0, v1

    .line 2642
    goto :goto_0

    .line 2643
    :cond_2
    array-length v2, p0

    if-lt p2, v2, :cond_3

    .line 2644
    array-length v2, p0

    add-int/lit8 p2, v2, -0x1

    .line 2646
    :cond_3
    move v0, p2

    .local v0, i:I
    :goto_1
    if-gez v0, :cond_4

    move v0, v1

    .line 2651
    goto :goto_0

    .line 2647
    :cond_4
    aget-boolean v2, p0, v0

    if-eq p1, v2, :cond_0

    .line 2646
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public static nullToEmpty([B)[B
    .locals 1
    .parameter "array"

    .prologue
    .line 582
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 583
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    .line 585
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([C)[C
    .locals 1
    .parameter "array"

    .prologue
    .line 562
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 563
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    .line 565
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([D)[D
    .locals 1
    .parameter "array"

    .prologue
    .line 602
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 603
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    .line 605
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([F)[F
    .locals 1
    .parameter "array"

    .prologue
    .line 622
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 623
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    .line 625
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([I)[I
    .locals 1
    .parameter "array"

    .prologue
    .line 522
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 523
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    .line 525
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([J)[J
    .locals 1
    .parameter "array"

    .prologue
    .line 502
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 503
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    .line 505
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Boolean;)[Ljava/lang/Boolean;
    .locals 1
    .parameter "array"

    .prologue
    .line 802
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 803
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    .line 805
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Byte;)[Ljava/lang/Byte;
    .locals 1
    .parameter "array"

    .prologue
    .line 742
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 743
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    .line 745
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Character;)[Ljava/lang/Character;
    .locals 1
    .parameter "array"

    .prologue
    .line 722
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 723
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    .line 725
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Double;)[Ljava/lang/Double;
    .locals 1
    .parameter "array"

    .prologue
    .line 762
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 763
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    .line 765
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Float;)[Ljava/lang/Float;
    .locals 1
    .parameter "array"

    .prologue
    .line 782
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 783
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    .line 785
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Integer;)[Ljava/lang/Integer;
    .locals 1
    .parameter "array"

    .prologue
    .line 682
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 683
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    .line 685
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Long;)[Ljava/lang/Long;
    .locals 1
    .parameter "array"

    .prologue
    .line 662
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 663
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    .line 665
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .parameter "array"

    .prologue
    .line 462
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 463
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .line 465
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/Short;)[Ljava/lang/Short;
    .locals 1
    .parameter "array"

    .prologue
    .line 702
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 703
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    .line 705
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .parameter "array"

    .prologue
    .line 482
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 483
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_STRING_ARRAY:[Ljava/lang/String;

    .line 485
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([S)[S
    .locals 1
    .parameter "array"

    .prologue
    .line 542
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 543
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    .line 545
    .end local p0
    :cond_1
    return-object p0
.end method

.method public static nullToEmpty([Z)[Z
    .locals 1
    .parameter "array"

    .prologue
    .line 642
    if-eqz p0, :cond_0

    array-length v0, p0

    if-nez v0, :cond_1

    .line 643
    :cond_0
    sget-object p0, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    .line 645
    .end local p0
    :cond_1
    return-object p0
.end method

.method private static remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 5
    .parameter "array"
    .parameter "index"

    .prologue
    const/4 v4, 0x0

    .line 4935
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 4936
    .local v0, length:I
    if-ltz p1, :cond_0

    if-lt p1, v0, :cond_1

    .line 4937
    :cond_0
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Index: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", Length: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 4940
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    add-int/lit8 v3, v0, -0x1

    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    .line 4941
    .local v1, result:Ljava/lang/Object;
    invoke-static {p0, v4, v1, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4942
    add-int/lit8 v2, v0, -0x1

    if-ge p1, v2, :cond_2

    .line 4943
    add-int/lit8 v2, p1, 0x1

    sub-int v3, v0, p1

    add-int/lit8 v3, v3, -0x1

    invoke-static {p0, v2, v1, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 4946
    :cond_2
    return-object v1
.end method

.method public static remove([BI)[B
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4487
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public static remove([CI)[C
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4552
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    return-object v0
.end method

.method public static remove([DI)[D
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4617
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [D

    return-object v0
.end method

.method public static remove([FI)[F
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4682
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    return-object v0
.end method

.method public static remove([II)[I
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4747
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    return-object v0
.end method

.method public static remove([JI)[J
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4812
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    return-object v0
.end method

.method public static remove([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 1
    .parameter "array"
    .parameter "index"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;I)[TT;"
        }
    .end annotation

    .prologue
    .line 4357
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public static remove([SI)[S
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4877
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [S

    return-object v0
.end method

.method public static remove([ZI)[Z
    .locals 1
    .parameter "array"
    .parameter "index"

    .prologue
    .line 4422
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    return-object v0
.end method

.method public static removeElement([BB)[B
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4516
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([BB)I

    move-result v0

    .line 4517
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4518
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([B)[B

    move-result-object v1

    .line 4520
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([BI)[B

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([CC)[C
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4581
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([CC)I

    move-result v0

    .line 4582
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4583
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([C)[C

    move-result-object v1

    .line 4585
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([CI)[C

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([DD)[D
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4646
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([DD)I

    move-result v0

    .line 4647
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4648
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([D)[D

    move-result-object v1

    .line 4650
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([DI)[D

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([FF)[F
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4711
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([FF)I

    move-result v0

    .line 4712
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4713
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([F)[F

    move-result-object v1

    .line 4715
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([FI)[F

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([II)[I
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4776
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([II)I

    move-result v0

    .line 4777
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4778
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([I)[I

    move-result-object v1

    .line 4780
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([II)[I

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([JJ)[J
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4841
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([JJ)I

    move-result v0

    .line 4842
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4843
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([J)[J

    move-result-object v1

    .line 4845
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([JI)[J

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([Ljava/lang/Object;Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 2
    .parameter "array"
    .parameter "element"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Ljava/lang/Object;",
            ")[TT;"
        }
    .end annotation

    .prologue
    .line 4386
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    .line 4387
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4388
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 4390
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([SS)[S
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4906
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([SS)I

    move-result v0

    .line 4907
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4908
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([S)[S

    move-result-object v1

    .line 4910
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([SI)[S

    move-result-object v1

    goto :goto_0
.end method

.method public static removeElement([ZZ)[Z
    .locals 2
    .parameter "array"
    .parameter "element"

    .prologue
    .line 4451
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ArrayUtils;->indexOf([ZZ)I

    move-result v0

    .line 4452
    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 4453
    invoke-static {p0}, Lorg/apache/commons/lang3/ArrayUtils;->clone([Z)[Z

    move-result-object v1

    .line 4455
    :goto_0
    return-object v1

    :cond_0
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->remove([ZI)[Z

    move-result-object v1

    goto :goto_0
.end method

.method public static reverse([B)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1509
    if-nez p0, :cond_1

    .line 1522
    :cond_0
    return-void

    .line 1512
    :cond_1
    const/4 v0, 0x0

    .line 1513
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1515
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1516
    aget-byte v2, p0, v1

    .line 1517
    .local v2, tmp:B
    aget-byte v3, p0, v0

    aput-byte v3, p0, v1

    .line 1518
    aput-byte v2, p0, v0

    .line 1519
    add-int/lit8 v1, v1, -0x1

    .line 1520
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([C)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1486
    if-nez p0, :cond_1

    .line 1499
    :cond_0
    return-void

    .line 1489
    :cond_1
    const/4 v0, 0x0

    .line 1490
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1492
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1493
    aget-char v2, p0, v1

    .line 1494
    .local v2, tmp:C
    aget-char v3, p0, v0

    aput-char v3, p0, v1

    .line 1495
    aput-char v2, p0, v0

    .line 1496
    add-int/lit8 v1, v1, -0x1

    .line 1497
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([D)V
    .locals 6
    .parameter "array"

    .prologue
    .line 1532
    if-nez p0, :cond_1

    .line 1545
    :cond_0
    return-void

    .line 1535
    :cond_1
    const/4 v0, 0x0

    .line 1536
    .local v0, i:I
    array-length v4, p0

    add-int/lit8 v1, v4, -0x1

    .line 1538
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1539
    aget-wide v2, p0, v1

    .line 1540
    .local v2, tmp:D
    aget-wide v4, p0, v0

    aput-wide v4, p0, v1

    .line 1541
    aput-wide v2, p0, v0

    .line 1542
    add-int/lit8 v1, v1, -0x1

    .line 1543
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([F)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1555
    if-nez p0, :cond_1

    .line 1568
    :cond_0
    return-void

    .line 1558
    :cond_1
    const/4 v0, 0x0

    .line 1559
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1561
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1562
    aget v2, p0, v1

    .line 1563
    .local v2, tmp:F
    aget v3, p0, v0

    aput v3, p0, v1

    .line 1564
    aput v2, p0, v0

    .line 1565
    add-int/lit8 v1, v1, -0x1

    .line 1566
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([I)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1440
    if-nez p0, :cond_1

    .line 1453
    :cond_0
    return-void

    .line 1443
    :cond_1
    const/4 v0, 0x0

    .line 1444
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1446
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1447
    aget v2, p0, v1

    .line 1448
    .local v2, tmp:I
    aget v3, p0, v0

    aput v3, p0, v1

    .line 1449
    aput v2, p0, v0

    .line 1450
    add-int/lit8 v1, v1, -0x1

    .line 1451
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([J)V
    .locals 6
    .parameter "array"

    .prologue
    .line 1417
    if-nez p0, :cond_1

    .line 1430
    :cond_0
    return-void

    .line 1420
    :cond_1
    const/4 v0, 0x0

    .line 1421
    .local v0, i:I
    array-length v4, p0

    add-int/lit8 v1, v4, -0x1

    .line 1423
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1424
    aget-wide v2, p0, v1

    .line 1425
    .local v2, tmp:J
    aget-wide v4, p0, v0

    aput-wide v4, p0, v1

    .line 1426
    aput-wide v2, p0, v0

    .line 1427
    add-int/lit8 v1, v1, -0x1

    .line 1428
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([Ljava/lang/Object;)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1394
    if-nez p0, :cond_1

    .line 1407
    :cond_0
    return-void

    .line 1397
    :cond_1
    const/4 v0, 0x0

    .line 1398
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1400
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1401
    aget-object v2, p0, v1

    .line 1402
    .local v2, tmp:Ljava/lang/Object;
    aget-object v3, p0, v0

    aput-object v3, p0, v1

    .line 1403
    aput-object v2, p0, v0

    .line 1404
    add-int/lit8 v1, v1, -0x1

    .line 1405
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([S)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1463
    if-nez p0, :cond_1

    .line 1476
    :cond_0
    return-void

    .line 1466
    :cond_1
    const/4 v0, 0x0

    .line 1467
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1469
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1470
    aget-short v2, p0, v1

    .line 1471
    .local v2, tmp:S
    aget-short v3, p0, v0

    aput-short v3, p0, v1

    .line 1472
    aput-short v2, p0, v0

    .line 1473
    add-int/lit8 v1, v1, -0x1

    .line 1474
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static reverse([Z)V
    .locals 4
    .parameter "array"

    .prologue
    .line 1578
    if-nez p0, :cond_1

    .line 1591
    :cond_0
    return-void

    .line 1581
    :cond_1
    const/4 v0, 0x0

    .line 1582
    .local v0, i:I
    array-length v3, p0

    add-int/lit8 v1, v3, -0x1

    .line 1584
    .local v1, j:I
    :goto_0
    if-le v1, v0, :cond_0

    .line 1585
    aget-boolean v2, p0, v1

    .line 1586
    .local v2, tmp:Z
    aget-boolean v3, p0, v0

    aput-boolean v3, p0, v1

    .line 1587
    aput-boolean v2, p0, v0

    .line 1588
    add-int/lit8 v1, v1, -0x1

    .line 1589
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static subarray([BII)[B
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 1036
    if-nez p0, :cond_0

    .line 1037
    const/4 v1, 0x0

    .line 1052
    :goto_0
    return-object v1

    .line 1039
    :cond_0
    if-gez p1, :cond_1

    .line 1040
    const/4 p1, 0x0

    .line 1042
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1043
    array-length p2, p0

    .line 1045
    :cond_2
    sub-int v0, p2, p1

    .line 1046
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 1047
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 1050
    :cond_3
    new-array v1, v0, [B

    .line 1051
    .local v1, subarray:[B
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([CII)[C
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 997
    if-nez p0, :cond_0

    .line 998
    const/4 v1, 0x0

    .line 1013
    :goto_0
    return-object v1

    .line 1000
    :cond_0
    if-gez p1, :cond_1

    .line 1001
    const/4 p1, 0x0

    .line 1003
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1004
    array-length p2, p0

    .line 1006
    :cond_2
    sub-int v0, p2, p1

    .line 1007
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 1008
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 1011
    :cond_3
    new-array v1, v0, [C

    .line 1012
    .local v1, subarray:[C
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([DII)[D
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 1075
    if-nez p0, :cond_0

    .line 1076
    const/4 v1, 0x0

    .line 1091
    :goto_0
    return-object v1

    .line 1078
    :cond_0
    if-gez p1, :cond_1

    .line 1079
    const/4 p1, 0x0

    .line 1081
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1082
    array-length p2, p0

    .line 1084
    :cond_2
    sub-int v0, p2, p1

    .line 1085
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 1086
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 1089
    :cond_3
    new-array v1, v0, [D

    .line 1090
    .local v1, subarray:[D
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([FII)[F
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 1114
    if-nez p0, :cond_0

    .line 1115
    const/4 v1, 0x0

    .line 1130
    :goto_0
    return-object v1

    .line 1117
    :cond_0
    if-gez p1, :cond_1

    .line 1118
    const/4 p1, 0x0

    .line 1120
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1121
    array-length p2, p0

    .line 1123
    :cond_2
    sub-int v0, p2, p1

    .line 1124
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 1125
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 1128
    :cond_3
    new-array v1, v0, [F

    .line 1129
    .local v1, subarray:[F
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([III)[I
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 919
    if-nez p0, :cond_0

    .line 920
    const/4 v1, 0x0

    .line 935
    :goto_0
    return-object v1

    .line 922
    :cond_0
    if-gez p1, :cond_1

    .line 923
    const/4 p1, 0x0

    .line 925
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 926
    array-length p2, p0

    .line 928
    :cond_2
    sub-int v0, p2, p1

    .line 929
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 930
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 933
    :cond_3
    new-array v1, v0, [I

    .line 934
    .local v1, subarray:[I
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([JII)[J
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 880
    if-nez p0, :cond_0

    .line 881
    const/4 v1, 0x0

    .line 896
    :goto_0
    return-object v1

    .line 883
    :cond_0
    if-gez p1, :cond_1

    .line 884
    const/4 p1, 0x0

    .line 886
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 887
    array-length p2, p0

    .line 889
    :cond_2
    sub-int v0, p2, p1

    .line 890
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 891
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 894
    :cond_3
    new-array v1, v0, [J

    .line 895
    .local v1, subarray:[J
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([Ljava/lang/Object;II)[Ljava/lang/Object;
    .locals 6
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II)[TT;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 838
    if-nez p0, :cond_0

    .line 839
    const/4 v0, 0x0

    .line 857
    :goto_0
    return-object v0

    .line 841
    :cond_0
    if-gez p1, :cond_1

    .line 842
    const/4 p1, 0x0

    .line 844
    :cond_1
    array-length v4, p0

    if-le p2, v4, :cond_2

    .line 845
    array-length p2, p0

    .line 847
    :cond_2
    sub-int v1, p2, p1

    .line 848
    .local v1, newSize:I
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    .line 849
    .local v3, type:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    if-gtz v1, :cond_3

    .line 851
    invoke-static {v3, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    .line 852
    .local v0, emptyArray:[Ljava/lang/Object;
    goto :goto_0

    .line 855
    .end local v0           #emptyArray:[Ljava/lang/Object;
    :cond_3
    invoke-static {v3, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Object;

    .line 856
    .local v2, subarray:[Ljava/lang/Object;
    invoke-static {p0, p1, v2, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v2

    .line 857
    goto :goto_0
.end method

.method public static subarray([SII)[S
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 958
    if-nez p0, :cond_0

    .line 959
    const/4 v1, 0x0

    .line 974
    :goto_0
    return-object v1

    .line 961
    :cond_0
    if-gez p1, :cond_1

    .line 962
    const/4 p1, 0x0

    .line 964
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 965
    array-length p2, p0

    .line 967
    :cond_2
    sub-int v0, p2, p1

    .line 968
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 969
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 972
    :cond_3
    new-array v1, v0, [S

    .line 973
    .local v1, subarray:[S
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static subarray([ZII)[Z
    .locals 3
    .parameter "array"
    .parameter "startIndexInclusive"
    .parameter "endIndexExclusive"

    .prologue
    .line 1153
    if-nez p0, :cond_0

    .line 1154
    const/4 v1, 0x0

    .line 1169
    :goto_0
    return-object v1

    .line 1156
    :cond_0
    if-gez p1, :cond_1

    .line 1157
    const/4 p1, 0x0

    .line 1159
    :cond_1
    array-length v2, p0

    if-le p2, v2, :cond_2

    .line 1160
    array-length p2, p0

    .line 1162
    :cond_2
    sub-int v0, p2, p1

    .line 1163
    .local v0, newSize:I
    if-gtz v0, :cond_3

    .line 1164
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 1167
    :cond_3
    new-array v1, v0, [Z

    .line 1168
    .local v1, subarray:[Z
    const/4 v2, 0x0

    invoke-static {p0, p1, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0
.end method

.method public static varargs toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 0
    .parameter "items"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 294
    return-object p0
.end method

.method public static toMap([Ljava/lang/Object;)Ljava/util/Map;
    .locals 9
    .parameter "array"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 226
    if-nez p0, :cond_1

    .line 227
    const/4 v3, 0x0

    .line 249
    :cond_0
    return-object v3

    .line 229
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    array-length v5, p0

    int-to-double v5, v5

    const-wide/high16 v7, 0x3ff8

    mul-double/2addr v5, v7

    double-to-int v5, v5

    invoke-direct {v3, v5}, Ljava/util/HashMap;-><init>(I)V

    .line 230
    .local v3, map:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    array-length v5, p0

    if-ge v2, v5, :cond_0

    .line 231
    aget-object v4, p0, v2

    .line 232
    .local v4, object:Ljava/lang/Object;
    instance-of v5, v4, Ljava/util/Map$Entry;

    if-eqz v5, :cond_2

    move-object v1, v4

    .line 233
    check-cast v1, Ljava/util/Map$Entry;

    .line 234
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<**>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<**>;"
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 235
    :cond_2
    instance-of v5, v4, [Ljava/lang/Object;

    if-eqz v5, :cond_4

    move-object v0, v4

    .line 236
    check-cast v0, [Ljava/lang/Object;

    .line 237
    .local v0, entry:[Ljava/lang/Object;
    array-length v5, v0

    const/4 v6, 0x2

    if-ge v5, v6, :cond_3

    .line 238
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Array element "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 239
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 240
    const-string v7, "\', has a length less than 2"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 238
    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 242
    :cond_3
    const/4 v5, 0x0

    aget-object v5, v0, v5

    const/4 v6, 0x1

    aget-object v6, v0, v6

    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 244
    .end local v0           #entry:[Ljava/lang/Object;
    :cond_4
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Array element "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 245
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 246
    const-string v7, "\', is neither of type Map.Entry nor an Array"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 244
    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public static toObject([Z)[Ljava/lang/Boolean;
    .locals 3
    .parameter "array"

    .prologue
    .line 3202
    if-nez p0, :cond_1

    .line 3203
    const/4 v1, 0x0

    .line 3211
    :cond_0
    :goto_0
    return-object v1

    .line 3204
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3205
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_OBJECT_ARRAY:[Ljava/lang/Boolean;

    goto :goto_0

    .line 3207
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Boolean;

    .line 3208
    .local v1, result:[Ljava/lang/Boolean;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3209
    aget-boolean v2, p0, v0

    if-eqz v2, :cond_3

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_2
    aput-object v2, v1, v0

    .line 3208
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3209
    :cond_3
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_2
.end method

.method public static toObject([B)[Ljava/lang/Byte;
    .locals 3
    .parameter "array"

    .prologue
    .line 2998
    if-nez p0, :cond_1

    .line 2999
    const/4 v1, 0x0

    .line 3007
    :cond_0
    :goto_0
    return-object v1

    .line 3000
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3001
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_OBJECT_ARRAY:[Ljava/lang/Byte;

    goto :goto_0

    .line 3003
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Byte;

    .line 3004
    .local v1, result:[Ljava/lang/Byte;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3005
    aget-byte v2, p0, v0

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    aput-object v2, v1, v0

    .line 3004
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([C)[Ljava/lang/Character;
    .locals 3
    .parameter "array"

    .prologue
    .line 2726
    if-nez p0, :cond_1

    .line 2727
    const/4 v1, 0x0

    .line 2735
    :cond_0
    :goto_0
    return-object v1

    .line 2728
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2729
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHARACTER_OBJECT_ARRAY:[Ljava/lang/Character;

    goto :goto_0

    .line 2731
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Character;

    .line 2732
    .local v1, result:[Ljava/lang/Character;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2733
    aget-char v2, p0, v0

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    aput-object v2, v1, v0

    .line 2732
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([D)[Ljava/lang/Double;
    .locals 4
    .parameter "array"

    .prologue
    .line 3066
    if-nez p0, :cond_1

    .line 3067
    const/4 v1, 0x0

    .line 3075
    :cond_0
    :goto_0
    return-object v1

    .line 3068
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3069
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_OBJECT_ARRAY:[Ljava/lang/Double;

    goto :goto_0

    .line 3071
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Double;

    .line 3072
    .local v1, result:[Ljava/lang/Double;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3073
    aget-wide v2, p0, v0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v1, v0

    .line 3072
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([F)[Ljava/lang/Float;
    .locals 3
    .parameter "array"

    .prologue
    .line 3134
    if-nez p0, :cond_1

    .line 3135
    const/4 v1, 0x0

    .line 3143
    :cond_0
    :goto_0
    return-object v1

    .line 3136
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3137
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_OBJECT_ARRAY:[Ljava/lang/Float;

    goto :goto_0

    .line 3139
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Float;

    .line 3140
    .local v1, result:[Ljava/lang/Float;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3141
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v1, v0

    .line 3140
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([I)[Ljava/lang/Integer;
    .locals 3
    .parameter "array"

    .prologue
    .line 2862
    if-nez p0, :cond_1

    .line 2863
    const/4 v1, 0x0

    .line 2871
    :cond_0
    :goto_0
    return-object v1

    .line 2864
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2865
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INTEGER_OBJECT_ARRAY:[Ljava/lang/Integer;

    goto :goto_0

    .line 2867
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Integer;

    .line 2868
    .local v1, result:[Ljava/lang/Integer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2869
    aget v2, p0, v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v0

    .line 2868
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([J)[Ljava/lang/Long;
    .locals 4
    .parameter "array"

    .prologue
    .line 2794
    if-nez p0, :cond_1

    .line 2795
    const/4 v1, 0x0

    .line 2803
    :cond_0
    :goto_0
    return-object v1

    .line 2796
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2797
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_OBJECT_ARRAY:[Ljava/lang/Long;

    goto :goto_0

    .line 2799
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Long;

    .line 2800
    .local v1, result:[Ljava/lang/Long;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2801
    aget-wide v2, p0, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v0

    .line 2800
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toObject([S)[Ljava/lang/Short;
    .locals 3
    .parameter "array"

    .prologue
    .line 2930
    if-nez p0, :cond_1

    .line 2931
    const/4 v1, 0x0

    .line 2939
    :cond_0
    :goto_0
    return-object v1

    .line 2932
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2933
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_OBJECT_ARRAY:[Ljava/lang/Short;

    goto :goto_0

    .line 2935
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Short;

    .line 2936
    .local v1, result:[Ljava/lang/Short;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2937
    aget-short v2, p0, v0

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    aput-object v2, v1, v0

    .line 2936
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Byte;)[B
    .locals 3
    .parameter "array"

    .prologue
    .line 2954
    if-nez p0, :cond_1

    .line 2955
    const/4 v1, 0x0

    .line 2963
    :cond_0
    :goto_0
    return-object v1

    .line 2956
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2957
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 2959
    :cond_2
    array-length v2, p0

    new-array v1, v2, [B

    .line 2960
    .local v1, result:[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2961
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, v1, v0

    .line 2960
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Byte;B)[B
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 2976
    if-nez p0, :cond_1

    .line 2977
    const/4 v2, 0x0

    .line 2986
    :cond_0
    :goto_0
    return-object v2

    .line 2978
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2979
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BYTE_ARRAY:[B

    goto :goto_0

    .line 2981
    :cond_2
    array-length v3, p0

    new-array v2, v3, [B

    .line 2982
    .local v2, result:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2983
    aget-object v0, p0, v1

    .line 2984
    .local v0, b:Ljava/lang/Byte;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-byte v3, v2, v1

    .line 2982
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2984
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Character;)[C
    .locals 3
    .parameter "array"

    .prologue
    .line 2682
    if-nez p0, :cond_1

    .line 2683
    const/4 v1, 0x0

    .line 2691
    :cond_0
    :goto_0
    return-object v1

    .line 2684
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2685
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 2687
    :cond_2
    array-length v2, p0

    new-array v1, v2, [C

    .line 2688
    .local v1, result:[C
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2689
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    aput-char v2, v1, v0

    .line 2688
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Character;C)[C
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 2704
    if-nez p0, :cond_1

    .line 2705
    const/4 v2, 0x0

    .line 2714
    :cond_0
    :goto_0
    return-object v2

    .line 2706
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2707
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_CHAR_ARRAY:[C

    goto :goto_0

    .line 2709
    :cond_2
    array-length v3, p0

    new-array v2, v3, [C

    .line 2710
    .local v2, result:[C
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2711
    aget-object v0, p0, v1

    .line 2712
    .local v0, b:Ljava/lang/Character;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-char v3, v2, v1

    .line 2710
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2712
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Double;)[D
    .locals 4
    .parameter "array"

    .prologue
    .line 3022
    if-nez p0, :cond_1

    .line 3023
    const/4 v1, 0x0

    .line 3031
    :cond_0
    :goto_0
    return-object v1

    .line 3024
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3025
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 3027
    :cond_2
    array-length v2, p0

    new-array v1, v2, [D

    .line 3028
    .local v1, result:[D
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3029
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 3028
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Double;D)[D
    .locals 5
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 3044
    if-nez p0, :cond_1

    .line 3045
    const/4 v2, 0x0

    .line 3054
    :cond_0
    :goto_0
    return-object v2

    .line 3046
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3047
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_DOUBLE_ARRAY:[D

    goto :goto_0

    .line 3049
    :cond_2
    array-length v3, p0

    new-array v2, v3, [D

    .line 3050
    .local v2, result:[D
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3051
    aget-object v0, p0, v1

    .line 3052
    .local v0, b:Ljava/lang/Double;
    if-nez v0, :cond_3

    move-wide v3, p1

    :goto_2
    aput-wide v3, v2, v1

    .line 3050
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3052
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Float;)[F
    .locals 3
    .parameter "array"

    .prologue
    .line 3090
    if-nez p0, :cond_1

    .line 3091
    const/4 v1, 0x0

    .line 3099
    :cond_0
    :goto_0
    return-object v1

    .line 3092
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3093
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 3095
    :cond_2
    array-length v2, p0

    new-array v1, v2, [F

    .line 3096
    .local v1, result:[F
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3097
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v1, v0

    .line 3096
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Float;F)[F
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 3112
    if-nez p0, :cond_1

    .line 3113
    const/4 v2, 0x0

    .line 3122
    :cond_0
    :goto_0
    return-object v2

    .line 3114
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3115
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_FLOAT_ARRAY:[F

    goto :goto_0

    .line 3117
    :cond_2
    array-length v3, p0

    new-array v2, v3, [F

    .line 3118
    .local v2, result:[F
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3119
    aget-object v0, p0, v1

    .line 3120
    .local v0, b:Ljava/lang/Float;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput v3, v2, v1

    .line 3118
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3120
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Integer;)[I
    .locals 3
    .parameter "array"

    .prologue
    .line 2818
    if-nez p0, :cond_1

    .line 2819
    const/4 v1, 0x0

    .line 2827
    :cond_0
    :goto_0
    return-object v1

    .line 2820
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2821
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 2823
    :cond_2
    array-length v2, p0

    new-array v1, v2, [I

    .line 2824
    .local v1, result:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2825
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v1, v0

    .line 2824
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Integer;I)[I
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 2840
    if-nez p0, :cond_1

    .line 2841
    const/4 v2, 0x0

    .line 2850
    :cond_0
    :goto_0
    return-object v2

    .line 2842
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2843
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_INT_ARRAY:[I

    goto :goto_0

    .line 2845
    :cond_2
    array-length v3, p0

    new-array v2, v3, [I

    .line 2846
    .local v2, result:[I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2847
    aget-object v0, p0, v1

    .line 2848
    .local v0, b:Ljava/lang/Integer;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput v3, v2, v1

    .line 2846
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2848
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Long;)[J
    .locals 4
    .parameter "array"

    .prologue
    .line 2750
    if-nez p0, :cond_1

    .line 2751
    const/4 v1, 0x0

    .line 2759
    :cond_0
    :goto_0
    return-object v1

    .line 2752
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2753
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 2755
    :cond_2
    array-length v2, p0

    new-array v1, v2, [J

    .line 2756
    .local v1, result:[J
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2757
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    aput-wide v2, v1, v0

    .line 2756
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Long;J)[J
    .locals 5
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 2772
    if-nez p0, :cond_1

    .line 2773
    const/4 v2, 0x0

    .line 2782
    :cond_0
    :goto_0
    return-object v2

    .line 2774
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2775
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_LONG_ARRAY:[J

    goto :goto_0

    .line 2777
    :cond_2
    array-length v3, p0

    new-array v2, v3, [J

    .line 2778
    .local v2, result:[J
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2779
    aget-object v0, p0, v1

    .line 2780
    .local v0, b:Ljava/lang/Long;
    if-nez v0, :cond_3

    move-wide v3, p1

    :goto_2
    aput-wide v3, v2, v1

    .line 2778
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2780
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Short;)[S
    .locals 3
    .parameter "array"

    .prologue
    .line 2886
    if-nez p0, :cond_1

    .line 2887
    const/4 v1, 0x0

    .line 2895
    :cond_0
    :goto_0
    return-object v1

    .line 2888
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 2889
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 2891
    :cond_2
    array-length v2, p0

    new-array v1, v2, [S

    .line 2892
    .local v1, result:[S
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 2893
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Short;->shortValue()S

    move-result v2

    aput-short v2, v1, v0

    .line 2892
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Short;S)[S
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 2908
    if-nez p0, :cond_1

    .line 2909
    const/4 v2, 0x0

    .line 2918
    :cond_0
    :goto_0
    return-object v2

    .line 2910
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 2911
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_SHORT_ARRAY:[S

    goto :goto_0

    .line 2913
    :cond_2
    array-length v3, p0

    new-array v2, v3, [S

    .line 2914
    .local v2, result:[S
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 2915
    aget-object v0, p0, v1

    .line 2916
    .local v0, b:Ljava/lang/Short;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-short v3, v2, v1

    .line 2914
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2916
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Short;->shortValue()S

    move-result v3

    goto :goto_2
.end method

.method public static toPrimitive([Ljava/lang/Boolean;)[Z
    .locals 3
    .parameter "array"

    .prologue
    .line 3158
    if-nez p0, :cond_1

    .line 3159
    const/4 v1, 0x0

    .line 3167
    :cond_0
    :goto_0
    return-object v1

    .line 3160
    :cond_1
    array-length v2, p0

    if-nez v2, :cond_2

    .line 3161
    sget-object v1, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 3163
    :cond_2
    array-length v2, p0

    new-array v1, v2, [Z

    .line 3164
    .local v1, result:[Z
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v2, p0

    if-ge v0, v2, :cond_0

    .line 3165
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    aput-boolean v2, v1, v0

    .line 3164
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static toPrimitive([Ljava/lang/Boolean;Z)[Z
    .locals 4
    .parameter "array"
    .parameter "valueForNull"

    .prologue
    .line 3180
    if-nez p0, :cond_1

    .line 3181
    const/4 v2, 0x0

    .line 3190
    :cond_0
    :goto_0
    return-object v2

    .line 3182
    :cond_1
    array-length v3, p0

    if-nez v3, :cond_2

    .line 3183
    sget-object v2, Lorg/apache/commons/lang3/ArrayUtils;->EMPTY_BOOLEAN_ARRAY:[Z

    goto :goto_0

    .line 3185
    :cond_2
    array-length v3, p0

    new-array v2, v3, [Z

    .line 3186
    .local v2, result:[Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    array-length v3, p0

    if-ge v1, v3, :cond_0

    .line 3187
    aget-object v0, p0, v1

    .line 3188
    .local v0, b:Ljava/lang/Boolean;
    if-nez v0, :cond_3

    move v3, p1

    :goto_2
    aput-boolean v3, v2, v1

    .line 3186
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 3188
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    goto :goto_2
.end method

.method public static toString(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .parameter "array"

    .prologue
    .line 162
    const-string v0, "{}"

    invoke-static {p0, v0}, Lorg/apache/commons/lang3/ArrayUtils;->toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "array"
    .parameter "stringIfNull"

    .prologue
    .line 178
    if-nez p0, :cond_0

    .line 181
    .end local p1
    :goto_0
    return-object p1

    .restart local p1
    :cond_0
    new-instance v0, Lorg/apache/commons/lang3/builder/ToStringBuilder;

    sget-object v1, Lorg/apache/commons/lang3/builder/ToStringStyle;->SIMPLE_STYLE:Lorg/apache/commons/lang3/builder/ToStringStyle;

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/lang3/builder/ToStringBuilder;-><init>(Ljava/lang/Object;Lorg/apache/commons/lang3/builder/ToStringStyle;)V

    invoke-virtual {v0, p0}, Lorg/apache/commons/lang3/builder/ToStringBuilder;->append(Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/ToStringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/builder/ToStringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method
