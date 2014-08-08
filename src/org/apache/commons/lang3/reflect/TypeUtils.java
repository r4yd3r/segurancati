// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.reflect;

import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang3.ClassUtils;

public class TypeUtils
{

    public TypeUtils()
    {
    }

    public static Map determineTypeArguments(Class class1, ParameterizedType parameterizedtype)
    {
        Class class2 = getRawType(parameterizedtype);
        if (!isAssignable(class1, class2))
        {
            return null;
        }
        if (class1.equals(class2))
        {
            return getTypeArguments(parameterizedtype, class2, null);
        }
        Type type = getClosestParentType(class1, class2);
        if (type instanceof Class)
        {
            return determineTypeArguments((Class)type, parameterizedtype);
        } else
        {
            ParameterizedType parameterizedtype1 = (ParameterizedType)type;
            Map map = determineTypeArguments(getRawType(parameterizedtype1), parameterizedtype);
            mapTypeVariablesToArguments(class1, parameterizedtype1, map);
            return map;
        }
    }

    private static Type getClosestParentType(Class class1, Class class2)
    {
        Type atype[];
        Type type;
        int i;
        if (!class2.isInterface())
        {
            break MISSING_BLOCK_LABEL_124;
        }
        atype = class1.getGenericInterfaces();
        type = null;
        i = 0;
_L2:
        Type type1;
        Class class3;
        if (i >= atype.length)
        {
            if (type != null)
            {
                return type;
            }
            break MISSING_BLOCK_LABEL_124;
        }
        type1 = atype[i];
        if (!(type1 instanceof ParameterizedType))
        {
            break; /* Loop/switch isn't completed */
        }
        class3 = getRawType((ParameterizedType)type1);
_L3:
        if (isAssignable(class3, class2) && isAssignable(type, class3))
        {
            type = type1;
        }
        i++;
        if (true) goto _L2; else goto _L1
_L1:
        if (type1 instanceof Class)
        {
            class3 = (Class)type1;
        } else
        {
            throw new IllegalStateException((new StringBuilder("Unexpected generic interface type found: ")).append(type1).toString());
        }
          goto _L3
        if (true) goto _L2; else goto _L4
_L4:
        return class1.getGenericSuperclass();
    }

    public static Type[] getImplicitBounds(TypeVariable typevariable)
    {
        Type atype[] = typevariable.getBounds();
        if (atype.length == 0)
        {
            return (new Type[] {
                java/lang/Object
            });
        } else
        {
            return normalizeUpperBounds(atype);
        }
    }

    public static Type[] getImplicitLowerBounds(WildcardType wildcardtype)
    {
        Type atype[] = wildcardtype.getLowerBounds();
        if (atype.length == 0)
        {
            atype = new Type[1];
        }
        return atype;
    }

    public static Type[] getImplicitUpperBounds(WildcardType wildcardtype)
    {
        Type atype[] = wildcardtype.getUpperBounds();
        if (atype.length == 0)
        {
            return (new Type[] {
                java/lang/Object
            });
        } else
        {
            return normalizeUpperBounds(atype);
        }
    }

    private static Class getRawType(ParameterizedType parameterizedtype)
    {
        Type type = parameterizedtype.getRawType();
        if (!(type instanceof Class))
        {
            throw new IllegalStateException((new StringBuilder("Wait... What!? Type of rawType: ")).append(type).toString());
        } else
        {
            return (Class)type;
        }
    }

    public static Class getRawType(Type type, Type type1)
    {
        if (type instanceof Class)
        {
            return (Class)type;
        }
        if (type instanceof ParameterizedType)
        {
            return getRawType((ParameterizedType)type);
        }
        if (type instanceof TypeVariable)
        {
            if (type1 == null)
            {
                return null;
            }
            java.lang.reflect.GenericDeclaration genericdeclaration = ((TypeVariable)type).getGenericDeclaration();
            if (!(genericdeclaration instanceof Class))
            {
                return null;
            }
            Map map = getTypeArguments(type1, (Class)genericdeclaration);
            if (map == null)
            {
                return null;
            }
            Type type2 = (Type)map.get(type);
            if (type2 == null)
            {
                return null;
            } else
            {
                return getRawType(type2, type1);
            }
        }
        if (type instanceof GenericArrayType)
        {
            return Array.newInstance(getRawType(((GenericArrayType)type).getGenericComponentType(), type1), 0).getClass();
        }
        if (type instanceof WildcardType)
        {
            return null;
        } else
        {
            throw new IllegalArgumentException((new StringBuilder("unknown type: ")).append(type).toString());
        }
    }

