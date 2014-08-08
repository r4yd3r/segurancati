// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.exception;

import java.io.Serializable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import org.apache.commons.lang3.SystemUtils;

// Referenced classes of package org.apache.commons.lang3.exception:
//            ExceptionContext, ExceptionUtils

class DefaultExceptionContext
    implements ExceptionContext, Serializable
{

    private static final long serialVersionUID = 0x4139a36066a9087L;
    private Map contextValueMap;

    DefaultExceptionContext()
    {
        contextValueMap = new LinkedHashMap();
    }

    public ExceptionContext addValue(String s, Object obj)
    {
        String s1;
        int i;
        s1 = s;
        i = 0;
_L6:
        if (contextValueMap.containsKey(s1)) goto _L2; else goto _L1
_L1:
        contextValueMap.put(s1, obj);
_L4:
        return this;
_L2:
        Object obj1 = contextValueMap.get(s1);
        if (obj == null && obj1 == null || obj != null && obj.equals(obj1)) goto _L4; else goto _L3
_L3:
        StringBuilder stringbuilder = (new StringBuilder(String.valueOf(s))).append("[");
        i++;
        s1 = stringbuilder.append(i).append("]").toString();
        if (true) goto _L6; else goto _L5
_L5:
    }

    public String getFormattedExceptionMessage(String s)
    {
        StringBuilder stringbuilder;
        stringbuilder = new StringBuilder(256);
        if (s != null)
        {
            stringbuilder.append(s);
        }
        if (contextValueMap.size() <= 0) goto _L2; else goto _L1
_L1:
        Iterator iterator;
        if ((long)stringbuilder.length() > 0L)
        {
            stringbuilder.append(SystemUtils.LINE_SEPARATOR);
        }
        stringbuilder.append("Exception Context:");
        stringbuilder.append(SystemUtils.LINE_SEPARATOR);
        stringbuilder.append("\t");
        iterator = contextValueMap.keySet().iterator();
_L6:
        if (iterator.hasNext()) goto _L4; else goto _L3
_L3:
        stringbuilder.append("---------------------------------");
_L2:
        return stringbuilder.toString();
_L4:
        Object obj;
        String s1 = (String)iterator.next();
        stringbuilder.append("[");
        stringbuilder.append(s1);
        stringbuilder.append("=");
        obj = contextValueMap.get(s1);
        if (obj != null)
        {
            break; /* Loop/switch isn't completed */
        }
        stringbuilder.append("null");
_L7:
        stringbuilder.append("]");
        stringbuilder.append(SystemUtils.LINE_SEPARATOR);
        stringbuilder.append("\t");
        if (true) goto _L6; else goto _L5
_L5:
        String s3 = obj.toString();
        String s2 = s3;
_L8:
        stringbuilder.append(s2);
          goto _L7
        Exception exception;
        exception;
        s2 = (new StringBuilder("Exception thrown on toString(): ")).append(ExceptionUtils.getStackTrace(exception)).toString();
          goto _L8
    }

    public Set getLabelSet()
    {
        return contextValueMap.keySet();
    }

    public Object getValue(String s)
    {
        return contextValueMap.get(s);
    }

    public ExceptionContext replaceValue(String s, Object obj)
    {
        contextValueMap.put(s, obj);
        return this;
    }
}
