// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;

// Referenced classes of package org.apache.commons.lang3:
//            ArrayUtils, StringUtils

public class Validate
{

    private static final String DEFAULT_EXCLUSIVE_BETWEEN_EX_MESSAGE = "The value %s is not in the specified exclusive range of %s to %s";
    private static final String DEFAULT_INCLUSIVE_BETWEEN_EX_MESSAGE = "The value %s is not in the specified inclusive range of %s to %s";
    private static final String DEFAULT_IS_ASSIGNABLE_EX_MESSAGE = "The validated class can not be converted to the %s class";
    private static final String DEFAULT_IS_INSTANCE_OF_EX_MESSAGE = "The validated object is not an instance of %s";
    private static final String DEFAULT_IS_NULL_EX_MESSAGE = "The validated object is null";
    private static final String DEFAULT_IS_TRUE_EX_MESSAGE = "The validated expression is false";
    private static final String DEFAULT_MATCHES_PATTERN_EX = "The string %s does not match the pattern %s";
    private static final String DEFAULT_NOT_BLANK_EX_MESSAGE = "The validated character sequence is blank";
    private static final String DEFAULT_NOT_EMPTY_ARRAY_EX_MESSAGE = "The validated array is empty";
    private static final String DEFAULT_NOT_EMPTY_CHAR_SEQUENCE_EX_MESSAGE = "The validated character sequence is empty";
    private static final String DEFAULT_NOT_EMPTY_COLLECTION_EX_MESSAGE = "The validated collection is empty";
    private static final String DEFAULT_NOT_EMPTY_MAP_EX_MESSAGE = "The validated map is empty";
    private static final String DEFAULT_NO_NULL_ELEMENTS_ARRAY_EX_MESSAGE = "The validated array contains null element at index: %d";
    private static final String DEFAULT_NO_NULL_ELEMENTS_COLLECTION_EX_MESSAGE = "The validated collection contains null element at index: %d";
    private static final String DEFAULT_VALID_INDEX_ARRAY_EX_MESSAGE = "The validated array index is invalid: %d";
    private static final String DEFAULT_VALID_INDEX_CHAR_SEQUENCE_EX_MESSAGE = "The validated character sequence index is invalid: %d";
    private static final String DEFAULT_VALID_INDEX_COLLECTION_EX_MESSAGE = "The validated collection index is invalid: %d";
    private static final String DEFAULT_VALID_STATE_EX_MESSAGE = "The validated state is false";

    public Validate()
    {
    }

    public static void exclusiveBetween(Object obj, Object obj1, Comparable comparable)
    {
        if (comparable.compareTo(obj) <= 0 || comparable.compareTo(obj1) >= 0)
        {
            throw new IllegalArgumentException(String.format("The value %s is not in the specified exclusive range of %s to %s", new Object[] {
                comparable, obj, obj1
            }));
        } else
        {
            return;
        }
    }

