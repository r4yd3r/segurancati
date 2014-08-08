// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.exception;

import java.util.Set;

// Referenced classes of package org.apache.commons.lang3.exception:
//            ExceptionContext, DefaultExceptionContext

public class ContextedRuntimeException extends RuntimeException
    implements ExceptionContext
{

    private static final long serialVersionUID = 0x1441de1501834869L;
    private final ExceptionContext exceptionContext;

    public ContextedRuntimeException()
    {
        exceptionContext = new DefaultExceptionContext();
    }

    public ContextedRuntimeException(String s)
    {
        super(s);
        exceptionContext = new DefaultExceptionContext();
    }

    public ContextedRuntimeException(String s, Throwable throwable)
    {
        super(s, throwable);
        exceptionContext = new DefaultExceptionContext();
    }

    public ContextedRuntimeException(String s, Throwable throwable, ExceptionContext exceptioncontext)
    {
        super(s, throwable);
        if (exceptioncontext == null)
        {
            exceptioncontext = new DefaultExceptionContext();
        }
        exceptionContext = exceptioncontext;
    }

    public ContextedRuntimeException(Throwable throwable)
    {
        super(throwable);
        exceptionContext = new DefaultExceptionContext();
    }

    public ContextedRuntimeException addValue(String s, Object obj)
    {
        exceptionContext.addValue(s, obj);
        return this;
    }

    public volatile ExceptionContext addValue(String s, Object obj)
    {
        return addValue(s, obj);
    }

    public String getFormattedExceptionMessage(String s)
    {
        return exceptionContext.getFormattedExceptionMessage(s);
    }

    public Set getLabelSet()
    {
        return exceptionContext.getLabelSet();
    }

    public String getMessage()
    {
        return getFormattedExceptionMessage(super.getMessage());
    }

    public Object getValue(String s)
    {
        return exceptionContext.getValue(s);
    }

    public ContextedRuntimeException replaceValue(String s, Object obj)
    {
        exceptionContext.replaceValue(s, obj);
        return this;
    }

    public volatile ExceptionContext replaceValue(String s, Object obj)
    {
        return replaceValue(s, obj);
    }
}
