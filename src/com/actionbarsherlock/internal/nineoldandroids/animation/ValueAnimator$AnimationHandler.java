// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import android.os.Handler;
import android.os.Message;
import android.view.animation.AnimationUtils;
import java.util.ArrayList;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            ValueAnimator

private static class <init> extends Handler
{

    public void handleMessage(Message message)
    {
        boolean flag;
        ArrayList arraylist;
        ArrayList arraylist1;
        flag = true;
        arraylist = (ArrayList)ValueAnimator.access$2().get();
        arraylist1 = (ArrayList)ValueAnimator.access$3().get();
        message.what;
        JVM INSTR tableswitch 0 1: default 48
    //                   0 49
    //                   1 85;
           goto _L1 _L2 _L3
_L1:
        return;
_L2:
        ArrayList arraylist4;
        arraylist4 = (ArrayList)ValueAnimator.access$4().get();
        if (arraylist.size() > 0 || arraylist1.size() > 0)
        {
            flag = false;
        }
_L16:
        if (arraylist4.size() > 0) goto _L4; else goto _L3
_L3:
        long l;
        ArrayList arraylist2;
        ArrayList arraylist3;
        int i;
        int j;
        l = AnimationUtils.currentAnimationTimeMillis();
        arraylist2 = (ArrayList)ValueAnimator.access$7().get();
        arraylist3 = (ArrayList)ValueAnimator.access$8().get();
        i = arraylist1.size();
        j = 0;
_L17:
        if (j < i) goto _L6; else goto _L5
_L5:
        int k = arraylist2.size();
        if (k <= 0) goto _L8; else goto _L7
_L7:
        int l1 = 0;
_L18:
        if (l1 < k) goto _L10; else goto _L9
_L9:
        arraylist2.clear();
_L8:
        int i1;
        int j1;
        i1 = arraylist.size();
        j1 = 0;
_L19:
        if (j1 < i1) goto _L12; else goto _L11
_L11:
        int k1;
        if (arraylist3.size() <= 0)
        {
            continue; /* Loop/switch isn't completed */
        }
        k1 = 0;
_L20:
        if (k1 < arraylist3.size()) goto _L14; else goto _L13
_L13:
        arraylist3.clear();
        if (!flag || arraylist.isEmpty() && arraylist1.isEmpty()) goto _L1; else goto _L15
_L15:
        sendEmptyMessageDelayed(1, Math.max(0L, ValueAnimator.access$12() - (AnimationUtils.currentAnimationTimeMillis() - l)));
        return;
_L4:
        ArrayList arraylist5 = (ArrayList)arraylist4.clone();
        arraylist4.clear();
        int i2 = arraylist5.size();
        int j2 = 0;
        while (j2 < i2) 
        {
            ValueAnimator valueanimator3 = (ValueAnimator)arraylist5.get(j2);
            if (ValueAnimator.access$5(valueanimator3) == 0L)
            {
                ValueAnimator.access$6(valueanimator3);
            } else
            {
                arraylist1.add(valueanimator3);
            }
            j2++;
        }
          goto _L16
_L6:
        ValueAnimator valueanimator = (ValueAnimator)arraylist1.get(j);
        if (ValueAnimator.access$9(valueanimator, l))
        {
            arraylist2.add(valueanimator);
        }
        j++;
          goto _L17
_L10:
        ValueAnimator valueanimator2 = (ValueAnimator)arraylist2.get(l1);
        ValueAnimator.access$6(valueanimator2);
        ValueAnimator.access$10(valueanimator2, true);
        arraylist1.remove(valueanimator2);
        l1++;
          goto _L18
_L12:
        ValueAnimator valueanimator1 = (ValueAnimator)arraylist.get(j1);
        if (valueanimator1.animationFrame(l))
        {
            arraylist3.add(valueanimator1);
        }
        if (arraylist.size() == i1)
        {
            j1++;
        } else
        {
            i1--;
            arraylist3.remove(valueanimator1);
        }
          goto _L19
_L14:
        ValueAnimator.access$11((ValueAnimator)arraylist3.get(k1));
        k1++;
          goto _L20
    }

    private ()
    {
    }

    ( )
    {
        this();
    }
}
