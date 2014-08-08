// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.reflect;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Iterator;
import java.util.List;
import org.apache.commons.lang3.ClassUtils;

// Referenced classes of package org.apache.commons.lang3.reflect:
//            MemberUtils

public class FieldUtils
{

    public FieldUtils()
    {
    }

    public static Field getDeclaredField(Class class1, String s)
    {
        return getDeclaredField(class1, s, false);
    }

    public static Field getDeclaredField(Class class1, String s, boolean flag)
    {
        if (class1 == null)
        {
            throw new IllegalArgumentException("The class must not be null");
        }
        if (s == null)
        {
            throw new IllegalArgumentException("The field name must not be null");
        }
        Field field = class1.getDeclaredField(s);
        if (!MemberUtils.isAccessible(field))
        {
            if (!flag)
            {
                break MISSING_BLOCK_LABEL_56;
            }
            try
            {
                field.setAccessible(true);
            }
            catch (NoSuchFieldException nosuchfieldexception)
            {
                return null;
            }
        }
        return field;
        return null;
    }

    public static Field getField(Class class1, String s)
    {
        Field field = getField(class1, s, false);
        MemberUtils.setAccessibleWorkaround(field);
        return field;
    }

    public static Field getField(Class class1, String s, boolean flag)
    {
        Class class2;
        if (class1 == null)
        {
            throw new IllegalArgumentException("The class must not be null");
        }
        if (s == null)
        {
            throw new IllegalArgumentException("The field name must not be null");
        }
        class2 = class1;
_L7:
        if (class2 != null) goto _L2; else goto _L1
_L1:
        Field field1;
        Iterator iterator;
        field1 = null;
        iterator = ClassUtils.getAllInterfaces(class1).iterator();
_L8:
        if (iterator.hasNext()) goto _L4; else goto _L3
_L3:
        Field field = field1;
_L6:
        return field;
_L2:
        field = class2.getDeclaredField(s);
        if (Modifier.isPublic(field.getModifiers())) goto _L6; else goto _L5
_L5:
        if (!flag)
        {
            break MISSING_BLOCK_LABEL_98;
        }
        field.setAccessible(true);
        return field;
        NoSuchFieldException nosuchfieldexception;
        nosuchfieldexception;
        class2 = class2.getSuperclass();
          goto _L7
_L4:
        Field field2 = ((Class)iterator.next()).getField(s);
        if (field1 != null)
        {
            try
            {
                throw new IllegalArgumentException((new StringBuilder("Reference to field ")).append(s).append(" is ambiguous relative to ").append(class1).append("; a matching field exists on two or more implemented interfaces.").toString());
            }
            catch (NoSuchFieldException nosuchfieldexception1) { }
        } else
        {
            field1 = field2;
        }
          goto _L8
    }

    public static Object readDeclaredField(Object obj, String s)
        throws IllegalAccessException
    {
        return readDeclaredField(obj, s, false);
    }

