// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.event;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package org.apache.commons.lang3.event:
//            EventListenerSupport

private class <init>
    implements InvocationHandler
{

    final EventListenerSupport this$0;

    public Object invoke(Object obj, Method method, Object aobj[])
        throws Throwable
    {
        Iterator iterator = EventListenerSupport.access$0(EventListenerSupport.this).iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return null;
            }
            method.invoke((Object)iterator.next(), aobj);
        } while (true);
    }

    private ()
    {
        this$0 = EventListenerSupport.this;
        super();
    }

    this._cls0(this._cls0 _pcls0)
    {
        this();
    }
}
