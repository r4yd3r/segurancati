// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.reflect;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.ClassUtils;

// Referenced classes of package org.apache.commons.lang3.reflect:
//            MemberUtils

public class MethodUtils
{

    public MethodUtils()
    {
    }

    public static transient Method getAccessibleMethod(Class class1, String s, Class aclass[])
    {
        Method method;
        try
        {
            method = getAccessibleMethod(class1.getMethod(s, aclass));
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            return null;
        }
        return method;
    }

    public static Method getAccessibleMethod(Method method)
    {
        if (!MemberUtils.isAccessible(method))
        {
            method = null;
        } else
        {
            Class class1 = method.getDeclaringClass();
            if (!Modifier.isPublic(class1.getModifiers()))
            {
                String s = method.getName();
                Class aclass[] = method.getParameterTypes();
                method = getAccessibleMethodFromInterfaceNest(class1, s, aclass);
                if (method == null)
                {
                    return getAccessibleMethodFromSuperclass(class1, s, aclass);
                }
            }
        }
        return method;
    }

    private static transient Method getAccessibleMethodFromInterfaceNest(Class class1, String s, Class aclass[])
    {
        Method method = null;
_L3:
        Class aclass1[];
        int i;
        if (class1 == null)
        {
            return method;
        }
        aclass1 = class1.getInterfaces();
        i = 0;
_L6:
        if (i < aclass1.length) goto _L2; else goto _L1
_L1:
        class1 = class1.getSuperclass();
          goto _L3
_L2:
        if (Modifier.isPublic(aclass1[i].getModifiers())) goto _L5; else goto _L4
_L4:
        i++;
          goto _L6
_L5:
        Method method1 = aclass1[i].getDeclaredMethod(s, aclass);
        method = method1;
_L7:
        if (method != null)
        {
            break; /* Loop/switch isn't completed */
        }
        method = getAccessibleMethodFromInterfaceNest(aclass1[i], s, aclass);
        if (method == null) goto _L4; else goto _L1
        NoSuchMethodException nosuchmethodexception;
        nosuchmethodexception;
          goto _L7
    }

    private static transient Method getAccessibleMethodFromSuperclass(Class class1, String s, Class aclass[])
    {
        Class class2 = class1.getSuperclass();
        do
        {
            if (class2 == null)
            {
                return null;
            }
            if (Modifier.isPublic(class2.getModifiers()))
            {
                Method method;
                try
                {
                    method = class2.getMethod(s, aclass);
                }
                catch (NoSuchMethodException nosuchmethodexception)
                {
                    return null;
                }
                return method;
            }
            class2 = class2.getSuperclass();
        } while (true);
    }

    public static transient Method getMatchingAccessibleMethod(Class class1, String s, Class aclass[])
    {
        Method method1;
        try
        {
            method1 = class1.getMethod(s, aclass);
            MemberUtils.setAccessibleWorkaround(method1);
        }
        catch (NoSuchMethodException nosuchmethodexception)
        {
            Object obj = null;
            Method amethod[] = class1.getMethods();
            int i = 0;
            int j = amethod.length;
            do
            {
                if (i >= j)
                {
                    if (obj != null)
                    {
                        MemberUtils.setAccessibleWorkaround(((java.lang.reflect.AccessibleObject) (obj)));
                    }
                    return ((Method) (obj));
                }
                if (amethod[i].getName().equals(s) && ClassUtils.isAssignable(aclass, amethod[i].getParameterTypes(), true))
                {
                    Method method = getAccessibleMethod(amethod[i]);
                    if (method != null && (obj == null || MemberUtils.compareParameterTypes(method.getParameterTypes(), ((Method) (obj)).getParameterTypes(), aclass) < 0))
                    {
                        obj = method;
                    }
                }
                i++;
            } while (true);
        }
        return method1;
    }

    public static transient Object invokeExactMethod(Object obj, String s, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
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
                return invokeExactMethod(obj, s, aobj, aclass);
            }
            aclass[j] = aobj[j].getClass();
            j++;
        } while (true);
    }

    public static Object invokeExactMethod(Object obj, String s, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
    {
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        Method method = getAccessibleMethod(obj.getClass(), s, aclass);
        if (method == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible method: ")).append(s).append("() on object: ").append(obj.getClass().getName()).toString());
        } else
        {
            return method.invoke(obj, aobj);
        }
    }

    public static transient Object invokeExactStaticMethod(Class class1, String s, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
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
                return invokeExactStaticMethod(class1, s, aobj, aclass);
            }
            aclass[j] = aobj[j].getClass();
            j++;
        } while (true);
    }

    public static Object invokeExactStaticMethod(Class class1, String s, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
    {
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        Method method = getAccessibleMethod(class1, s, aclass);
        if (method == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible method: ")).append(s).append("() on class: ").append(class1.getName()).toString());
        } else
        {
            return method.invoke(null, aobj);
        }
    }

    public static transient Object invokeMethod(Object obj, String s, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
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
                return invokeMethod(obj, s, aobj, aclass);
            }
            aclass[j] = aobj[j].getClass();
            j++;
        } while (true);
    }

    public static Object invokeMethod(Object obj, String s, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
    {
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        Method method = getMatchingAccessibleMethod(obj.getClass(), s, aclass);
        if (method == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible method: ")).append(s).append("() on object: ").append(obj.getClass().getName()).toString());
        } else
        {
            return method.invoke(obj, aobj);
        }
    }

    public static transient Object invokeStaticMethod(Class class1, String s, Object aobj[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
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
                return invokeStaticMethod(class1, s, aobj, aclass);
            }
            aclass[j] = aobj[j].getClass();
            j++;
        } while (true);
    }

    public static Object invokeStaticMethod(Class class1, String s, Object aobj[], Class aclass[])
        throws NoSuchMethodException, IllegalAccessException, InvocationTargetException
    {
        if (aclass == null)
        {
            aclass = ArrayUtils.EMPTY_CLASS_ARRAY;
        }
        if (aobj == null)
        {
            aobj = ArrayUtils.EMPTY_OBJECT_ARRAY;
        }
        Method method = getMatchingAccessibleMethod(class1, s, aclass);
        if (method == null)
        {
            throw new NoSuchMethodException((new StringBuilder("No such accessible method: ")).append(s).append("() on class: ").append(class1.getName()).toString());
        } else
        {
            return method.invoke(null, aobj);
        }
    }
}