    public static Object readDeclaredField(Object obj, String s, boolean flag)
        throws IllegalAccessException
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class class1 = obj.getClass();
        Field field = getDeclaredField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate declared field ")).append(class1.getName()).append(".").append(s).toString());
        } else
        {
            return readField(field, obj);
        }
    }

    public static Object readDeclaredStaticField(Class class1, String s)
        throws IllegalAccessException
    {
        return readDeclaredStaticField(class1, s, false);
    }

    public static Object readDeclaredStaticField(Class class1, String s, boolean flag)
        throws IllegalAccessException
    {
        Field field = getDeclaredField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate declared field ")).append(class1.getName()).append(".").append(s).toString());
        } else
        {
            return readStaticField(field, false);
        }
    }

    public static Object readField(Object obj, String s)
        throws IllegalAccessException
    {
        return readField(obj, s, false);
    }

    public static Object readField(Object obj, String s, boolean flag)
        throws IllegalAccessException
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class class1 = obj.getClass();
        Field field = getField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate field ")).append(s).append(" on ").append(class1).toString());
        } else
        {
            return readField(field, obj);
        }
    }

    public static Object readField(Field field, Object obj)
        throws IllegalAccessException
    {
        return readField(field, obj, false);
    }

    public static Object readField(Field field, Object obj, boolean flag)
        throws IllegalAccessException
    {
        if (field == null)
        {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (flag && !field.isAccessible())
        {
            field.setAccessible(true);
        } else
        {
            MemberUtils.setAccessibleWorkaround(field);
        }
        return field.get(obj);
    }

    public static Object readStaticField(Class class1, String s)
        throws IllegalAccessException
    {
        return readStaticField(class1, s, false);
    }

    public static Object readStaticField(Class class1, String s, boolean flag)
        throws IllegalAccessException
    {
        Field field = getField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate field ")).append(s).append(" on ").append(class1).toString());
        } else
        {
            return readStaticField(field, false);
        }
    }

    public static Object readStaticField(Field field)
        throws IllegalAccessException
    {
        return readStaticField(field, false);
    }

    public static Object readStaticField(Field field, boolean flag)
        throws IllegalAccessException
    {
        if (field == null)
        {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (!Modifier.isStatic(field.getModifiers()))
        {
            throw new IllegalArgumentException((new StringBuilder("The field '")).append(field.getName()).append("' is not static").toString());
        } else
        {
            return readField(field, null, flag);
        }
    }

    public static void writeDeclaredField(Object obj, String s, Object obj1)
        throws IllegalAccessException
    {
        writeDeclaredField(obj, s, obj1, false);
    }

    public static void writeDeclaredField(Object obj, String s, Object obj1, boolean flag)
        throws IllegalAccessException
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class class1 = obj.getClass();
        Field field = getDeclaredField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate declared field ")).append(class1.getName()).append(".").append(s).toString());
        } else
        {
            writeField(field, obj, obj1);
            return;
        }
    }

    public static void writeDeclaredStaticField(Class class1, String s, Object obj)
        throws IllegalAccessException
    {
        writeDeclaredStaticField(class1, s, obj, false);
    }

    public static void writeDeclaredStaticField(Class class1, String s, Object obj, boolean flag)
        throws IllegalAccessException
    {
        Field field = getDeclaredField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate declared field ")).append(class1.getName()).append(".").append(s).toString());
        } else
        {
            writeField(field, null, obj);
            return;
        }
    }

    public static void writeField(Object obj, String s, Object obj1)
        throws IllegalAccessException
    {
        writeField(obj, s, obj1, false);
    }

    public static void writeField(Object obj, String s, Object obj1, boolean flag)
        throws IllegalAccessException
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("target object must not be null");
        }
        Class class1 = obj.getClass();
        Field field = getField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate declared field ")).append(class1.getName()).append(".").append(s).toString());
        } else
        {
            writeField(field, obj, obj1);
            return;
        }
    }

    public static void writeField(Field field, Object obj, Object obj1)
        throws IllegalAccessException
    {
        writeField(field, obj, obj1, false);
    }

    public static void writeField(Field field, Object obj, Object obj1, boolean flag)
        throws IllegalAccessException
    {
        if (field == null)
        {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (flag && !field.isAccessible())
        {
            field.setAccessible(true);
        } else
        {
            MemberUtils.setAccessibleWorkaround(field);
        }
        field.set(obj, obj1);
    }

    public static void writeStaticField(Class class1, String s, Object obj)
        throws IllegalAccessException
    {
        writeStaticField(class1, s, obj, false);
    }

    public static void writeStaticField(Class class1, String s, Object obj, boolean flag)
        throws IllegalAccessException
    {
        Field field = getField(class1, s, flag);
        if (field == null)
        {
            throw new IllegalArgumentException((new StringBuilder("Cannot locate field ")).append(s).append(" on ").append(class1).toString());
        } else
        {
            writeStaticField(field, obj);
            return;
        }
    }

    public static void writeStaticField(Field field, Object obj)
        throws IllegalAccessException
    {
        writeStaticField(field, obj, false);
    }

    public static void writeStaticField(Field field, Object obj, boolean flag)
        throws IllegalAccessException
    {
        if (field == null)
        {
            throw new IllegalArgumentException("The field must not be null");
        }
        if (!Modifier.isStatic(field.getModifiers()))
        {
            throw new IllegalArgumentException((new StringBuilder("The field '")).append(field.getName()).append("' is not static").toString());
        } else
        {
            writeField(field, null, obj, flag);
            return;
        }
    }
}
