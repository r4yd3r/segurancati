// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.view.menu;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;

// Referenced classes of package com.actionbarsherlock.internal.view.menu:
//            MenuItemImpl

public class ListMenuItemView extends LinearLayout
    implements MenuView.ItemView
{

    private Drawable mBackground;
    private CheckBox mCheckBox;
    final Context mContext;
    private boolean mForceShowIcon;
    private ImageView mIconView;
    private LayoutInflater mInflater;
    private MenuItemImpl mItemData;
    private boolean mPreserveIconSpacing;
    private RadioButton mRadioButton;
    private TextView mShortcutView;
    private int mTextAppearance;
    private Context mTextAppearanceContext;
    private TextView mTitleView;

    public ListMenuItemView(Context context, AttributeSet attributeset)
    {
        this(context, attributeset, 0);
    }

    public ListMenuItemView(Context context, AttributeSet attributeset, int i)
    {
        super(context, attributeset);
        mContext = context;
        TypedArray typedarray = context.obtainStyledAttributes(attributeset, com.actionbarsherlock.R.styleable.SherlockMenuView, i, 0);
        mBackground = typedarray.getDrawable(4);
        mTextAppearance = typedarray.getResourceId(0, -1);
        mPreserveIconSpacing = typedarray.getBoolean(7, false);
        mTextAppearanceContext = context;
        typedarray.recycle();
    }

    private LayoutInflater getInflater()
    {
        if (mInflater == null)
        {
            mInflater = LayoutInflater.from(mContext);
        }
        return mInflater;
    }

    private void insertCheckBox()
    {
        mCheckBox = (CheckBox)getInflater().inflate(com.actionbarsherlock.R.layout.abs__list_menu_item_checkbox, this, false);
        addView(mCheckBox);
    }

    private void insertIconView()
    {
        mIconView = (ImageView)getInflater().inflate(com.actionbarsherlock.R.layout.abs__list_menu_item_icon, this, false);
        addView(mIconView, 0);
    }

    private void insertRadioButton()
    {
        mRadioButton = (RadioButton)getInflater().inflate(com.actionbarsherlock.R.layout.abs__list_menu_item_radio, this, false);
        addView(mRadioButton);
    }

    public MenuItemImpl getItemData()
    {
        return mItemData;
    }

    public void initialize(MenuItemImpl menuitemimpl, int i)
    {
        mItemData = menuitemimpl;
        int j;
        if (menuitemimpl.isVisible())
        {
            j = 0;
        } else
        {
            j = 8;
        }
        setVisibility(j);
        setTitle(menuitemimpl.getTitleForItemView(this));
        setCheckable(menuitemimpl.isCheckable());
        setShortcut(menuitemimpl.shouldShowShortcut(), menuitemimpl.getShortcut());
        setIcon(menuitemimpl.getIcon());
        setEnabled(menuitemimpl.isEnabled());
    }

    protected void onFinishInflate()
    {
        super.onFinishInflate();
        setBackgroundDrawable(mBackground);
        mTitleView = (TextView)findViewById(com.actionbarsherlock.R.id.abs__title);
        if (mTextAppearance != -1)
        {
            mTitleView.setTextAppearance(mTextAppearanceContext, mTextAppearance);
        }
        mShortcutView = (TextView)findViewById(com.actionbarsherlock.R.id.abs__shortcut);
    }

    protected void onMeasure(int i, int j)
    {
        if (mIconView != null && mPreserveIconSpacing)
        {
            android.view.ViewGroup.LayoutParams layoutparams = getLayoutParams();
            android.widget.LinearLayout.LayoutParams layoutparams1 = (android.widget.LinearLayout.LayoutParams)mIconView.getLayoutParams();
            if (layoutparams.height > 0 && layoutparams1.width <= 0)
            {
                layoutparams1.width = layoutparams.height;
            }
        }
        super.onMeasure(i, j);
    }

    public boolean prefersCondensedTitle()
    {
        return false;
    }

    public void setCheckable(boolean flag)
    {
        if (flag || mRadioButton != null || mCheckBox != null)
        {
            if (mRadioButton == null)
            {
                insertRadioButton();
            }
            if (mCheckBox == null)
            {
                insertCheckBox();
            }
            Object obj;
            Object obj1;
            if (mItemData.isExclusiveCheckable())
            {
                obj = mRadioButton;
                obj1 = mCheckBox;
            } else
            {
                obj = mCheckBox;
                obj1 = mRadioButton;
            }
            if (flag)
            {
                ((CompoundButton) (obj)).setChecked(mItemData.isChecked());
                int i;
                if (flag)
                {
                    i = 0;
                } else
                {
                    i = 8;
                }
                if (((CompoundButton) (obj)).getVisibility() != i)
                {
                    ((CompoundButton) (obj)).setVisibility(i);
                }
                if (((CompoundButton) (obj1)).getVisibility() != 8)
                {
                    ((CompoundButton) (obj1)).setVisibility(8);
                    return;
                }
            } else
            {
                mCheckBox.setVisibility(8);
                mRadioButton.setVisibility(8);
                return;
            }
        }
    }

    public void setChecked(boolean flag)
    {
        Object obj;
        if (mItemData.isExclusiveCheckable())
        {
            if (mRadioButton == null)
            {
                insertRadioButton();
            }
            obj = mRadioButton;
        } else
        {
            if (mCheckBox == null)
            {
                insertCheckBox();
            }
            obj = mCheckBox;
        }
        ((CompoundButton) (obj)).setChecked(flag);
    }

    public void setForceShowIcon(boolean flag)
    {
        mForceShowIcon = flag;
        mPreserveIconSpacing = flag;
    }

    public void setIcon(Drawable drawable)
    {
        boolean flag;
        if (!mItemData.shouldShowIcon() && !mForceShowIcon)
        {
            flag = false;
        } else
        {
            flag = true;
        }
        break MISSING_BLOCK_LABEL_19;
        if ((flag || mPreserveIconSpacing) && (mIconView != null || drawable != null || mPreserveIconSpacing))
        {
            if (mIconView == null)
            {
                insertIconView();
            }
            if (drawable != null || mPreserveIconSpacing)
            {
                ImageView imageview = mIconView;
                if (!flag)
                {
                    drawable = null;
                }
                imageview.setImageDrawable(drawable);
                if (mIconView.getVisibility() != 0)
                {
                    mIconView.setVisibility(0);
                    return;
                }
            } else
            {
                mIconView.setVisibility(8);
                return;
            }
        }
        return;
    }

    public void setShortcut(boolean flag, char c)
    {
        int i;
        if (flag && mItemData.shouldShowShortcut())
        {
            i = 0;
        } else
        {
            i = 8;
        }
        if (i == 0)
        {
            mShortcutView.setText(mItemData.getShortcutLabel());
        }
        if (mShortcutView.getVisibility() != i)
        {
            mShortcutView.setVisibility(i);
        }
    }

    public void setTitle(CharSequence charsequence)
    {
        if (charsequence != null)
        {
            mTitleView.setText(charsequence);
            if (mTitleView.getVisibility() != 0)
            {
                mTitleView.setVisibility(0);
            }
        } else
        if (mTitleView.getVisibility() != 8)
        {
            mTitleView.setVisibility(8);
            return;
        }
    }

    public boolean showsIcon()
    {
        return mForceShowIcon;
    }
}