    private static Map getTypeArguments(Class class1, Class class2, Map map)
    {
        Object obj;
        if (!isAssignable(class1, class2))
        {
            obj = null;
        } else
        {
            if (class1.isPrimitive())
            {
                if (class2.isPrimitive())
                {
                    return new HashMap();
                }
                class1 = ClassUtils.primitiveToWrapper(class1);
            }
            if (map == null)
            {
                obj = new HashMap();
            } else
            {
                obj = new HashMap(map);
            }
            if (class1.getTypeParameters().length <= 0 && !class2.equals(class1))
            {
                return getTypeArguments(getClosestParentType(class1, class2), class2, ((Map) (obj)));
            }
        }
        return ((Map) (obj));
    }

    public static Map getTypeArguments(ParameterizedType parameterizedtype)
    {
        return getTypeArguments(parameterizedtype, getRawType(parameterizedtype), null);
    }

    private static Map getTypeArguments(ParameterizedType parameterizedtype, Class class1, Map map)
    {
        Class class2 = getRawType(parameterizedtype);
        if (isAssignable(class2, class1)) goto _L2; else goto _L1
_L1:
        Object obj = null;
_L4:
        return ((Map) (obj));
_L2:
        Type type = parameterizedtype.getOwnerType();
        Type atype[];
        TypeVariable atypevariable[];
        int i;
        if (type instanceof ParameterizedType)
        {
            ParameterizedType parameterizedtype1 = (ParameterizedType)type;
            obj = getTypeArguments(parameterizedtype1, getRawType(parameterizedtype1), map);
        } else
        if (map == null)
        {
            obj = new HashMap();
        } else
        {
            obj = new HashMap(map);
        }
        atype = parameterizedtype.getActualTypeArguments();
        atypevariable = class2.getTypeParameters();
        i = 0;
        do
        {
label0:
            {
                if (i < atypevariable.length)
                {
                    break label0;
                }
                if (!class1.equals(class2))
                {
                    return getTypeArguments(getClosestParentType(class2, class1), class1, ((Map) (obj)));
                }
            }
            if (true)
            {
                continue;
            }
            Type type1 = atype[i];
            TypeVariable typevariable = atypevariable[i];
            Type type2;
            if (((Map) (obj)).containsKey(type1))
            {
                type2 = (Type)((Map) (obj)).get(type1);
            } else
            {
                type2 = type1;
            }
            ((Map) (obj)).put(typevariable, type2);
            i++;
        } while (true);
        if (true) goto _L4; else goto _L3
_L3:
    }

    public static Map getTypeArguments(Type type, Class class1)
    {
        return getTypeArguments(type, class1, null);
    }

    private static Map getTypeArguments(Type type, Class class1, Map map)
    {
        int i = 0;
        if (!(type instanceof Class)) goto _L2; else goto _L1
_L1:
        Map map1 = getTypeArguments((Class)type, class1, map);
_L4:
        return map1;
_L2:
        if (type instanceof ParameterizedType)
        {
            return getTypeArguments((ParameterizedType)type, class1, map);
        }
        if (type instanceof GenericArrayType)
        {
            Type type3 = ((GenericArrayType)type).getGenericComponentType();
            if (class1.isArray())
            {
                class1 = class1.getComponentType();
            }
            return getTypeArguments(type3, class1, map);
        }
        if (type instanceof WildcardType)
        {
            Type atype1[] = getImplicitUpperBounds((WildcardType)type);
            int k = atype1.length;
            do
            {
                map1 = null;
                if (i >= k)
                {
                    continue; /* Loop/switch isn't completed */
                }
                Type type2 = atype1[i];
                if (isAssignable(type2, class1))
                {
                    return getTypeArguments(type2, class1, map);
                }
                i++;
            } while (true);
        }
label0:
        {
            if (!(type instanceof TypeVariable))
            {
                break label0;
            }
            Type atype[] = getImplicitBounds((TypeVariable)type);
            int j = atype.length;
            do
            {
                map1 = null;
                if (i >= j)
                {
                    break;
                }
                Type type1 = atype[i];
                if (isAssignable(type1, class1))
                {
                    return getTypeArguments(type1, class1, map);
                }
                i++;
            } while (true);
        }
        if (true) goto _L4; else goto _L3
_L3:
        throw new IllegalStateException((new StringBuilder("found an unhandled type: ")).append(type).toString());
    }

