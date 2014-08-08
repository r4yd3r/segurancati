// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import java.util.HashMap;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            ValueAnimator, PropertyValuesHolder, TypeEvaluator

public final class ObjectAnimator extends ValueAnimator
{

    private static final boolean DBG;
    private String mPropertyName;
    private Object mTarget;

    public ObjectAnimator()
    {
    }

    private ObjectAnimator(Object obj, String s)
    {
        mTarget = obj;
        setPropertyName(s);
    }

    public static transient ObjectAnimator ofFloat(Object obj, String s, float af[])
    {
        ObjectAnimator objectanimator = new ObjectAnimator(obj, s);
        objectanimator.setFloatValues(af);
        return objectanimator;
    }

    public static transient ObjectAnimator ofInt(Object obj, String s, int ai[])
    {
        ObjectAnimator objectanimator = new ObjectAnimator(obj, s);
        objectanimator.setIntValues(ai);
        return objectanimator;
    }

    public static transient ObjectAnimator ofObject(Object obj, String s, TypeEvaluator typeevaluator, Object aobj[])
    {
        ObjectAnimator objectanimator = new ObjectAnimator(obj, s);
        objectanimator.setObjectValues(aobj);
        objectanimator.setEvaluator(typeevaluator);
        return objectanimator;
    }

    public static transient ObjectAnimator ofPropertyValuesHolder(Object obj, PropertyValuesHolder apropertyvaluesholder[])
    {
        ObjectAnimator objectanimator = new ObjectAnimator();
        objectanimator.mTarget = obj;
        objectanimator.setValues(apropertyvaluesholder);
        return objectanimator;
    }

    void animateValue(float f)
    {
        super.animateValue(f);
        int i = mValues.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return;
            }
            mValues[j].setAnimatedValue(mTarget);
            j++;
        } while (true);
    }

    public ObjectAnimator clone()
    {
        return (ObjectAnimator)super.clone();
    }

    public volatile ValueAnimator clone()
    {
        return clone();
    }

    public String getPropertyName()
    {
        return mPropertyName;
    }

    public Object getTarget()
    {
        return mTarget;
    }

    void initAnimation()
    {
        if (mInitialized) goto _L2; else goto _L1
_L1:
        int i;
        int j;
        i = mValues.length;
        j = 0;
_L6:
        if (j < i) goto _L4; else goto _L3
_L3:
        super.initAnimation();
_L2:
        return;
_L4:
        mValues[j].setupSetterAndGetter(mTarget);
        j++;
        if (true) goto _L6; else goto _L5
_L5:
    }

    public ObjectAnimator setDuration(long l)
    {
        super.setDuration(l);
        return this;
    }

    public volatile ValueAnimator setDuration(long l)
    {
        return setDuration(l);
    }

    public transient void setFloatValues(float af[])
    {
        if (mValues == null || mValues.length == 0)
        {
            PropertyValuesHolder apropertyvaluesholder[] = new PropertyValuesHolder[1];
            apropertyvaluesholder[0] = PropertyValuesHolder.ofFloat(mPropertyName, af);
            setValues(apropertyvaluesholder);
            return;
        } else
        {
            super.setFloatValues(af);
            return;
        }
    }

    public transient void setIntValues(int ai[])
    {
        if (mValues == null || mValues.length == 0)
        {
            PropertyValuesHolder apropertyvaluesholder[] = new PropertyValuesHolder[1];
            apropertyvaluesholder[0] = PropertyValuesHolder.ofInt(mPropertyName, ai);
            setValues(apropertyvaluesholder);
            return;
        } else
        {
            super.setIntValues(ai);
            return;
        }
    }

    public transient void setObjectValues(Object aobj[])
    {
        if (mValues == null || mValues.length == 0)
        {
            PropertyValuesHolder apropertyvaluesholder[] = new PropertyValuesHolder[1];
            apropertyvaluesholder[0] = PropertyValuesHolder.ofObject(mPropertyName, null, aobj);
            setValues(apropertyvaluesholder);
            return;
        } else
        {
            super.setObjectValues(aobj);
            return;
        }
    }

    public void setPropertyName(String s)
    {
        if (mValues != null)
        {
            PropertyValuesHolder propertyvaluesholder = mValues[0];
            String s1 = propertyvaluesholder.getPropertyName();
            propertyvaluesholder.setPropertyName(s);
            mValuesMap.remove(s1);
            mValuesMap.put(s, propertyvaluesholder);
        }
        mPropertyName = s;
        mInitialized = false;
    }

    public void setTarget(Object obj)
    {
label0:
        {
            if (mTarget != obj)
            {
                Object obj1 = mTarget;
                mTarget = obj;
                if (obj1 == null || obj == null || obj1.getClass() != obj.getClass())
                {
                    break label0;
                }
            }
            return;
        }
        mInitialized = false;
    }

    public void setupEndValues()
    {
        initAnimation();
        int i = mValues.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return;
            }
            mValues[j].setupEndValue(mTarget);
            j++;
        } while (true);
    }

    public void setupStartValues()
    {
        initAnimation();
        int i = mValues.length;
        int j = 0;
        do
        {
            if (j >= i)
            {
                return;
            }
            mValues[j].setupStartValue(mTarget);
            j++;
        } while (true);
    }

    public void start()
    {
        super.start();
    }

    public String toString()
    {
        String s = (new StringBuilder("ObjectAnimator@")).append(Integer.toHexString(hashCode())).append(", target ").append(mTarget).toString();
        if (mValues == null) goto _L2; else goto _L1
_L1:
        int i = 0;
_L5:
        if (i < mValues.length) goto _L3; else goto _L2
_L2:
        return s;
_L3:
        s = (new StringBuilder(String.valueOf(s))).append("\n    ").append(mValues[i].toString()).toString();
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }
}
