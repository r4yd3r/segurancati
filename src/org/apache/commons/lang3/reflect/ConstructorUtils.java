// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ClassUtils;

// Referenced classes of package org.apache.commons.lang3.reflect:
//            MemberUtils

public class ConstructorUtils
{

    public ConstructorUtils()
    {
    }

    public static transient Constructor getAccessibleConstructor(Class class1, Class aclass[])
    {
        Constructor constructor;
        try
        {
            constructor = getAccessibleConstructor(class1.getConstructor(aclass));
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            return null;
        }
        return constructor;
    }

    public static Constructor getAccessibleConstructor(Constructor constructor)
    {
        if (MemberUtils.isAccessible(constructor) && Modifier.isPublic(constructor.getDeclaringClass().getModifiers()))
        {
            return constructor;
        } else
        {
            return null;
        }
    }

    public static transient Constructor getMatchingAccessibleConstructor(Class class1, Class aclass[])
    {
        Constructor constructor2;
        try
        {
            constructor2 = class1.getConstructor(aclass);
            MemberUtils.setAccessibleWorkaround(constructor2);
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            Constructor constructor = null;
            Constructor aconstructor[] = class1.getConstructors();
            int i = 0;
            do
            {
                if (i >= aconstructor.length)
                {
                    return constructor;
                }
                if (ClassUtils.isAssignable(aclass, aconstructor[i].getParameterTypes(), true))
                {
                    Constructor constructor1 = getAccessibleConstructor(aconstructor[i]);
                    if (constructor1 != null)
                    {
                        MemberUtils.setAccessibleWorkaround(constructor1);
                        if (constructor == null || MemberUtils.compareParameterTypes(constructor1.getParameterTypes(), constructor.getParameterTypes(), aclass) < 0)
                        {
                            constructor = constructor1;
                        }
                    }
                }
                i++;
            } while (true);
        }
        return constructor2;
    }

    public static transient Object invokeConstructor(Class class1, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException
    {
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        Class aclass[] = new Class[aobj.length];
        int i = 0;
        do
        {
            if (i >= aobj.length)
            {
                return invokeConstructor(class1, aobj, aclass);
            }
            aclass[i] = aobj[i].getClass();
            i++;
        } while (true);
    }

    public static Object invokeConstructor(Class class1, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException
    {
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        Constructor constructor = getMatchingAccessibleConstructor(class1, aclass);
        if (constructor == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible constructor on object: ")).append(class1.getName()).toString());
        } else
        {
            return constructor.newInstance(aobj);
        }
    }

    public static transient Object invokeExactConstructor(Class class1, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException
    {
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        int i = aobj.length;
        Class aclass[] = new Class[i];
        int j = 0;
        do
        {
            if (j >= i)
            {
                return invokeExactConstructor(class1, aobj, aclass);
            }
            aclass[j] = aobj[j].getClass();
            j++;
        } while (true);
    }

    public static Object invokeExactConstructor(Class class1, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException
    {
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        Constructor constructor = getAccessibleConstructor(class1, aclass);
        if (constructor == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible constructor on object: ")).append(class1.getName()).toString());
        } else
        {
            return constructor.newInstance(aobj);
        }
    }
}