    private static boolean isAssignable(Type type, Class class1)
    {
        if (type != null) goto _L2; else goto _L1
_L1:
        if (class1 == null || !class1.isPrimitive()) goto _L4; else goto _L3
_L3:
        return false;
_L4:
        return true;
_L2:
        if (class1 == null)
        {
            continue; /* Loop/switch isn't completed */
        }
        if (class1.equals(type))
        {
            return true;
        }
        if (type instanceof Class)
        {
            return ClassUtils.isAssignable((Class)type, class1);
        }
        if (type instanceof ParameterizedType)
        {
            return isAssignable(((Type) (getRawType((ParameterizedType)type))), class1);
        }
        if (!(type instanceof TypeVariable))
        {
            break; /* Loop/switch isn't completed */
        }
        Type atype[] = ((TypeVariable)type).getBounds();
        int i = atype.length;
        int j = 0;
        while (j < i) 
        {
            if (isAssignable(atype[j], class1))
            {
                return true;
            }
            j++;
        }
        if (true) goto _L3; else goto _L5
_L5:
        if (!(type instanceof GenericArrayType))
        {
            continue; /* Loop/switch isn't completed */
        }
        if (!class1.equals(java/lang/Object) && (!class1.isArray() || !isAssignable(((GenericArrayType)type).getGenericComponentType(), class1.getComponentType()))) goto _L3; else goto _L6
_L6:
        return true;
        if (type instanceof WildcardType) goto _L3; else goto _L7
_L7:
        throw new IllegalStateException((new StringBuilder("found an unhandled type: ")).append(type).toString());
    }

    private static boolean isAssignable(Type type, GenericArrayType genericarraytype, Map map)
    {
        if (type != null) goto _L2; else goto _L1
_L1:
        return true;
_L2:
        Type type1;
        if (genericarraytype == null)
        {
            return false;
        }
        if (genericarraytype.equals(type))
        {
            continue; /* Loop/switch isn't completed */
        }
        type1 = genericarraytype.getGenericComponentType();
        if (!(type instanceof Class))
        {
            break; /* Loop/switch isn't completed */
        }
        Class class1 = (Class)type;
        if (!class1.isArray() || !isAssignable(((Type) (class1.getComponentType())), type1, map))
        {
            return false;
        }
        if (true) goto _L1; else goto _L3
_L3:
        if (type instanceof GenericArrayType)
        {
            return isAssignable(((GenericArrayType)type).getGenericComponentType(), type1, map);
        }
        if (type instanceof WildcardType)
        {
            Type atype1[] = getImplicitUpperBounds((WildcardType)type);
            int k = atype1.length;
            int l = 0;
            do
            {
                if (l >= k)
                {
                    return false;
                }
                if (isAssignable(atype1[l], ((Type) (genericarraytype))))
                {
                    continue; /* Loop/switch isn't completed */
                }
                l++;
            } while (true);
        }
label0:
        {
            if (!(type instanceof TypeVariable))
            {
                break label0;
            }
            Type atype[] = getImplicitBounds((TypeVariable)type);
            int i = atype.length;
            int j = 0;
            do
            {
                if (j >= i)
                {
                    return false;
                }
                if (isAssignable(atype[j], ((Type) (genericarraytype))))
                {
                    break;
                }
                j++;
            } while (true);
        }
        if (true) goto _L1; else goto _L4
_L4:
        if (type instanceof ParameterizedType)
        {
            return false;
        } else
        {
            throw new IllegalStateException((new StringBuilder("found an unhandled type: ")).append(type).toString());
        }
    }

