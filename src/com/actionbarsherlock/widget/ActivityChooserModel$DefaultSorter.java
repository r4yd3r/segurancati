// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.widget;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Referenced classes of package com.actionbarsherlock.widget:
//            ActivityChooserModel

private final class <init>
    implements 
{

    private static final float WEIGHT_DECAY_COEFFICIENT = 0.95F;
    private final Map mPackageNameToActivityMap;
    final ActivityChooserModel this$0;

    public void sort(Intent intent, List list, List list1)
    {
        Map map;
        int i;
        int j;
        map = mPackageNameToActivityMap;
        map.clear();
        i = list.size();
        j = 0;
_L3:
        if (j < i) goto _L2; else goto _L1
_L1:
        float f;
        int l;
        int k = -1 + list1.size();
        f = 1.0F;
        l = k;
_L4:
        if (l < 0)
        {
            Collections.sort(list);
            return;
        }
        break MISSING_BLOCK_LABEL_104;
_L2:
        eInfo einfo = (eInfo)list.get(j);
        einfo.weight = 0.0F;
        map.put(einfo.resolveInfo.activityInfo.packageName, einfo);
        j++;
          goto _L3
        rd rd = (rd)list1.get(l);
        eInfo einfo1 = (eInfo)map.get(rd.activity.getPackageName());
        if (einfo1 != null)
        {
            einfo1.weight = einfo1.weight + f * rd.weight;
            f *= 0.95F;
        }
        l--;
          goto _L4
    }

    private rd()
    {
        this$0 = ActivityChooserModel.this;
        super();
        mPackageNameToActivityMap = new HashMap();
    }

    mPackageNameToActivityMap(mPackageNameToActivityMap mpackagenametoactivitymap)
    {
        this();
    }
}
