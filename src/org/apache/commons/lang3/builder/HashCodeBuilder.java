// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.builder;

import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import org.apache.commons.lang3.ArrayUtils;

// Referenced classes of package org.apache.commons.lang3.builder:
//            Builder, IDKey, ReflectionToStringBuilder

public class HashCodeBuilder
    implements Builder
{

    private static final ThreadLocal REGISTRY = new ThreadLocal();
    private final int iConstant;
    private int iTotal;

    public HashCodeBuilder()
    {
        iTotal = 0;
        iConstant = 37;
        iTotal = 17;
    }

    public HashCodeBuilder(int i, int j)
    {
        iTotal = 0;
        if (i == 0)
        {
            throw new IllegalArgumentException("HashCodeBuilder requires a non zero initial value");
        }
        if (i % 2 == 0)
        {
            throw new IllegalArgumentException("HashCodeBuilder requires an odd initial value");
        }
        if (j == 0)
        {
            throw new IllegalArgumentException("HashCodeBuilder requires a non zero multiplier");
        }
        if (j % 2 == 0)
        {
            throw new IllegalArgumentException("HashCodeBuilder requires an odd multiplier");
        } else
        {
            iConstant = j;
            iTotal = i;
            return;
        }
    }

    static Set getRegistry()
    {
        return (Set)REGISTRY.get();
    }

    static boolean isRegistered(Object obj)
    {
        Set set = getRegistry();
        return set != null && set.contains(new IDKey(obj));
    }

    private static void reflectionAppend(Object obj, Class class1, HashCodeBuilder hashcodebuilder, boolean flag, String as[])
    {
        if (isRegistered(obj))
        {
            return;
        }
        Field afield[];
        int i;
        register(obj);
        afield = class1.getDeclaredFields();
        AccessibleObject.setAccessible(afield, true);
        i = afield.length;
        int j = 0;
_L2:
        if (j >= i)
        {
            unregister(obj);
            return;
        }
        Field field;
        field = afield[j];
        if (ArrayUtils.contains(as, field.getName()) || field.getName().indexOf('$') != -1)
        {
            break MISSING_BLOCK_LABEL_119;
        }
        if (flag)
        {
            break MISSING_BLOCK_LABEL_93;
        }
        if (Modifier.isTransient(field.getModifiers()))
        {
            break MISSING_BLOCK_LABEL_119;
        }
        boolean flag1 = Modifier.isStatic(field.getModifiers());
        if (flag1)
        {
            break MISSING_BLOCK_LABEL_119;
        }
        hashcodebuilder.append(field.get(obj));
        j++;
        if (true) goto _L2; else goto _L1
_L1:
        IllegalAccessException illegalaccessexception;
        illegalaccessexception;
        throw new InternalError("Unexpected IllegalAccessException");
        Exception exception;
        exception;
        unregister(obj);
        throw exception;
    }

    public static int reflectionHashCode(int i, int j, Object obj)
    {
        return reflectionHashCode(i, j, obj, false, null, null);
    }

    public static int reflectionHashCode(int i, int j, Object obj, boolean flag)
    {
        return reflectionHashCode(i, j, obj, flag, null, null);
    }

    public static int reflectionHashCode(int i, int j, Object obj, boolean flag, Class class1)
    {
        return reflectionHashCode(i, j, obj, flag, class1, null);
    }

    public static int reflectionHashCode(int i, int j, Object obj, boolean flag, Class class1, String as[])
    {
        if (obj == null)
        {
            throw new IllegalArgumentException("The object to build a hash code for must not be null");
        }
        HashCodeBuilder hashcodebuilder = new HashCodeBuilder(i, j);
        Class class2 = obj.getClass();
        reflectionAppend(obj, class2, hashcodebuilder, flag, as);
        do
        {
            if (class2.getSuperclass() == null || class2 == class1)
            {
                return hashcodebuilder.toHashCode();
            }
            class2 = class2.getSuperclass();
            reflectionAppend(obj, class2, hashcodebuilder, flag, as);
        } while (true);
    }

    public static int reflectionHashCode(Object obj)
    {
        return reflectionHashCode(17, 37, obj, false, null, null);
    }

    public static int reflectionHashCode(Object obj, Collection collection)
    {
        return reflectionHashCode(obj, ReflectionToStringBuilder.toNoNullStringArray(collection));
    }

    public static int reflectionHashCode(Object obj, boolean flag)
    {
        return reflectionHashCode(17, 37, obj, flag, null, null);
    }

    public static int reflectionHashCode(Object obj, String as[])
    {
        return reflectionHashCode(17, 37, obj, false, null, as);
    }

    static void register(Object obj)
    {
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorenter ;
        if (getRegistry() == null)
        {
            REGISTRY.set(new HashSet());
        }
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorexit ;
        getRegistry().add(new IDKey(obj));
        return;
        Exception exception;
        exception;
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorexit ;
        throw exception;
    }

    static void unregister(Object obj)
    {
        Set set = getRegistry();
        if (set == null)
        {
            break MISSING_BLOCK_LABEL_62;
        }
        set.remove(new IDKey(obj));
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorenter ;
        Set set1 = getRegistry();
        if (set1 == null)
        {
            break MISSING_BLOCK_LABEL_52;
        }
        if (set1.isEmpty())
        {
            REGISTRY.remove();
        }
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        org/apache/commons/lang3/builder/HashCodeBuilder;
        JVM INSTR monitorexit ;
        throw exception;
    }

    public HashCodeBuilder append(byte byte0)
    {
        iTotal = byte0 + iTotal * iConstant;
        return this;
    }

    public HashCodeBuilder append(char c)
    {
        iTotal = c + iTotal * iConstant;
        return this;
    }

    public HashCodeBuilder append(double d)
    {
        return append(Double.doubleToLongBits(d));
    }

    public HashCodeBuilder append(float f)
    {
        iTotal = iTotal * iConstant + Float.floatToIntBits(f);
        return this;
    }

    public HashCodeBuilder append(int i)
    {
        iTotal = i + iTotal * iConstant;
        return this;
    }

    public HashCodeBuilder append(long l)
    {
        iTotal = iTotal * iConstant + (int)(l ^ l >> 32);
        return this;
    }

    public HashCodeBuilder append(Object obj)
    {
        if (obj == null)
        {
            iTotal = iTotal * iConstant;
            return this;
        }
        if (obj.getClass().isArray())
        {
            if (obj instanceof long[])
            {
                append((long[])obj);
                return this;
            }
            if (obj instanceof int[])
            {
                append((int[])obj);
                return this;
            }
            if (obj instanceof short[])
            {
                append((short[])obj);
                return this;
            }
            if (obj instanceof char[])
            {
                append((char[])obj);
                return this;
            }
            if (obj instanceof byte[])
            {
                append((byte[])obj);
                return this;
            }
            if (obj instanceof double[])
            {
                append((double[])obj);
                return this;
            }
            if (obj instanceof float[])
            {
                append((float[])obj);
                return this;
            }
            if (obj instanceof boolean[])
            {
                append((boolean[])obj);
                return this;
            } else
            {
                append((Object[])obj);
                return this;
            }
        } else
        {
            iTotal = iTotal * iConstant + obj.hashCode();
            return this;
        }
    }

    public HashCodeBuilder append(short word0)
    {
        iTotal = word0 + iTotal * iConstant;
        return this;
    }

    public HashCodeBuilder append(boolean flag)
    {
        int i = iTotal * iConstant;
        int j;
        if (flag)
        {
            j = 0;
        } else
        {
            j = 1;
        }
        iTotal = j + i;
        return this;
    }

    public HashCodeBuilder append(byte abyte0[])
    {
        if (abyte0 == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < abyte0.length) 
            {
                append(abyte0[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(char ac[])
    {
        if (ac == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < ac.length) 
            {
                append(ac[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(double ad[])
    {
        if (ad == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < ad.length) 
            {
                append(ad[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(float af[])
    {
        if (af == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < af.length) 
            {
                append(af[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(int ai[])
    {
        if (ai == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < ai.length) 
            {
                append(ai[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(long al[])
    {
        if (al == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < al.length) 
            {
                append(al[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(Object aobj[])
    {
        if (aobj == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < aobj.length) 
            {
                append(aobj[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(short aword0[])
    {
        if (aword0 == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < aword0.length) 
            {
                append(aword0[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder append(boolean aflag[])
    {
        if (aflag == null)
        {
            iTotal = iTotal * iConstant;
        } else
        {
            int i = 0;
            while (i < aflag.length) 
            {
                append(aflag[i]);
                i++;
            }
        }
        return this;
    }

    public HashCodeBuilder appendSuper(int i)
    {
        iTotal = i + iTotal * iConstant;
        return this;
    }

    public Integer build()
    {
        return Integer.valueOf(toHashCode());
    }

    public volatile Object build()
    {
        return build();
    }

    public int hashCode()
    {
        return toHashCode();
    }

    public int toHashCode()
    {
        return iTotal;
    }

}
