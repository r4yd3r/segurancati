// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import org.apache.commons.lang3.exception.CloneFailedException;

public class ObjectUtils
{
    public static class Null
        implements Serializable
    {

        private static final long serialVersionUID = 0x626e04ed40667ec5L;

        private Object readResolve()
        {
            return ObjectUtils.NULL;
        }

        Null()
        {
        }
    }


    public static final Null NULL = new Null();

    public ObjectUtils()
    {
    }

    public static Object clone(Object obj)
    {
        if (!(obj instanceof Cloneable)) goto _L2; else goto _L1
_L1:
        if (!obj.getClass().isArray()) goto _L4; else goto _L3
_L3:
        Class class1 = obj.getClass().getComponentType();
        if (class1.isPrimitive()) goto _L6; else goto _L5
_L5:
        Object obj2 = ((Object []) ((Object[])obj)).clone();
_L7:
        return obj2;
_L6:
        int i = Array.getLength(obj);
        obj2 = Array.newInstance(class1, i);
        int j = i;
        do
        {
            int k = j - 1;
            if (j <= 0)
            {
                continue; /* Loop/switch isn't completed */
            }
            Array.set(obj2, k, Array.get(obj, k));
            j = k;
        } while (true);
_L4:
        Object obj1;
        try
        {
            obj1 = obj.getClass().getMethod("clone", new Class[0]).invoke(obj, new Object[0]);
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            throw new CloneFailedException((new StringBuilder("Cloneable type ")).append(obj.getClass().getName()).append(" has no clone method").toString(), nosuchmethodexception);
        }
        catch (IllegalAccessException illegalaccessexception)
        {
            throw new CloneFailedException((new StringBuilder("Cannot clone Cloneable type ")).append(obj.getClass().getName()).toString(), illegalaccessexception);
        }
        catch (InvocationTargetException invocationtargetexception)
        {
            throw new CloneFailedException((new StringBuilder("Exception cloning Cloneable type ")).append(obj.getClass().getName()).toString(), invocationtargetexception.getCause());
        }
        obj2 = obj1;
        if (true) goto _L7; else goto _L2
_L2:
        return null;
    }

    public static Object cloneIfPossible(Object obj)
    {
        Object obj1 = clone(obj);
        if (obj1 == null)
        {
            return obj;
        } else
        {
            return obj1;
        }
    }

    public static Object defaultIfNull(Object obj, Object obj1)
    {
        if (obj != null)
        {
            return obj;
        } else
        {
            return obj1;
        }
    }

    public static boolean equals(Object obj, Object obj1)
    {
        if (obj == obj1)
        {
            return true;
        }
        if (obj == null || obj1 == null)
        {
            return false;
        } else
        {
            return obj.equals(obj1);
        }
    }

    public static transient Object firstNonNull(Object aobj[])
    {
        if (aobj == null) goto _L2; else goto _L1
_L1:
        int i;
        int j;
        i = aobj.length;
        j = 0;
_L7:
        if (j < i) goto _L3; else goto _L2
_L2:
        Object obj = null;
_L5:
        return obj;
_L3:
        obj = aobj[j];
        if (obj != null) goto _L5; else goto _L4
_L4:
        j++;
        if (true) goto _L7; else goto _L6
_L6:
    }

    public static int hashCode(Object obj)
    {
        if (obj == null)
        {
            return 0;
        } else
        {
            return obj.hashCode();
        }
    }

    public static String identityToString(Object obj)
    {
        if (obj == null)
        {
            return null;
        } else
        {
            StringBuffer stringbuffer = new StringBuffer();
            identityToString(stringbuffer, obj);
            return stringbuffer.toString();
        }
    }

    public static void identityToString(StringBuffer stringbuffer, Object obj)
    {
        if (obj == null)
        {
            throw new NullPointerException("Cannot get the toString of a null identity");
        } else
        {
            stringbuffer.append(obj.getClass().getName()).append('@').append(Integer.toHexString(System.identityHashCode(obj)));
            return;
        }
    }

    public static Comparable max(Comparable comparable, Comparable comparable1)
    {
        if (comparable == null || comparable1 == null) goto _L2; else goto _L1
_L1:
        if (comparable.compareTo(comparable1) < 0) goto _L4; else goto _L3
_L3:
        return comparable;
_L4:
        return comparable1;
_L2:
        if (comparable == null)
        {
            return comparable1;
        }
        if (true) goto _L3; else goto _L5
_L5:
    }

    public static Comparable min(Comparable comparable, Comparable comparable1)
    {
        if (comparable == null || comparable1 == null) goto _L2; else goto _L1
_L1:
        if (comparable.compareTo(comparable1) >= 1) goto _L4; else goto _L3
_L3:
        return comparable;
_L4:
        return comparable1;
_L2:
        if (comparable == null)
        {
            return comparable1;
        }
        if (true) goto _L3; else goto _L5
_L5:
    }

    public static String toString(Object obj)
    {
        if (obj == null)
        {
            return "";
        } else
        {
            return obj.toString();
        }
    }

    public static String toString(Object obj, String s)
    {
        if (obj == null)
        {
            return s;
        } else
        {
            return obj.toString();
        }
    }

}