    private static boolean isAssignable(Type type, ParameterizedType parameterizedtype, Map map)
    {
        if (type != null) goto _L2; else goto _L1
_L1:
        return true;
_L2:
        if (parameterizedtype == null)
        {
            return false;
        }
        if (parameterizedtype.equals(type))
        {
            continue; /* Loop/switch isn't completed */
        }
        Class class1 = getRawType(parameterizedtype);
        Map map1 = getTypeArguments(type, class1, null);
        if (map1 == null)
        {
            return false;
        }
        if (map1.isEmpty())
        {
            continue; /* Loop/switch isn't completed */
        }
        Iterator iterator = getTypeArguments(parameterizedtype, class1, map).entrySet().iterator();
        Type type1;
        Type type2;
        do
        {
            if (!iterator.hasNext())
            {
                continue; /* Loop/switch isn't completed */
            }
            java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
            type1 = (Type)entry.getValue();
            type2 = (Type)map1.get(entry.getKey());
        } while (type2 == null || type1.equals(type2) || (type1 instanceof WildcardType) && isAssignable(type2, type1, map));
        break; /* Loop/switch isn't completed */
        if (true) goto _L1; else goto _L3
_L3:
        return false;
    }

    public static boolean isAssignable(Type type, Type type1)
    {
        return isAssignable(type, type1, null);
    }

    private static boolean isAssignable(Type type, Type type1, Map map)
    {
        if (type1 == null || (type1 instanceof Class))
        {
            return isAssignable(type, (Class)type1);
        }
        if (type1 instanceof ParameterizedType)
        {
            return isAssignable(type, (ParameterizedType)type1, map);
        }
        if (type1 instanceof GenericArrayType)
        {
            return isAssignable(type, (GenericArrayType)type1, map);
        }
        if (type1 instanceof WildcardType)
        {
            return isAssignable(type, (WildcardType)type1, map);
        }
        if (type1 instanceof TypeVariable)
        {
            return isAssignable(type, (TypeVariable)type1, map);
        } else
        {
            throw new IllegalStateException((new StringBuilder("found an unhandled type: ")).append(type1).toString());
        }
    }

