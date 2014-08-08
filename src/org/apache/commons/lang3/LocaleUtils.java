// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

public class LocaleUtils
{

    private static List cAvailableLocaleList;
    private static Set cAvailableLocaleSet;
    private static final Map cCountriesByLanguage = Collections.synchronizedMap(new HashMap());
    private static final Map cLanguagesByCountry = Collections.synchronizedMap(new HashMap());

    public LocaleUtils()
    {
    }

    public static List availableLocaleList()
    {
        if (cAvailableLocaleList == null)
        {
            initAvailableLocaleList();
        }
        return cAvailableLocaleList;
    }

    public static Set availableLocaleSet()
    {
        if (cAvailableLocaleSet == null)
        {
            initAvailableLocaleSet();
        }
        return cAvailableLocaleSet;
    }

    public static List countriesByLanguage(String s)
    {
        List list = (List)cCountriesByLanguage.get(s);
        if (list != null) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        List list1;
        int i;
        if (s == null)
        {
            break MISSING_BLOCK_LABEL_127;
        }
        arraylist = new ArrayList();
        list1 = availableLocaleList();
        i = 0;
_L5:
        if (i < list1.size()) goto _L4; else goto _L3
_L3:
        list = Collections.unmodifiableList(arraylist);
_L6:
        cCountriesByLanguage.put(s, list);
_L2:
        return list;
_L4:
        Locale locale = (Locale)list1.get(i);
        if (s.equals(locale.getLanguage()) && locale.getCountry().length() != 0 && locale.getVariant().length() == 0)
        {
            arraylist.add(locale);
        }
        i++;
          goto _L5
        list = Collections.emptyList();
          goto _L6
    }

    private static void initAvailableLocaleList()
    {
        org/apache/commons/lang3/LocaleUtils;
        JVM INSTR monitorenter ;
        if (cAvailableLocaleList == null)
        {
            cAvailableLocaleList = Collections.unmodifiableList(Arrays.asList(Locale.getAvailableLocales()));
        }
        org/apache/commons/lang3/LocaleUtils;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    private static void initAvailableLocaleSet()
    {
        org/apache/commons/lang3/LocaleUtils;
        JVM INSTR monitorenter ;
        if (cAvailableLocaleSet == null)
        {
            cAvailableLocaleSet = Collections.unmodifiableSet(new HashSet(availableLocaleList()));
        }
        org/apache/commons/lang3/LocaleUtils;
        JVM INSTR monitorexit ;
        return;
        Exception exception;
        exception;
        throw exception;
    }

    public static boolean isAvailableLocale(Locale locale)
    {
        return availableLocaleList().contains(locale);
    }

    public static List languagesByCountry(String s)
    {
        List list = (List)cLanguagesByCountry.get(s);
        if (list != null) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        List list1;
        int i;
        if (s == null)
        {
            break MISSING_BLOCK_LABEL_116;
        }
        arraylist = new ArrayList();
        list1 = availableLocaleList();
        i = 0;
_L5:
        if (i < list1.size()) goto _L4; else goto _L3
_L3:
        list = Collections.unmodifiableList(arraylist);
_L6:
        cLanguagesByCountry.put(s, list);
_L2:
        return list;
_L4:
        Locale locale = (Locale)list1.get(i);
        if (s.equals(locale.getCountry()) && locale.getVariant().length() == 0)
        {
            arraylist.add(locale);
        }
        i++;
          goto _L5
        list = Collections.emptyList();
          goto _L6
    }

    public static List localeLookupList(Locale locale)
    {
        return localeLookupList(locale, locale);
    }

    public static List localeLookupList(Locale locale, Locale locale1)
    {
        ArrayList arraylist = new ArrayList(4);
        if (locale != null)
        {
            arraylist.add(locale);
            if (locale.getVariant().length() > 0)
            {
                arraylist.add(new Locale(locale.getLanguage(), locale.getCountry()));
            }
            if (locale.getCountry().length() > 0)
            {
                arraylist.add(new Locale(locale.getLanguage(), ""));
            }
            if (!arraylist.contains(locale1))
            {
                arraylist.add(locale1);
            }
        }
        return Collections.unmodifiableList(arraylist);
    }

    public static Locale toLocale(String s)
    {
        if (s == null)
        {
            return null;
        }
        int i = s.length();
        if (i != 2 && i != 5 && i < 7)
        {
            throw new IllegalArgumentException((new StringBuilder("Invalid locale format: ")).append(s).toString());
        }
        char c = s.charAt(0);
        char c1 = s.charAt(1);
        if (c < 'a' || c > 'z' || c1 < 'a' || c1 > 'z')
        {
            throw new IllegalArgumentException((new StringBuilder("Invalid locale format: ")).append(s).toString());
        }
        if (i == 2)
        {
            return new Locale(s, "");
        }
        if (s.charAt(2) != '_')
        {
            throw new IllegalArgumentException((new StringBuilder("Invalid locale format: ")).append(s).toString());
        }
        char c2 = s.charAt(3);
        if (c2 == '_')
        {
            return new Locale(s.substring(0, 2), "", s.substring(4));
        }
        char c3 = s.charAt(4);
        if (c2 < 'A' || c2 > 'Z' || c3 < 'A' || c3 > 'Z')
        {
            throw new IllegalArgumentException((new StringBuilder("Invalid locale format: ")).append(s).toString());
        }
        if (i == 5)
        {
            return new Locale(s.substring(0, 2), s.substring(3, 5));
        }
        if (s.charAt(5) != '_')
        {
            throw new IllegalArgumentException((new StringBuilder("Invalid locale format: ")).append(s).toString());
        } else
        {
            return new Locale(s.substring(0, 2), s.substring(3, 5), s.substring(6));
        }
    }

}
