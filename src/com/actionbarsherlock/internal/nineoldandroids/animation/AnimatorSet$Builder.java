// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import java.util.ArrayList;
import java.util.HashMap;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            AnimatorSet, ValueAnimator, Animator

public class mCurrentNode
{

    private mCurrentNode mCurrentNode;
    final AnimatorSet this$0;

    public mCurrentNode after(long l)
    {
        ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
            0.0F, 1.0F
        });
        valueanimator.setDuration(l);
        after(((Animator) (valueanimator)));
        return this;
    }

    public after after(Animator animator)
    {
        cy cy = (cy)AnimatorSet.access$3(AnimatorSet.this).get(animator);
        if (cy == null)
        {
            cy = new it>(animator);
            AnimatorSet.access$3(AnimatorSet.this).put(animator, cy);
            AnimatorSet.access$6(AnimatorSet.this).add(cy);
        }
        cy cy1 = new cy(cy, 1);
        mCurrentNode.Dependency(cy1);
        return this;
    }

    public cy before(Animator animator)
    {
        cy cy = (cy)AnimatorSet.access$3(AnimatorSet.this).get(animator);
        if (cy == null)
        {
            cy = new it>(animator);
            AnimatorSet.access$3(AnimatorSet.this).put(animator, cy);
            AnimatorSet.access$6(AnimatorSet.this).add(cy);
        }
        cy.Dependency(new cy(mCurrentNode, 1));
        return this;
    }

    public mCurrentNode with(Animator animator)
    {
        cy cy = (cy)AnimatorSet.access$3(AnimatorSet.this).get(animator);
        if (cy == null)
        {
            cy = new it>(animator);
            AnimatorSet.access$3(AnimatorSet.this).put(animator, cy);
            AnimatorSet.access$6(AnimatorSet.this).add(cy);
        }
        cy.Dependency(new cy(mCurrentNode, 0));
        return this;
    }

    cy(Animator animator)
    {
        this$0 = AnimatorSet.this;
        super();
        mCurrentNode = (mCurrentNode)AnimatorSet.access$3(AnimatorSet.this).get(animator);
        if (mCurrentNode == null)
        {
            mCurrentNode = new it>(animator);
            AnimatorSet.access$3(AnimatorSet.this).put(animator, mCurrentNode);
            AnimatorSet.access$6(AnimatorSet.this).add(mCurrentNode);
        }
    }
}