    private static boolean isAssignable(Type type, TypeVariable typevariable, Map map)
    {
        if (type == null)
        {
            return true;
        }
        if (typevariable == null)
        {
            return false;
        }
        if (typevariable.equals(type))
        {
            return true;
        }
        if (!(type instanceof TypeVariable)) goto _L2; else goto _L1
_L1:
        Type atype[];
        int i;
        int j;
        atype = getImplicitBounds((TypeVariable)type);
        i = atype.length;
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        if ((type instanceof Class) || (type instanceof ParameterizedType) || (type instanceof GenericArrayType) || (type instanceof WildcardType))
        {
            return false;
        } else
        {
            throw new IllegalStateException((new StringBuilder("found an unhandled type: ")).append(type).toString());
        }
_L3:
        if (isAssignable(atype[j], typevariable, map))
        {
            return true;
        }
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    private static boolean isAssignable(Type type, WildcardType wildcardtype, Map map)
    {
        Type atype[];
        Type atype1[];
        Type atype2[];
        Type atype3[];
        int i1;
        int j1;
        if (type == null)
        {
            return true;
        }
        if (wildcardtype == null)
        {
            return false;
        }
        if (wildcardtype.equals(type))
        {
            return true;
        }
        atype = getImplicitUpperBounds(wildcardtype);
        atype1 = getImplicitLowerBounds(wildcardtype);
        if (!(type instanceof WildcardType))
        {
            break MISSING_BLOCK_LABEL_198;
        }
        WildcardType wildcardtype1 = (WildcardType)type;
        atype2 = getImplicitUpperBounds(wildcardtype1);
        atype3 = getImplicitLowerBounds(wildcardtype1);
        i1 = atype.length;
        j1 = 0;
_L1:
        int j2;
        int i2;
        if (j1 >= i1)
        {
            i2 = atype1.length;
            j2 = 0;
            break MISSING_BLOCK_LABEL_82;
        }
        type1 = substituteTypeVariables(atype[j1], map);
        k1 = atype2.length;
        l1 = 0;
_L2:
label0:
        {
            if (l1 < k1)
            {
                break label0;
            }
            j1++;
        }
          goto _L1
        if (!isAssignable(atype2[l1], type1, map))
        {
            return false;
        }
        l1++;
          goto _L2
_L4:
        Type type2;
        int k2;
        int l2;
        Type type1;
        int k1;
        int l1;
        if (j2 >= i2)
        {
            return true;
        }
        type2 = substituteTypeVariables(atype1[j2], map);
        k2 = atype3.length;
        l2 = 0;
_L5:
label1:
        {
            if (l2 < k2)
            {
                break label1;
            }
            j2++;
        }
        if (true) goto _L4; else goto _L3
_L3:
        if (!isAssignable(type2, atype3[l2], map))
        {
            return false;
        }
        l2++;
          goto _L5
          goto _L4
        int i;
        int j;
        i = atype.length;
        j = 0;
_L8:
        if (j < i) goto _L7; else goto _L6
_L6:
        int k;
        int l;
        k = atype1.length;
        l = 0;
_L9:
        if (l >= k)
        {
            return true;
        }
        break MISSING_BLOCK_LABEL_253;
_L7:
        if (!isAssignable(type, substituteTypeVariables(atype[j], map), map))
        {
            return false;
        }
        j++;
          goto _L8
        if (!isAssignable(substituteTypeVariables(atype1[l], map), type, map))
        {
            return false;
        }
        l++;
          goto _L9
    }

    public static boolean isInstance(Object obj, Type type)
    {
        if (type != null)
        {
            if (obj == null)
            {
                if (!(type instanceof Class) || !((Class)type).isPrimitive())
                {
                    return true;
                }
            } else
            {
                return isAssignable(obj.getClass(), type, null);
            }
        }
        return false;
    }

    private static void mapTypeVariablesToArguments(Class class1, ParameterizedType parameterizedtype, Map map)
    {
        Type type = parameterizedtype.getOwnerType();
        if (type instanceof ParameterizedType)
        {
            mapTypeVariablesToArguments(class1, (ParameterizedType)type, map);
        }
        Type atype[] = parameterizedtype.getActualTypeArguments();
        TypeVariable atypevariable[] = getRawType(parameterizedtype).getTypeParameters();
        List list = Arrays.asList(class1.getTypeParameters());
        int i = 0;
        do
        {
            if (i >= atype.length)
            {
                return;
            }
            TypeVariable typevariable = atypevariable[i];
            Type type1 = atype[i];
            if (list.contains(type1) && map.containsKey(typevariable))
            {
                map.put((TypeVariable)type1, (Type)map.get(typevariable));
            }
            i++;
        } while (true);
    }

    public static Type[] normalizeUpperBounds(Type atype[])
    {
        HashSet hashset;
        int i;
        int j;
        if (atype.length < 2)
        {
            return atype;
        }
        hashset = new HashSet(atype.length);
        i = atype.length;
        j = 0;
_L2:
        if (j >= i)
        {
            return (Type[])hashset.toArray(new Type[0]);
        }
        Type type = atype[j];
        int k = atype.length;
        int l = 0;
        do
        {
            boolean flag = false;
            if (l < k)
            {
label0:
                {
                    Type type1 = atype[l];
                    if (type == type1 || !isAssignable(type1, type, null))
                    {
                        break label0;
                    }
                    flag = true;
                }
            }
            if (!flag)
            {
                hashset.add(type);
            }
            j++;
            if (true)
            {
                continue;
            }
            l++;
        } while (true);
        if (true) goto _L2; else goto _L1
_L1:
    }

    private static Type substituteTypeVariables(Type type, Map map)
    {
        Type type1;
        if ((type instanceof TypeVariable) && map != null)
        {
            type1 = (Type)map.get(type);
            if (type1 == null)
            {
                throw new IllegalArgumentException((new StringBuilder("missing assignment type for type variable ")).append(type).toString());
            }
        } else
        {
            type1 = type;
        }
        return type1;
    }

    public static boolean typesSatisfyVariables(Map map)
    {
        Iterator iterator = map.entrySet().iterator();
_L4:
        if (iterator.hasNext()) goto _L2; else goto _L1
_L1:
        boolean flag1 = true;
_L6:
        return flag1;
_L2:
        Type type;
        Type atype[];
        int i;
        int j;
        java.util.Map.Entry entry = (java.util.Map.Entry)iterator.next();
        TypeVariable typevariable = (TypeVariable)entry.getKey();
        type = (Type)entry.getValue();
        atype = getImplicitBounds(typevariable);
        i = atype.length;
        j = 0;
_L7:
        if (j >= i) goto _L4; else goto _L3
_L3:
        boolean flag;
        flag = isAssignable(type, substituteTypeVariables(atype[j], map), map);
        flag1 = false;
        if (!flag) goto _L6; else goto _L5
_L5:
        j++;
          goto _L7
    }
}
