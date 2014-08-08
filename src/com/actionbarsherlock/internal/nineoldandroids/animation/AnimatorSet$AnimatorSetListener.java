// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import java.util.ArrayList;
import java.util.HashMap;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            AnimatorSet, Animator

private class mAnimatorSet
    implements mAnimatorSet
{

    private AnimatorSet mAnimatorSet;
    final AnimatorSet this$0;

    public void onAnimationCancel(Animator animator)
    {
        if (mTerminated || AnimatorSet.access$2(AnimatorSet.this).size() != 0 || mListeners == null) goto _L2; else goto _L1
_L1:
        int i;
        int j;
        i = mListeners.size();
        j = 0;
_L5:
        if (j < i) goto _L3; else goto _L2
_L2:
        return;
_L3:
        ((this._cls0)mListeners.get(j)).ationCancel(mAnimatorSet);
        j++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public void onAnimationEnd(Animator animator)
    {
        animator.removeListener(this);
        AnimatorSet.access$2(AnimatorSet.this).remove(animator);
        ((this._cls0)AnimatorSet.access$3(mAnimatorSet).get(animator)).mAnimatorSet = true;
        if (mTerminated) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        boolean flag;
        int i;
        int j;
        arraylist = AnimatorSet.access$4(mAnimatorSet);
        flag = true;
        i = arraylist.size();
        j = 0;
_L6:
        ArrayList arraylist1;
        int k;
        int l;
        if (j < i)
        {
label0:
            {
                if (((mAnimatorSet)arraylist.get(j)).mAnimatorSet)
                {
                    break label0;
                }
                flag = false;
            }
        }
        if (!flag) goto _L2; else goto _L3
_L3:
        if (mListeners == null) goto _L5; else goto _L4
_L4:
        arraylist1 = (ArrayList)mListeners.clone();
        k = arraylist1.size();
        l = 0;
_L7:
        if (l < k)
        {
            break MISSING_BLOCK_LABEL_155;
        }
_L5:
        AnimatorSet.access$5(mAnimatorSet, false);
_L2:
        return;
        j++;
          goto _L6
        ((mAnimatorSet)arraylist1.get(l)).ationEnd(mAnimatorSet);
        l++;
          goto _L7
    }

    public void onAnimationRepeat(Animator animator)
    {
    }

    public void onAnimationStart(Animator animator)
    {
    }

    (AnimatorSet animatorset1)
    {
        this$0 = AnimatorSet.this;
        super();
        mAnimatorSet = animatorset1;
    }
}
