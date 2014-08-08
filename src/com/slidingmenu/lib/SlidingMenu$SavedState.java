// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.slidingmenu.lib;

import android.os.Parcel;
import android.os.Parcelable;

// Referenced classes of package com.slidingmenu.lib:
//            SlidingMenu

public static class mBehindShowing extends android.view.dState
{

    public static final android.os.vedState.mBehindShowing CREATOR = new android.os.Parcelable.Creator() {

        public SlidingMenu.SavedState createFromParcel(Parcel parcel)
        {
            return new SlidingMenu.SavedState(parcel, null);
        }

        public volatile Object createFromParcel(Parcel parcel)
        {
            return createFromParcel(parcel);
        }

        public SlidingMenu.SavedState[] newArray(int i)
        {
            return new SlidingMenu.SavedState[i];
        }

        public volatile Object[] newArray(int i)
        {
            return newArray(i);
        }

    };
    private final boolean mBehindShowing;

    public void writeToParcel(Parcel parcel, int i)
    {
        super.teToParcel(parcel, i);
        byte byte0;
        if (mBehindShowing)
        {
            byte0 = 1;
        } else
        {
            byte0 = 0;
        }
        parcel.writeByte(byte0);
    }



    private _cls1(Parcel parcel)
    {
        super(parcel);
        boolean flag;
        if (parcel.readByte() != 0)
        {
            flag = true;
        } else
        {
            flag = false;
        }
        mBehindShowing = flag;
    }

    mBehindShowing(Parcel parcel, mBehindShowing mbehindshowing)
    {
        this(parcel);
    }

    public <init>(Parcelable parcelable, boolean flag)
    {
        super(parcelable);
        mBehindShowing = flag;
    }
}