    public static transient void exclusiveBetween(Object obj, Object obj1, Comparable comparable, String s, Object aobj[])
    {
        if (comparable.compareTo(obj) <= 0 || comparable.compareTo(obj1) >= 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void inclusiveBetween(Object obj, Object obj1, Comparable comparable)
    {
        if (comparable.compareTo(obj) < 0 || comparable.compareTo(obj1) > 0)
        {
            throw new IllegalArgumentException(String.format("The value %s is not in the specified inclusive range of %s to %s", new Object[] {
                comparable, obj, obj1
            }));
        } else
        {
            return;
        }
    }

    public static transient void inclusiveBetween(Object obj, Object obj1, Comparable comparable, String s, Object aobj[])
    {
        if (comparable.compareTo(obj) < 0 || comparable.compareTo(obj1) > 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void isAssignableFrom(Class class1, Class class2)
    {
        if (!class1.isAssignableFrom(class2))
        {
            Object aobj[] = new Object[1];
            aobj[0] = class1.getName();
            throw new IllegalArgumentException(String.format("The validated class can not be converted to the %s class", aobj));
        } else
        {
            return;
        }
    }

    public static transient void isAssignableFrom(Class class1, Class class2, String s, Object aobj[])
    {
        if (!class1.isAssignableFrom(class2))
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void isInstanceOf(Class class1, Object obj)
    {
        if (!class1.isInstance(obj))
        {
            Object aobj[] = new Object[1];
            aobj[0] = class1.getName();
            throw new IllegalArgumentException(String.format("The validated object is not an instance of %s", aobj));
        } else
        {
            return;
        }
    }

    public static transient void isInstanceOf(Class class1, Object obj, String s, Object aobj[])
    {
        if (!class1.isInstance(obj))
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void isTrue(boolean flag)
    {
        if (!flag)
        {
            throw new IllegalArgumentException("The validated expression is false");
        } else
        {
            return;
        }
    }

    public static void isTrue(boolean flag, String s, double d)
    {
        if (!flag)
        {
            Object aobj[] = new Object[1];
            aobj[0] = new Double(d);
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void isTrue(boolean flag, String s, long l)
    {
        if (!flag)
        {
            Object aobj[] = new Object[1];
            aobj[0] = Long.valueOf(l);
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static transient void isTrue(boolean flag, String s, Object aobj[])
    {
        if (!flag)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return;
        }
    }

    public static void matchesPattern(CharSequence charsequence, String s)
    {
        if (!Pattern.matches(s, charsequence))
        {
            throw new IllegalArgumentException(String.format("The string %s does not match the pattern %s", new Object[] {
                charsequence, s
            }));
        } else
        {
            return;
        }
    }

    public static transient void matchesPattern(CharSequence charsequence, String s, String s1, Object aobj[])
    {
        if (!Pattern.matches(s, charsequence))
        {
            throw new IllegalArgumentException(String.format(s1, aobj));
        } else
        {
            return;
        }
    }

    public static Iterable noNullElements(Iterable iterable)
    {
        return noNullElements(iterable, "The validated collection contains null element at index: %d", new Object[0]);
    }

    public static transient Iterable noNullElements(Iterable iterable, String s, Object aobj[])
    {
        notNull(iterable);
        int i = 0;
        Iterator iterator = iterable.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return iterable;
            }
            if (iterator.next() == null)
            {
                Object aobj1[] = new Object[1];
                aobj1[0] = Integer.valueOf(i);
                throw new IllegalArgumentException(String.format(s, ArrayUtils.addAll(aobj, aobj1)));
            }
            i++;
        } while (true);
    }

    public static Object[] noNullElements(Object aobj[])
    {
        return noNullElements(aobj, "The validated array contains null element at index: %d", new Object[0]);
    }

    public static transient Object[] noNullElements(Object aobj[], String s, Object aobj1[])
    {
        notNull(((Object) (aobj)));
        int i = 0;
        do
        {
            if (i >= aobj.length)
            {
                return aobj;
            }
            if (aobj[i] == null)
            {
                throw new IllegalArgumentException(String.format(s, ArrayUtils.add(aobj1, Integer.valueOf(i))));
            }
            i++;
        } while (true);
    }

    public static CharSequence notBlank(CharSequence charsequence)
    {
        return notBlank(charsequence, "The validated character sequence is blank", new Object[0]);
    }

    public static transient CharSequence notBlank(CharSequence charsequence, String s, Object aobj[])
    {
        if (charsequence == null)
        {
            throw new NullPointerException(String.format(s, aobj));
        }
        if (StringUtils.isBlank(charsequence))
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return charsequence;
        }
    }

    public static CharSequence notEmpty(CharSequence charsequence)
    {
        return notEmpty(charsequence, "The validated character sequence is empty", new Object[0]);
    }

    public static transient CharSequence notEmpty(CharSequence charsequence, String s, Object aobj[])
    {
        if (charsequence == null)
        {
            throw new NullPointerException(String.format(s, aobj));
        }
        if (charsequence.length() == 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return charsequence;
        }
    }

    public static Collection notEmpty(Collection collection)
    {
        return notEmpty(collection, "The validated collection is empty", new Object[0]);
    }

    public static transient Collection notEmpty(Collection collection, String s, Object aobj[])
    {
        if (collection == null)
        {
            throw new NullPointerException(String.format(s, aobj));
        }
        if (collection.size() == 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return collection;
        }
    }

    public static Map notEmpty(Map map)
    {
        return notEmpty(map, "The validated map is empty", new Object[0]);
    }

    public static transient Map notEmpty(Map map, String s, Object aobj[])
    {
        if (map == null)
        {
            throw new NullPointerException(String.format(s, aobj));
        }
        if (map.size() == 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj));
        } else
        {
            return map;
        }
    }

    public static Object[] notEmpty(Object aobj[])
    {
        return notEmpty(aobj, "The validated array is empty", new Object[0]);
    }

    public static transient Object[] notEmpty(Object aobj[], String s, Object aobj1[])
    {
        if (aobj == null)
        {
            throw new NullPointerException(String.format(s, aobj1));
        }
        if (aobj.length == 0)
        {
            throw new IllegalArgumentException(String.format(s, aobj1));
        } else
        {
            return aobj;
        }
    }

    public static Object notNull(Object obj)
    {
        return notNull(obj, "The validated object is null", new Object[0]);
    }

    public static transient Object notNull(Object obj, String s, Object aobj[])
    {
        if (obj == null)
        {
            throw new NullPointerException(String.format(s, aobj));
        } else
        {
            return obj;
        }
    }

    public static CharSequence validIndex(CharSequence charsequence, int i)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        return validIndex(charsequence, i, "The validated character sequence index is invalid: %d", aobj);
    }

    public static transient CharSequence validIndex(CharSequence charsequence, int i, String s, Object aobj[])
    {
        notNull(charsequence);
        if (i < 0 || i >= charsequence.length())
        {
            throw new IndexOutOfBoundsException(String.format(s, aobj));
        } else
        {
            return charsequence;
        }
    }

    public static Collection validIndex(Collection collection, int i)
    {
        Object aobj[] = new Object[1];
        aobj[0] = Integer.valueOf(i);
        return validIndex(collection, i, "The validated collection index is invalid: %d", aobj);
    }

    public static transient Collection validIndex(Collection collection, int i, String s, Object aobj[])
    {
        notNull(collection);
        if (i < 0 || i >= collection.size())
        {
            throw new IndexOutOfBoundsException(String.format(s, aobj));
        } else
        {
            return collection;
        }
    }

    public static Object[] validIndex(Object aobj[], int i)
    {
        Object aobj1[] = new Object[1];
        aobj1[0] = Integer.valueOf(i);
        return validIndex(aobj, i, "The validated array index is invalid: %d", aobj1);
    }

    public static transient Object[] validIndex(Object aobj[], int i, String s, Object aobj1[])
    {
        notNull(((Object) (aobj)));
        if (i < 0 || i >= aobj.length)
        {
            throw new IndexOutOfBoundsException(String.format(s, aobj1));
        } else
        {
            return aobj;
        }
    }

    public static void validState(boolean flag)
    {
        if (!flag)
        {
            throw new IllegalArgumentException("The validated state is false");
        } else
        {
            return;
        }
    }

    public static transient void validState(boolean flag, String s, Object aobj[])
    {
        if (!flag)
        {
            throw new IllegalStateException(String.format(s, aobj));
        } else
        {
            return;
        }
    }
}
