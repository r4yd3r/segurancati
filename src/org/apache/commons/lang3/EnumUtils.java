// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class EnumUtils
{

    public EnumUtils()
    {
    }

    public static Enum getEnum(Class class1, String s)
    {
        Enum enum;
        try
        {
            enum = Enum.valueOf(class1, s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return null;
        }
        return enum;
    }

    public static List getEnumList(Class class1)
    {
        return new ArrayList(Arrays.asList((Enum[])class1.getEnumConstants()));
    }

    public static Map getEnumMap(Class class1)
    {
        LinkedHashMap linkedhashmap = new LinkedHashMap();
        Enum aenum[] = (Enum[])class1.getEnumConstants();
        int i = aenum.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return linkedhashmap;
            }
            Enum enum = aenum[j];
            linkedhashmap.put(enum.name(), enum);
            j++;
        } while (true);
    }

    public static boolean isValidEnum(Class class1, String s)
    {
        try
        {
            Enum.valueOf(class1, s);
        }
        catch (IllegalArgumentException illegalargumentexception)
        {
            return false;
        }
        return true;
    }
}
