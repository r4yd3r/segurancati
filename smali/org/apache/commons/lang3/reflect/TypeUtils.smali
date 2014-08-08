.class public Lorg/apache/commons/lang3/reflect/TypeUtils;
.super Ljava/lang/Object;
.source "TypeUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    return-void
.end method

.method public static determineTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/util/Map;
    .locals 6
    .parameter
    .parameter "superType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 697
    invoke-static {p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v3

    .line 700
    .local v3, superClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {p0, v3}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 724
    :goto_0
    return-object v4

    .line 704
    :cond_0
    invoke-virtual {p0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 705
    invoke-static {p1, v3, v4}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    goto :goto_0

    .line 709
    :cond_1
    invoke-static {p0, v3}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getClosestParentType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 712
    .local v2, midType:Ljava/lang/reflect/Type;
    instance-of v5, v2, Ljava/lang/Class;

    if-eqz v5, :cond_2

    .line 713
    check-cast v2, Ljava/lang/Class;

    .end local v2           #midType:Ljava/lang/reflect/Type;
    invoke-static {v2, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->determineTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/util/Map;

    move-result-object v4

    goto :goto_0

    .restart local v2       #midType:Ljava/lang/reflect/Type;
    :cond_2
    move-object v1, v2

    .line 716
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 717
    .local v1, midParameterizedType:Ljava/lang/reflect/ParameterizedType;
    invoke-static {v1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v0

    .line 720
    .local v0, midClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->determineTypeArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;)Ljava/util/Map;

    move-result-object v4

    .line 722
    .local v4, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {p0, v1, v4}, Lorg/apache/commons/lang3/reflect/TypeUtils;->mapTypeVariablesToArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V

    goto :goto_0
.end method

.method private static getClosestParentType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 8
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 783
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p1, superClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 785
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 787
    .local v2, interfaceTypes:[Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .line 790
    .local v0, genericInterface:Ljava/lang/reflect/Type;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v5, v2

    if-lt v1, v5, :cond_0

    .line 812
    if-eqz v0, :cond_4

    .line 819
    .end local v0           #genericInterface:Ljava/lang/reflect/Type;
    .end local v1           #i:I
    .end local v2           #interfaceTypes:[Ljava/lang/reflect/Type;
    :goto_1
    return-object v0

    .line 791
    .restart local v0       #genericInterface:Ljava/lang/reflect/Type;
    .restart local v1       #i:I
    .restart local v2       #interfaceTypes:[Ljava/lang/reflect/Type;
    :cond_0
    aget-object v4, v2, v1

    .line 792
    .local v4, midType:Ljava/lang/reflect/Type;
    const/4 v3, 0x0

    .line 794
    .local v3, midClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    instance-of v5, v4, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_2

    move-object v5, v4

    .line 795
    check-cast v5, Ljava/lang/reflect/ParameterizedType;

    invoke-static {v5}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v3

    .line 805
    :goto_2
    invoke-static {v3, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 806
    invoke-static {v0, v3}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 807
    move-object v0, v4

    .line 790
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 796
    :cond_2
    instance-of v5, v4, Ljava/lang/Class;

    if-eqz v5, :cond_3

    move-object v3, v4

    .line 797
    check-cast v3, Ljava/lang/Class;

    .line 798
    goto :goto_2

    .line 799
    :cond_3
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Unexpected generic interface type found: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 800
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 799
    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 819
    .end local v0           #genericInterface:Ljava/lang/reflect/Type;
    .end local v1           #i:I
    .end local v2           #interfaceTypes:[Ljava/lang/reflect/Type;
    .end local v3           #midClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v4           #midType:Ljava/lang/reflect/Type;
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    goto :goto_1
.end method

.method public static getImplicitBounds(Ljava/lang/reflect/TypeVariable;)[Ljava/lang/reflect/Type;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;)[",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 896
    .local p0, typeVariable:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 898
    .local v0, bounds:[Ljava/lang/reflect/Type;
    array-length v1, v0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/reflect/Type;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/Object;

    aput-object v3, v1, v2

    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->normalizeUpperBounds([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v1

    goto :goto_0
.end method

.method public static getImplicitLowerBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;
    .locals 2
    .parameter "wildcardType"

    .prologue
    .line 927
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 929
    .local v0, bounds:[Ljava/lang/reflect/Type;
    array-length v1, v0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/reflect/Type;

    .end local v0           #bounds:[Ljava/lang/reflect/Type;
    :cond_0
    return-object v0
.end method

.method public static getImplicitUpperBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;
    .locals 4
    .parameter "wildcardType"

    .prologue
    .line 912
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 914
    .local v0, bounds:[Ljava/lang/reflect/Type;
    array-length v1, v0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/reflect/Type;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/Object;

    aput-object v3, v1, v2

    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->normalizeUpperBounds([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;

    move-result-object v1

    goto :goto_0
.end method

.method private static getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;
    .locals 4
    .parameter "parameterizedType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 970
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 977
    .local v0, rawType:Ljava/lang/reflect/Type;
    instance-of v1, v0, Ljava/lang/Class;

    if-nez v1, :cond_0

    .line 978
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Wait... What!? Type of rawType: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 981
    :cond_0
    check-cast v0, Ljava/lang/Class;

    .end local v0           #rawType:Ljava/lang/reflect/Type;
    return-object v0
.end method

.method public static getRawType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .locals 7
    .parameter "type"
    .parameter "assigningType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 997
    instance-of v4, p0, Ljava/lang/Class;

    if-eqz v4, :cond_0

    .line 999
    check-cast p0, Ljava/lang/Class;

    .line 1054
    .end local p0
    :goto_0
    return-object p0

    .line 1002
    .restart local p0
    :cond_0
    instance-of v4, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v4, :cond_1

    .line 1004
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 1007
    .restart local p0
    :cond_1
    instance-of v4, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v4, :cond_6

    .line 1008
    if-nez p1, :cond_2

    move-object p0, v5

    .line 1009
    goto :goto_0

    :cond_2
    move-object v4, p0

    .line 1013
    check-cast v4, Ljava/lang/reflect/TypeVariable;

    invoke-interface {v4}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v0

    .line 1017
    .local v0, genericDeclaration:Ljava/lang/reflect/GenericDeclaration;
    instance-of v4, v0, Ljava/lang/Class;

    if-nez v4, :cond_3

    move-object p0, v5

    .line 1018
    goto :goto_0

    .line 1024
    :cond_3
    check-cast v0, Ljava/lang/Class;

    .line 1023
    .end local v0           #genericDeclaration:Ljava/lang/reflect/GenericDeclaration;
    invoke-static {p1, v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v3

    .line 1028
    .local v3, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    if-nez v3, :cond_4

    move-object p0, v5

    .line 1029
    goto :goto_0

    .line 1033
    :cond_4
    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Type;

    .line 1035
    .local v2, typeArgument:Ljava/lang/reflect/Type;
    if-nez v2, :cond_5

    move-object p0, v5

    .line 1036
    goto :goto_0

    .line 1040
    :cond_5
    invoke-static {v2, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 1043
    .end local v2           #typeArgument:Ljava/lang/reflect/Type;
    .end local v3           #typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_6
    instance-of v4, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v4, :cond_7

    .line 1045
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .line 1046
    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 1045
    invoke-static {v4, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    .line 1049
    .local v1, rawComponentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    invoke-static {v1, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_0

    .line 1053
    .end local v1           #rawComponentType:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .restart local p0
    :cond_7
    instance-of v4, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v4, :cond_8

    move-object p0, v5

    .line 1054
    goto :goto_0

    .line 1057
    :cond_8
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "unknown type: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private static getTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;
    .locals 2
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 638
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p1, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, subtypeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 639
    const/4 v0, 0x0

    .line 665
    :cond_0
    :goto_0
    return-object v0

    .line 643
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 645
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 648
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    .line 652
    :cond_2
    invoke-static {p0}, Lorg/apache/commons/lang3/ClassUtils;->primitiveToWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object p0

    .line 656
    :cond_3
    if-nez p2, :cond_4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 660
    .local v0, typeVarAssigns:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v1

    array-length v1, v1

    if-gtz v1, :cond_0

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 665
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getClosestParentType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v1, p1, v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    goto :goto_0

    .line 657
    .end local v0           #typeVarAssigns:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_4
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_1
.end method

.method public static getTypeArguments(Ljava/lang/reflect/ParameterizedType;)Ljava/util/Map;
    .locals 2
    .parameter "type"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 483
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;
    .locals 10
    .parameter "parameterizedType"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 585
    .local p1, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, subtypeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v0

    .line 588
    .local v0, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 589
    const/4 v7, 0x0

    .line 624
    :cond_0
    :goto_0
    return-object v7

    .line 592
    :cond_1
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 595
    .local v2, ownerType:Ljava/lang/reflect/Type;
    instance-of v8, v2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v8, :cond_2

    move-object v3, v2

    .line 597
    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    .line 599
    .local v3, parameterizedOwnerType:Ljava/lang/reflect/ParameterizedType;
    invoke-static {v3}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v8

    .line 598
    invoke-static {v3, v8, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v7

    .line 607
    .end local v3           #parameterizedOwnerType:Ljava/lang/reflect/ParameterizedType;
    .local v7, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :goto_1
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 609
    .local v5, typeArgs:[Ljava/lang/reflect/Type;
    invoke-virtual {v0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v6

    .line 612
    .local v6, typeParams:[Ljava/lang/reflect/TypeVariable;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    array-length v8, v6

    if-lt v1, v8, :cond_4

    .line 618
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 624
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getClosestParentType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v8

    invoke-static {v8, p1, v7}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v7

    goto :goto_0

    .line 602
    .end local v1           #i:I
    .end local v5           #typeArgs:[Ljava/lang/reflect/Type;
    .end local v6           #typeParams:[Ljava/lang/reflect/TypeVariable;
    .end local v7           #typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_2
    if-nez p2, :cond_3

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .restart local v7       #typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :goto_3
    goto :goto_1

    .line 603
    .end local v7           #typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_3
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    goto :goto_3

    .line 613
    .restart local v1       #i:I
    .restart local v5       #typeArgs:[Ljava/lang/reflect/Type;
    .restart local v6       #typeParams:[Ljava/lang/reflect/TypeVariable;
    .restart local v7       #typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    :cond_4
    aget-object v4, v5, v1

    .line 614
    .local v4, typeArg:Ljava/lang/reflect/Type;
    aget-object v9, v6, v1

    invoke-interface {v7, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 615
    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/reflect/Type;

    .line 614
    :goto_4
    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_5
    move-object v8, v4

    .line 615
    goto :goto_4
.end method

.method public static getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/util/Map;
    .locals 1
    .parameter "type"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .line 519
    .local p1, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;
    .locals 6
    .parameter "type"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;"
        }
    .end annotation

    .prologue
    .local p1, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .local p2, subtypeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 532
    instance-of v3, p0, Ljava/lang/Class;

    if-eqz v3, :cond_1

    .line 533
    check-cast p0, Ljava/lang/Class;

    .end local p0
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    .line 567
    .end local p1           #toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_0
    :goto_0
    return-object v1

    .line 536
    .restart local p0
    .restart local p1       #toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_1
    instance-of v3, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_2

    .line 537
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 540
    .restart local p0
    :cond_2
    instance-of v3, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v3, :cond_4

    .line 541
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 542
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    .line 541
    .end local p1           #toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_3
    invoke-static {v1, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 547
    .restart local p0
    .restart local p1       #toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_4
    instance-of v3, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v3, :cond_6

    .line 548
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitUpperBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v3

    array-length v4, v3

    :goto_1
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 550
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 551
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 548
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 559
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_6
    instance-of v3, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v3, :cond_8

    .line 560
    check-cast p0, Ljava/lang/reflect/TypeVariable;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitBounds(Ljava/lang/reflect/TypeVariable;)[Ljava/lang/reflect/Type;

    move-result-object v3

    array-length v4, v3

    :goto_2
    if-ge v2, v4, :cond_0

    aget-object v0, v3, v2

    .line 562
    .restart local v0       #bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 563
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 560
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 571
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "found an unhandled type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z
    .locals 7
    .parameter "type"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 116
    if-nez p0, :cond_2

    .line 118
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 167
    .end local p0
    :cond_0
    :goto_0
    return v1

    .restart local p0
    :cond_1
    move v1, v2

    .line 118
    goto :goto_0

    .line 123
    :cond_2
    if-eqz p1, :cond_0

    .line 128
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    move v1, v2

    .line 129
    goto :goto_0

    .line 132
    :cond_3
    instance-of v3, p0, Ljava/lang/Class;

    if-eqz v3, :cond_4

    .line 134
    check-cast p0, Ljava/lang/Class;

    .end local p0
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    goto :goto_0

    .line 137
    .restart local p0
    :cond_4
    instance-of v3, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_5

    .line 139
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v1

    goto :goto_0

    .line 143
    .restart local p0
    :cond_5
    instance-of v3, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v3, :cond_7

    .line 146
    check-cast p0, Ljava/lang/reflect/TypeVariable;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    array-length v5, v4

    move v3, v1

    :goto_1
    if-ge v3, v5, :cond_0

    aget-object v0, v4, v3

    .line 147
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_6

    move v1, v2

    .line 148
    goto :goto_0

    .line 146
    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 157
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_7
    instance-of v3, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v3, :cond_9

    .line 158
    const-class v3, Ljava/lang/Object;

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 159
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 160
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 161
    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    .line 160
    invoke-static {v3, v4}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v3

    .line 161
    if-eqz v3, :cond_0

    :cond_8
    move v1, v2

    .line 158
    goto :goto_0

    .line 166
    .restart local p0
    :cond_9
    instance-of v2, p0, Ljava/lang/reflect/WildcardType;

    if-nez v2, :cond_0

    .line 170
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "found an unhandled type: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/GenericArrayType;Ljava/util/Map;)Z
    .locals 9
    .parameter "type"
    .parameter "toGenericArrayType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/GenericArrayType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 250
    if-nez p0, :cond_1

    .line 308
    .end local p0
    :cond_0
    :goto_0
    return v3

    .line 256
    .restart local p0
    :cond_1
    if-nez p1, :cond_2

    move v3, v4

    .line 257
    goto :goto_0

    .line 261
    :cond_2
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 265
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 267
    .local v2, toComponentType:Ljava/lang/reflect/Type;
    instance-of v5, p0, Ljava/lang/Class;

    if-eqz v5, :cond_4

    move-object v1, p0

    .line 268
    check-cast v1, Ljava/lang/Class;

    .line 271
    .local v1, cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 272
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5, v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v5

    if-nez v5, :cond_0

    :cond_3
    move v3, v4

    .line 271
    goto :goto_0

    .line 275
    .end local v1           #cls:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    :cond_4
    instance-of v5, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v5, :cond_5

    .line 277
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v3, v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v3

    goto :goto_0

    .line 281
    .restart local p0
    :cond_5
    instance-of v5, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v5, :cond_7

    .line 283
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitUpperBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v6

    array-length v7, v6

    move v5, v4

    :goto_1
    if-lt v5, v7, :cond_6

    move v3, v4

    .line 289
    goto :goto_0

    .line 283
    :cond_6
    aget-object v0, v6, v5

    .line 284
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 283
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 292
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_7
    instance-of v5, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v5, :cond_9

    .line 295
    check-cast p0, Ljava/lang/reflect/TypeVariable;

    .end local p0
    invoke-static {p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitBounds(Ljava/lang/reflect/TypeVariable;)[Ljava/lang/reflect/Type;

    move-result-object v6

    array-length v7, v6

    move v5, v4

    :goto_2
    if-lt v5, v7, :cond_8

    move v3, v4

    .line 301
    goto :goto_0

    .line 295
    :cond_8
    aget-object v0, v6, v5

    .line 296
    .restart local v0       #bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 295
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 304
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .restart local p0
    :cond_9
    instance-of v3, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v3, :cond_a

    move v3, v4

    .line 308
    goto :goto_0

    .line 311
    :cond_a
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "found an unhandled type: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)Z
    .locals 10
    .parameter "type"
    .parameter "toParameterizedType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/ParameterizedType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 183
    if-nez p0, :cond_1

    .line 236
    :cond_0
    :goto_0
    return v6

    .line 189
    :cond_1
    if-nez p1, :cond_2

    move v6, v7

    .line 190
    goto :goto_0

    .line 194
    :cond_2
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 199
    invoke-static {p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v3

    .line 202
    .local v3, toClass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    invoke-static {p0, v3, v8}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    .line 205
    .local v2, fromTypeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    if-nez v2, :cond_3

    move v6, v7

    .line 206
    goto :goto_0

    .line 212
    :cond_3
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_0

    .line 217
    invoke-static {p1, v3, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getTypeArguments(Ljava/lang/reflect/ParameterizedType;Ljava/lang/Class;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    .line 221
    .local v5, toTypeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 222
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/reflect/Type;

    .line 223
    .local v4, toTypeArg:Ljava/lang/reflect/Type;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Type;

    .line 228
    .local v1, fromTypeArg:Ljava/lang/reflect/Type;
    if-eqz v1, :cond_4

    .line 229
    invoke-virtual {v4, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 230
    instance-of v9, v4, Ljava/lang/reflect/WildcardType;

    if-eqz v9, :cond_5

    invoke-static {v1, v4, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v9

    .line 231
    if-nez v9, :cond_4

    :cond_5
    move v6, v7

    .line 232
    goto :goto_0
.end method

.method public static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .locals 1
    .parameter "type"
    .parameter "toType"

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v0

    return v0
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z
    .locals 3
    .parameter "type"
    .parameter "toType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 82
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    if-eqz p1, :cond_0

    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 83
    :cond_0
    check-cast p1, Ljava/lang/Class;

    .end local p1
    invoke-static {p0, p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/Class;)Z

    move-result v0

    .line 100
    :goto_0
    return v0

    .line 86
    .restart local p1
    :cond_1
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_2

    .line 87
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)Z

    move-result v0

    goto :goto_0

    .line 90
    .restart local p1
    :cond_2
    instance-of v0, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_3

    .line 91
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/GenericArrayType;Ljava/util/Map;)Z

    move-result v0

    goto :goto_0

    .line 94
    .restart local p1
    :cond_3
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_4

    .line 95
    check-cast p1, Ljava/lang/reflect/WildcardType;

    .end local p1
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;Ljava/util/Map;)Z

    move-result v0

    goto :goto_0

    .line 99
    .restart local p1
    :cond_4
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_5

    .line 100
    check-cast p1, Ljava/lang/reflect/TypeVariable;

    .end local p1
    invoke-static {p0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;Ljava/util/Map;)Z

    move-result v0

    goto :goto_0

    .line 104
    .restart local p1
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "found an unhandled type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;Ljava/util/Map;)Z
    .locals 7
    .parameter "type"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, toTypeVariable:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 413
    if-nez p0, :cond_0

    move v2, v3

    .line 443
    :goto_0
    return v2

    .line 419
    :cond_0
    if-nez p1, :cond_1

    move v2, v4

    .line 420
    goto :goto_0

    .line 424
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    move v2, v3

    .line 425
    goto :goto_0

    .line 428
    :cond_2
    instance-of v2, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v2, :cond_3

    move-object v2, p0

    .line 432
    check-cast v2, Ljava/lang/reflect/TypeVariable;

    invoke-static {v2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitBounds(Ljava/lang/reflect/TypeVariable;)[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 434
    .local v1, bounds:[Ljava/lang/reflect/Type;
    array-length v5, v1

    move v2, v4

    :goto_1
    if-lt v2, v5, :cond_5

    .line 441
    .end local v1           #bounds:[Ljava/lang/reflect/Type;
    :cond_3
    instance-of v2, p0, Ljava/lang/Class;

    if-nez v2, :cond_4

    instance-of v2, p0, Ljava/lang/reflect/ParameterizedType;

    if-nez v2, :cond_4

    .line 442
    instance-of v2, p0, Ljava/lang/reflect/GenericArrayType;

    if-nez v2, :cond_4

    instance-of v2, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v2, :cond_7

    :cond_4
    move v2, v4

    .line 443
    goto :goto_0

    .line 434
    .restart local v1       #bounds:[Ljava/lang/reflect/Type;
    :cond_5
    aget-object v0, v1, v2

    .line 435
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/TypeVariable;Ljava/util/Map;)Z

    move-result v6

    if-eqz v6, :cond_6

    move v2, v3

    .line 436
    goto :goto_0

    .line 434
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 446
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .end local v1           #bounds:[Ljava/lang/reflect/Type;
    :cond_7
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "found an unhandled type: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/WildcardType;Ljava/util/Map;)Z
    .locals 12
    .parameter "type"
    .parameter "toWildcardType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/reflect/WildcardType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 325
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    if-nez p0, :cond_0

    .line 326
    const/4 v7, 0x1

    .line 399
    :goto_0
    return v7

    .line 331
    :cond_0
    if-nez p1, :cond_1

    .line 332
    const/4 v7, 0x0

    goto :goto_0

    .line 336
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 337
    const/4 v7, 0x1

    goto :goto_0

    .line 340
    :cond_2
    invoke-static {p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitUpperBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 341
    .local v4, toUpperBounds:[Ljava/lang/reflect/Type;
    invoke-static {p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitLowerBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 343
    .local v3, toLowerBounds:[Ljava/lang/reflect/Type;
    instance-of v7, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v7, :cond_9

    move-object v6, p0

    .line 344
    check-cast v6, Ljava/lang/reflect/WildcardType;

    .line 345
    .local v6, wildcardType:Ljava/lang/reflect/WildcardType;
    invoke-static {v6}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitUpperBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 346
    .local v5, upperBounds:[Ljava/lang/reflect/Type;
    invoke-static {v6}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitLowerBounds(Ljava/lang/reflect/WildcardType;)[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 348
    .local v1, lowerBounds:[Ljava/lang/reflect/Type;
    array-length v9, v4

    const/4 v7, 0x0

    move v8, v7

    :goto_1
    if-lt v8, v9, :cond_3

    .line 363
    array-length v9, v3

    const/4 v7, 0x0

    move v8, v7

    :goto_2
    if-lt v8, v9, :cond_6

    .line 378
    const/4 v7, 0x1

    goto :goto_0

    .line 348
    :cond_3
    aget-object v2, v4, v8

    .line 351
    .local v2, toBound:Ljava/lang/reflect/Type;
    invoke-static {v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 356
    array-length v10, v5

    const/4 v7, 0x0

    :goto_3
    if-lt v7, v10, :cond_4

    .line 348
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    goto :goto_1

    .line 356
    :cond_4
    aget-object v0, v5, v7

    .line 357
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 358
    const/4 v7, 0x0

    goto :goto_0

    .line 356
    :cond_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 363
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .end local v2           #toBound:Ljava/lang/reflect/Type;
    :cond_6
    aget-object v2, v3, v8

    .line 366
    .restart local v2       #toBound:Ljava/lang/reflect/Type;
    invoke-static {v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 371
    array-length v10, v1

    const/4 v7, 0x0

    :goto_4
    if-lt v7, v10, :cond_7

    .line 363
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    goto :goto_2

    .line 371
    :cond_7
    aget-object v0, v1, v7

    .line 372
    .restart local v0       #bound:Ljava/lang/reflect/Type;
    invoke-static {v2, v0, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v11

    if-nez v11, :cond_8

    .line 373
    const/4 v7, 0x0

    goto :goto_0

    .line 371
    :cond_8
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 381
    .end local v0           #bound:Ljava/lang/reflect/Type;
    .end local v1           #lowerBounds:[Ljava/lang/reflect/Type;
    .end local v2           #toBound:Ljava/lang/reflect/Type;
    .end local v5           #upperBounds:[Ljava/lang/reflect/Type;
    .end local v6           #wildcardType:Ljava/lang/reflect/WildcardType;
    :cond_9
    array-length v8, v4

    const/4 v7, 0x0

    :goto_5
    if-lt v7, v8, :cond_a

    .line 390
    array-length v8, v3

    const/4 v7, 0x0

    :goto_6
    if-lt v7, v8, :cond_c

    .line 399
    const/4 v7, 0x1

    goto :goto_0

    .line 381
    :cond_a
    aget-object v2, v4, v7

    .line 384
    .restart local v2       #toBound:Ljava/lang/reflect/Type;
    invoke-static {v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v9

    invoke-static {p0, v9, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v9

    .line 385
    if-nez v9, :cond_b

    .line 386
    const/4 v7, 0x0

    goto :goto_0

    .line 381
    :cond_b
    add-int/lit8 v7, v7, 0x1

    goto :goto_5

    .line 390
    .end local v2           #toBound:Ljava/lang/reflect/Type;
    :cond_c
    aget-object v2, v3, v7

    .line 393
    .restart local v2       #toBound:Ljava/lang/reflect/Type;
    invoke-static {v2, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v9

    invoke-static {v9, p0, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v9

    .line 394
    if-nez v9, :cond_d

    .line 395
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 390
    :cond_d
    add-int/lit8 v7, v7, 0x1

    goto :goto_6
.end method

.method public static isInstance(Ljava/lang/Object;Ljava/lang/reflect/Type;)Z
    .locals 2
    .parameter "value"
    .parameter "type"

    .prologue
    const/4 v0, 0x0

    .line 831
    if-nez p1, :cond_1

    .line 835
    .end local p1
    :cond_0
    :goto_0
    return v0

    .restart local p1
    :cond_1
    if-nez p0, :cond_3

    instance-of v1, p1, Ljava/lang/Class;

    if-eqz v1, :cond_2

    check-cast p1, Ljava/lang/Class;

    .end local p1
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    .line 836
    .restart local p1
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v0

    goto :goto_0
.end method

.method private static mapTypeVariablesToArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V
    .locals 8
    .parameter
    .parameter "parameterizedType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/reflect/ParameterizedType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 737
    .local p0, cls:Ljava/lang/Class;,"Ljava/lang/Class<TT;>;"
    .local p2, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 739
    .local v1, ownerType:Ljava/lang/reflect/Type;
    instance-of v7, v1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v7, :cond_0

    .line 741
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .end local v1           #ownerType:Ljava/lang/reflect/Type;
    invoke-static {p0, v1, p2}, Lorg/apache/commons/lang3/reflect/TypeUtils;->mapTypeVariablesToArguments(Ljava/lang/Class;Ljava/lang/reflect/ParameterizedType;Ljava/util/Map;)V

    .line 748
    :cond_0
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 752
    .local v3, typeArgs:[Ljava/lang/reflect/Type;
    invoke-static {p1}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getRawType(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v6

    .line 756
    .local v6, typeVars:[Ljava/lang/reflect/TypeVariable;
    invoke-virtual {p0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v7

    .line 755
    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    .line 758
    .local v5, typeVarList:Ljava/util/List;,"Ljava/util/List<Ljava/lang/reflect/TypeVariable<Ljava/lang/Class<TT;>;>;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v7, v3

    if-lt v0, v7, :cond_1

    .line 771
    return-void

    .line 759
    :cond_1
    aget-object v4, v6, v0

    .line 760
    .local v4, typeVar:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    aget-object v2, v3, v0

    .line 763
    .local v2, typeArg:Ljava/lang/reflect/Type;
    invoke-interface {v5, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 766
    invoke-interface {p2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 768
    check-cast v2, Ljava/lang/reflect/TypeVariable;

    .end local v2           #typeArg:Ljava/lang/reflect/Type;
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/reflect/Type;

    invoke-interface {p2, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 758
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public static normalizeUpperBounds([Ljava/lang/reflect/Type;)[Ljava/lang/reflect/Type;
    .locals 10
    .parameter "bounds"

    .prologue
    const/4 v5, 0x0

    .line 862
    array-length v4, p0

    const/4 v6, 0x2

    if-ge v4, v6, :cond_0

    .line 883
    .end local p0
    :goto_0
    return-object p0

    .line 866
    .restart local p0
    :cond_0
    new-instance v3, Ljava/util/HashSet;

    array-length v4, p0

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 868
    .local v3, types:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/reflect/Type;>;"
    array-length v7, p0

    move v6, v5

    :goto_1
    if-lt v6, v7, :cond_1

    .line 883
    new-array v4, v5, [Ljava/lang/reflect/Type;

    invoke-interface {v3, v4}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/reflect/Type;

    move-object p0, v4

    goto :goto_0

    .line 868
    :cond_1
    aget-object v1, p0, v6

    .line 869
    .local v1, type1:Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .line 871
    .local v0, subtypeFound:Z
    array-length v8, p0

    move v4, v5

    :goto_2
    if-lt v4, v8, :cond_3

    .line 878
    :goto_3
    if-nez v0, :cond_2

    .line 879
    invoke-interface {v3, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 868
    :cond_2
    add-int/lit8 v4, v6, 0x1

    move v6, v4

    goto :goto_1

    .line 871
    :cond_3
    aget-object v2, p0, v4

    .line 872
    .local v2, type2:Ljava/lang/reflect/Type;
    if-eq v1, v2, :cond_4

    const/4 v9, 0x0

    invoke-static {v2, v1, v9}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 873
    const/4 v0, 0x1

    .line 874
    goto :goto_3

    .line 871
    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_2
.end method

.method private static substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;
    .locals 4
    .parameter "type"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 457
    .local p1, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    instance-of v1, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_0

    if-eqz p1, :cond_0

    .line 458
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Type;

    .line 460
    .local v0, replacementType:Ljava/lang/reflect/Type;
    if-nez v0, :cond_1

    .line 461
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "missing assignment type for type variable "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 462
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 461
    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .end local v0           #replacementType:Ljava/lang/reflect/Type;
    :cond_0
    move-object v0, p0

    .line 468
    :cond_1
    return-object v0
.end method

.method public static typesSatisfyVariables(Ljava/util/Map;)Z
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/TypeVariable",
            "<*>;",
            "Ljava/lang/reflect/Type;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, typeVarAssigns:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v4, 0x0

    .line 948
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_2

    .line 960
    const/4 v4, 0x1

    :cond_1
    return v4

    .line 948
    :cond_2
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 949
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/reflect/TypeVariable;

    .line 950
    .local v3, typeVar:Ljava/lang/reflect/TypeVariable;,"Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Type;

    .line 952
    .local v2, type:Ljava/lang/reflect/Type;
    invoke-static {v3}, Lorg/apache/commons/lang3/reflect/TypeUtils;->getImplicitBounds(Ljava/lang/reflect/TypeVariable;)[Ljava/lang/reflect/Type;

    move-result-object v7

    array-length v8, v7

    move v5, v4

    :goto_0
    if-ge v5, v8, :cond_0

    aget-object v0, v7, v5

    .line 953
    .local v0, bound:Ljava/lang/reflect/Type;
    invoke-static {v0, p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->substituteTypeVariables(Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v9

    invoke-static {v2, v9, p0}, Lorg/apache/commons/lang3/reflect/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/util/Map;)Z

    move-result v9

    .line 954
    if-eqz v9, :cond_1

    .line 952
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method
