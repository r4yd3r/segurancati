// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package org.apache.commons.lang3.event;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import org.apache.commons.lang3.Validate;

public class EventListenerSupport
{
    private class ProxyInvocationHandler
        implements InvocationHandler
    {

        final EventListenerSupport this$0;

        public Object invoke(Object obj, Method method, Object aobj[])
            throws Throwable
        {
            Iterator iterator = listeners.iterator();
            do
            {
                if (!iterator.hasNext())
                {
                    return null;
                }
                method.invoke((Object)iterator.next(), aobj);
            } while (true);
        }

        private ProxyInvocationHandler()
        {
            this$0 = EventListenerSupport.this;
            super();
        }

        ProxyInvocationHandler(ProxyInvocationHandler proxyinvocationhandler)
        {
            this();
        }
    }


    private final List listeners;
    private final Object proxy;

    public EventListenerSupport(Class class1)
    {
        this(class1, Thread.currentThread().getContextClassLoader());
    }

    public EventListenerSupport(Class class1, ClassLoader classloader)
    {
        listeners = new CopyOnWriteArrayList();
        Validate.notNull(class1, "Listener interface cannot be null.", new Object[0]);
        Validate.notNull(classloader, "ClassLoader cannot be null.", new Object[0]);
        boolean flag = class1.isInterface();
        Object aobj[] = new Object[1];
        aobj[0] = class1.getName();
        Validate.isTrue(flag, "Class {0} is not an interface", aobj);
        proxy = class1.cast(Proxy.newProxyInstance(classloader, new Class[] {
            class1
        }, new ProxyInvocationHandler(null)));
    }

    public static EventListenerSupport create(Class class1)
    {
        return new EventListenerSupport(class1);
    }

    public void addListener(Object obj)
    {
        Validate.notNull(obj, "Listener object cannot be null.", new Object[0]);
        listeners.add(obj);
    }

    public Object fire()
    {
        return proxy;
    }

    int getListenerCount()
    {
        return listeners.size();
    }

    public void removeListener(Object obj)
    {
        Validate.notNull(obj, "Listener object cannot be null.", new Object[0]);
        listeners.remove(obj);
    }

}
