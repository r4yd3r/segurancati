// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import java.util.ArrayList;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            AnimatorSet, Animator

private static class mRule
    implements mRule
{

    private AnimatorSet mAnimatorSet;
    private startIfReady mNode;
    private int mRule;

    private void startIfReady(Animator animator)
    {
        if (!mAnimatorSet.mTerminated) goto _L2; else goto _L1
_L1:
        return;
_L2:
        int i = mNode.s.size();
        int j = 0;
        do
        {
            mRule mrule = null;
            if (j < i)
            {
label0:
                {
                    mRule mrule1 = (s)mNode.s.get(j);
                    if (mrule1.s != mRule || mrule1.mRule.mRule != animator)
                    {
                        break label0;
                    }
                    mrule = mrule1;
                    animator.removeListener(this);
                }
            }
            mNode.s.remove(mrule);
            if (mNode.s.size() == 0)
            {
                mNode.mNode.start();
                AnimatorSet.access$2(mAnimatorSet).add(mNode.mNode);
                return;
            }
            if (true)
            {
                continue;
            }
            j++;
        } while (true);
        if (true) goto _L1; else goto _L3
_L3:
    }

    public void onAnimationCancel(Animator animator)
    {
    }

    public void onAnimationEnd(Animator animator)
    {
        if (mRule == 1)
        {
            startIfReady(animator);
        }
    }

    public void onAnimationRepeat(Animator animator)
    {
    }

    public void onAnimationStart(Animator animator)
    {
        if (mRule == 0)
        {
            startIfReady(animator);
        }
    }

    public (AnimatorSet animatorset,  , int i)
    {
        mAnimatorSet = animatorset;
        mNode = ;
        mRule = i;
    }
}
