// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import java.util.ArrayList;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            Animator, AnimatorSet

private static class animation
    implements Cloneable
{

    public Animator animation;
    public ArrayList dependencies;
    public boolean done;
    public ArrayList nodeDependencies;
    public ArrayList nodeDependents;
    public ArrayList tmpDependencies;

    public void addDependency(dency dency)
    {
        if (dependencies == null)
        {
            dependencies = new ArrayList();
            nodeDependencies = new ArrayList();
        }
        dependencies.add(dency);
        if (!nodeDependencies.contains(dency.node))
        {
            nodeDependencies.add(dency.node);
        }
        dency dency1 = dency.node;
        if (dency1.nodeDependents == null)
        {
            dency1.nodeDependents = new ArrayList();
        }
        dency1.nodeDependents.add(this);
    }

    public nodeDependents clone()
    {
        nodeDependents nodedependents;
        try
        {
            nodedependents = (nodeDependents)super.clone();
            nodedependents.animation = animation.clone();
        }
        catch (CloneNotSupportedException clonenotsupportedexception)
        {
            throw new AssertionError();
        }
        return nodedependents;
    }

    public volatile Object clone()
        throws CloneNotSupportedException
    {
        return clone();
    }

    public dency(Animator animator)
    {
        dependencies = null;
        tmpDependencies = null;
        nodeDependencies = null;
        nodeDependents = null;
        done = false;
        animation = animator;
    }
}
