// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.exception;

import java.util.Set;

public interface ExceptionContext
{

    public abstract ExceptionContext addValue(String s, Object obj);

    public abstract String getFormattedExceptionMessage(String s);

    public abstract Set getLabelSet();

    public abstract Object getValue(String s);

    public abstract ExceptionContext replaceValue(String s, Object obj);
}
