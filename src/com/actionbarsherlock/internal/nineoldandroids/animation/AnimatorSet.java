// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.actionbarsherlock.internal.nineoldandroids.animation;

import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

// Referenced classes of package com.actionbarsherlock.internal.nineoldandroids.animation:
//            Animator, ValueAnimator, ObjectAnimator, AnimatorListenerAdapter

public final class AnimatorSet extends Animator
{
    private class AnimatorSetListener
        implements Animator.AnimatorListener
    {

        private AnimatorSet mAnimatorSet;
        final AnimatorSet this$0;

        public void onAnimationCancel(Animator animator)
        {
            if (mTerminated || mPlayingSet.size() != 0 || mListeners == null) goto _L2; else goto _L1
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
            ((Animator.AnimatorListener)mListeners.get(j)).onAnimationCancel(mAnimatorSet);
            j++;
            if (true) goto _L5; else goto _L4
_L4:
        }

        public void onAnimationEnd(Animator animator)
        {
            animator.removeListener(this);
            mPlayingSet.remove(animator);
            ((Node)mAnimatorSet.mNodeMap.get(animator)).done = true;
            if (mTerminated) goto _L2; else goto _L1
_L1:
            ArrayList arraylist;
            boolean flag;
            int i;
            int j;
            arraylist = mAnimatorSet.mSortedNodes;
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
                    if (((Node)arraylist.get(j)).done)
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
            mAnimatorSet.mStarted = false;
_L2:
            return;
            j++;
              goto _L6
            ((Animator.AnimatorListener)arraylist1.get(l)).onAnimationEnd(mAnimatorSet);
            l++;
              goto _L7
        }

        public void onAnimationRepeat(Animator animator)
        {
        }

        public void onAnimationStart(Animator animator)
        {
        }

        AnimatorSetListener(AnimatorSet animatorset1)
        {
            this$0 = AnimatorSet.this;
            super();
            mAnimatorSet = animatorset1;
        }
    }

    public class Builder
    {

        private Node mCurrentNode;
        final AnimatorSet this$0;

        public Builder after(long l)
        {
            ValueAnimator valueanimator = ValueAnimator.ofFloat(new float[] {
                0.0F, 1.0F
            });
            valueanimator.setDuration(l);
            after(((Animator) (valueanimator)));
            return this;
        }

        public Builder after(Animator animator)
        {
            Node node = (Node)mNodeMap.get(animator);
            if (node == null)
            {
                node = new Node(animator);
                mNodeMap.put(animator, node);
                mNodes.add(node);
            }
            Dependency dependency = new Dependency(node, 1);
            mCurrentNode.addDependency(dependency);
            return this;
        }

        public Builder before(Animator animator)
        {
            Node node = (Node)mNodeMap.get(animator);
            if (node == null)
            {
                node = new Node(animator);
                mNodeMap.put(animator, node);
                mNodes.add(node);
            }
            node.addDependency(new Dependency(mCurrentNode, 1));
            return this;
        }

        public Builder with(Animator animator)
        {
            Node node = (Node)mNodeMap.get(animator);
            if (node == null)
            {
                node = new Node(animator);
                mNodeMap.put(animator, node);
                mNodes.add(node);
            }
            node.addDependency(new Dependency(mCurrentNode, 0));
            return this;
        }

        Builder(Animator animator)
        {
            this$0 = AnimatorSet.this;
            super();
            mCurrentNode = (Node)mNodeMap.get(animator);
            if (mCurrentNode == null)
            {
                mCurrentNode = new Node(animator);
                mNodeMap.put(animator, mCurrentNode);
                mNodes.add(mCurrentNode);
            }
        }
    }

    private static class Dependency
    {

        static final int AFTER = 1;
        static final int WITH;
        public Node node;
        public int rule;

        public Dependency(Node node1, int i)
        {
            node = node1;
            rule = i;
        }
    }

    private static class DependencyListener
        implements Animator.AnimatorListener
    {

        private AnimatorSet mAnimatorSet;
        private Node mNode;
        private int mRule;

        private void startIfReady(Animator animator)
        {
            if (!mAnimatorSet.mTerminated) goto _L2; else goto _L1
_L1:
            return;
_L2:
            int i = mNode.tmpDependencies.size();
            int j = 0;
            do
            {
                Dependency dependency = null;
                if (j < i)
                {
label0:
                    {
                        Dependency dependency1 = (Dependency)mNode.tmpDependencies.get(j);
                        if (dependency1.rule != mRule || dependency1.node.animation != animator)
                        {
                            break label0;
                        }
                        dependency = dependency1;
                        animator.removeListener(this);
                    }
                }
                mNode.tmpDependencies.remove(dependency);
                if (mNode.tmpDependencies.size() == 0)
                {
                    mNode.animation.start();
                    mAnimatorSet.mPlayingSet.add(mNode.animation);
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

        public DependencyListener(AnimatorSet animatorset, Node node, int i)
        {
            mAnimatorSet = animatorset;
            mNode = node;
            mRule = i;
        }
    }

    private static class Node
        implements Cloneable
    {

        public Animator animation;
        public ArrayList dependencies;
        public boolean done;
        public ArrayList nodeDependencies;
        public ArrayList nodeDependents;
        public ArrayList tmpDependencies;

        public void addDependency(Dependency dependency)
        {
            if (dependencies == null)
            {
                dependencies = new ArrayList();
                nodeDependencies = new ArrayList();
            }
            dependencies.add(dependency);
            if (!nodeDependencies.contains(dependency.node))
            {
                nodeDependencies.add(dependency.node);
            }
            Node node = dependency.node;
            if (node.nodeDependents == null)
            {
                node.nodeDependents = new ArrayList();
            }
            node.nodeDependents.add(this);
        }

        public Node clone()
        {
            Node node;
            try
            {
                node = (Node)super.clone();
                node.animation = animation.clone();
            }
            catch (CloneNotSupportedException clonenotsupportedexception)
            {
                throw new AssertionError();
            }
            return node;
        }

        public volatile Object clone()
            throws CloneNotSupportedException
        {
            return clone();
        }

        public Node(Animator animator)
        {
            dependencies = null;
            tmpDependencies = null;
            nodeDependencies = null;
            nodeDependents = null;
            done = false;
            animation = animator;
        }
    }


    private ValueAnimator mDelayAnim;
    private long mDuration;
    private boolean mNeedsSort;
    private HashMap mNodeMap;
    private ArrayList mNodes;
    private ArrayList mPlayingSet;
    private AnimatorSetListener mSetListener;
    private ArrayList mSortedNodes;
    private long mStartDelay;
    private boolean mStarted;
    boolean mTerminated;

    public AnimatorSet()
    {
        mPlayingSet = new ArrayList();
        mNodeMap = new HashMap();
        mNodes = new ArrayList();
        mSortedNodes = new ArrayList();
        mNeedsSort = true;
        mSetListener = null;
        mTerminated = false;
        mStarted = false;
        mStartDelay = 0L;
        mDelayAnim = null;
        mDuration = -1L;
    }

    private void sortNodes()
    {
        if (!mNeedsSort) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        int i1;
        int j1;
        mSortedNodes.clear();
        arraylist = new ArrayList();
        i1 = mNodes.size();
        j1 = 0;
_L8:
        if (j1 < i1) goto _L4; else goto _L3
_L3:
        ArrayList arraylist1 = new ArrayList();
_L9:
        if (arraylist.size() > 0) goto _L6; else goto _L5
_L5:
        mNeedsSort = false;
        if (mSortedNodes.size() != mNodes.size())
        {
            throw new IllegalStateException("Circular dependencies cannot exist in AnimatorSet");
        }
          goto _L7
_L4:
        Node node3 = (Node)mNodes.get(j1);
        if (node3.dependencies == null || node3.dependencies.size() == 0)
        {
            arraylist.add(node3);
        }
        j1++;
          goto _L8
_L6:
        int k1;
        int l1;
        k1 = arraylist.size();
        l1 = 0;
_L12:
label0:
        {
            if (l1 < k1)
            {
                break label0;
            }
            arraylist.clear();
            arraylist.addAll(arraylist1);
            arraylist1.clear();
        }
          goto _L9
        Node node1;
        node1 = (Node)arraylist.get(l1);
        mSortedNodes.add(node1);
        if (node1.nodeDependents == null) goto _L11; else goto _L10
_L10:
        int i2;
        int j2;
        i2 = node1.nodeDependents.size();
        j2 = 0;
_L13:
        if (j2 < i2)
        {
            break MISSING_BLOCK_LABEL_232;
        }
_L11:
        l1++;
          goto _L12
        Node node2 = (Node)node1.nodeDependents.get(j2);
        node2.nodeDependencies.remove(node1);
        if (node2.nodeDependencies.size() == 0)
        {
            arraylist1.add(node2);
        }
        j2++;
          goto _L13
_L2:
        int i;
        int j;
        i = mNodes.size();
        j = 0;
_L17:
        if (j < i) goto _L14; else goto _L7
_L7:
        return;
_L14:
        Node node = (Node)mNodes.get(j);
        if (node.dependencies == null || node.dependencies.size() <= 0) goto _L16; else goto _L15
_L15:
        int k;
        int l;
        k = node.dependencies.size();
        l = 0;
_L18:
        if (l < k)
        {
            break MISSING_BLOCK_LABEL_358;
        }
_L16:
        node.done = false;
        j++;
          goto _L17
        Dependency dependency = (Dependency)node.dependencies.get(l);
        if (node.nodeDependencies == null)
        {
            node.nodeDependencies = new ArrayList();
        }
        if (!node.nodeDependencies.contains(dependency.node))
        {
            node.nodeDependencies.add(dependency.node);
        }
        l++;
          goto _L18
    }

    public void cancel()
    {
        mTerminated = true;
        if (!isStarted()) goto _L2; else goto _L1
_L1:
        ArrayList arraylist;
        ArrayList arraylist1;
        arraylist = mListeners;
        arraylist1 = null;
        if (arraylist == null) goto _L4; else goto _L3
_L3:
        Iterator iterator2;
        arraylist1 = (ArrayList)mListeners.clone();
        iterator2 = arraylist1.iterator();
_L7:
        if (iterator2.hasNext()) goto _L5; else goto _L4
_L4:
        if (mDelayAnim != null && mDelayAnim.isRunning())
        {
            mDelayAnim.cancel();
        } else
        if (mSortedNodes.size() > 0)
        {
            Iterator iterator = mSortedNodes.iterator();
            while (iterator.hasNext()) 
            {
                ((Node)iterator.next()).animation.cancel();
            }
        }
        if (arraylist1 != null)
        {
            for (Iterator iterator1 = arraylist1.iterator(); iterator1.hasNext(); ((Animator.AnimatorListener)iterator1.next()).onAnimationEnd(this))
            {
                break MISSING_BLOCK_LABEL_164;
            }

        }
        mStarted = false;
_L2:
        return;
_L5:
        ((Animator.AnimatorListener)iterator2.next()).onAnimationCancel(this);
        if (true) goto _L7; else goto _L6
_L6:
    }

    public volatile Animator clone()
    {
        return clone();
    }

    public AnimatorSet clone()
    {
        AnimatorSet animatorset;
        HashMap hashmap;
        Iterator iterator;
        animatorset = (AnimatorSet)super.clone();
        animatorset.mNeedsSort = true;
        animatorset.mTerminated = false;
        animatorset.mStarted = false;
        animatorset.mPlayingSet = new ArrayList();
        animatorset.mNodeMap = new HashMap();
        animatorset.mNodes = new ArrayList();
        animatorset.mSortedNodes = new ArrayList();
        hashmap = new HashMap();
        iterator = mNodes.iterator();
_L4:
        if (iterator.hasNext()) goto _L2; else goto _L1
_L1:
        Iterator iterator3 = mNodes.iterator();
_L6:
        if (!iterator3.hasNext())
        {
            return animatorset;
        }
        break MISSING_BLOCK_LABEL_310;
_L2:
        ArrayList arraylist;
        Node node = (Node)iterator.next();
        Node node1 = node.clone();
        hashmap.put(node, node1);
        animatorset.mNodes.add(node1);
        animatorset.mNodeMap.put(node1.animation, node1);
        node1.dependencies = null;
        node1.tmpDependencies = null;
        node1.nodeDependents = null;
        node1.nodeDependencies = null;
        arraylist = node1.animation.getListeners();
        if (arraylist == null) goto _L4; else goto _L3
_L3:
        ArrayList arraylist1;
        Iterator iterator1;
        arraylist1 = null;
        iterator1 = arraylist.iterator();
_L5:
label0:
        {
            if (iterator1.hasNext())
            {
                break label0;
            }
            if (arraylist1 != null)
            {
                Iterator iterator2 = arraylist1.iterator();
                while (iterator2.hasNext()) 
                {
                    arraylist.remove((Animator.AnimatorListener)iterator2.next());
                }
            }
        }
          goto _L4
        Animator.AnimatorListener animatorlistener = (Animator.AnimatorListener)iterator1.next();
        if (animatorlistener instanceof AnimatorSetListener)
        {
            if (arraylist1 == null)
            {
                arraylist1 = new ArrayList();
            }
            arraylist1.add(animatorlistener);
        }
          goto _L5
        Node node2 = (Node)iterator3.next();
        Node node3 = (Node)hashmap.get(node2);
        if (node2.dependencies != null)
        {
            Iterator iterator4 = node2.dependencies.iterator();
            while (iterator4.hasNext()) 
            {
                Dependency dependency = (Dependency)iterator4.next();
                node3.addDependency(new Dependency((Node)hashmap.get(dependency.node), dependency.rule));
            }
        }
          goto _L6
    }

    public void end()
    {
        mTerminated = true;
        if (!isStarted()) goto _L2; else goto _L1
_L1:
        if (mSortedNodes.size() == mNodes.size()) goto _L4; else goto _L3
_L3:
        Iterator iterator2;
        sortNodes();
        iterator2 = mSortedNodes.iterator();
_L7:
        if (iterator2.hasNext()) goto _L5; else goto _L4
_L4:
        if (mDelayAnim != null)
        {
            mDelayAnim.cancel();
        }
        if (mSortedNodes.size() > 0)
        {
            Node node;
            for (Iterator iterator1 = mSortedNodes.iterator(); iterator1.hasNext(); ((Node)iterator1.next()).animation.end())
            {
                break MISSING_BLOCK_LABEL_173;
            }

        }
        if (mListeners != null)
        {
            for (Iterator iterator = ((ArrayList)mListeners.clone()).iterator(); iterator.hasNext(); ((Animator.AnimatorListener)iterator.next()).onAnimationEnd(this))
            {
                break MISSING_BLOCK_LABEL_191;
            }

        }
        mStarted = false;
_L2:
        return;
_L5:
        node = (Node)iterator2.next();
        if (mSetListener == null)
        {
            mSetListener = new AnimatorSetListener(this);
        }
        node.animation.addListener(mSetListener);
        if (true) goto _L7; else goto _L6
_L6:
    }

    public ArrayList getChildAnimations()
    {
        ArrayList arraylist = new ArrayList();
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return arraylist;
            }
            arraylist.add(((Node)iterator.next()).animation);
        } while (true);
    }

    public long getDuration()
    {
        return mDuration;
    }

    public long getStartDelay()
    {
        return mStartDelay;
    }

    public boolean isRunning()
    {
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return false;
            }
        } while (!((Node)iterator.next()).animation.isRunning());
        return true;
    }

    public boolean isStarted()
    {
        return mStarted;
    }

    public Builder play(Animator animator)
    {
        if (animator != null)
        {
            mNeedsSort = true;
            return new Builder(animator);
        } else
        {
            return null;
        }
    }

    public void playSequentially(List list)
    {
        if (list != null && list.size() > 0)
        {
            mNeedsSort = true;
            if (list.size() == 1)
            {
                play((Animator)list.get(0));
            } else
            {
                int i = 0;
                while (i < -1 + list.size()) 
                {
                    play((Animator)list.get(i)).before((Animator)list.get(i + 1));
                    i++;
                }
            }
        }
    }

    public transient void playSequentially(Animator aanimator[])
    {
        if (aanimator != null)
        {
            mNeedsSort = true;
            if (aanimator.length == 1)
            {
                play(aanimator[0]);
            } else
            {
                int i = 0;
                while (i < -1 + aanimator.length) 
                {
                    play(aanimator[i]).before(aanimator[i + 1]);
                    i++;
                }
            }
        }
    }

    public void playTogether(Collection collection)
    {
        if (collection == null || collection.size() <= 0) goto _L2; else goto _L1
_L1:
        Builder builder;
        Iterator iterator;
        mNeedsSort = true;
        builder = null;
        iterator = collection.iterator();
_L5:
        if (iterator.hasNext()) goto _L3; else goto _L2
_L2:
        return;
_L3:
        Animator animator = (Animator)iterator.next();
        if (builder == null)
        {
            builder = play(animator);
        } else
        {
            builder.with(animator);
        }
        if (true) goto _L5; else goto _L4
_L4:
    }

    public transient void playTogether(Animator aanimator[])
    {
        if (aanimator == null) goto _L2; else goto _L1
_L1:
        Builder builder;
        int i;
        mNeedsSort = true;
        builder = play(aanimator[0]);
        i = 1;
_L5:
        if (i < aanimator.length) goto _L3; else goto _L2
_L2:
        return;
_L3:
        builder.with(aanimator[i]);
        i++;
        if (true) goto _L5; else goto _L4
_L4:
    }

    public volatile Animator setDuration(long l)
    {
        return setDuration(l);
    }

    public AnimatorSet setDuration(long l)
    {
        if (l < 0L)
        {
            throw new IllegalArgumentException("duration must be a value of zero or greater");
        }
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                mDuration = l;
                return this;
            }
            ((Node)iterator.next()).animation.setDuration(l);
        } while (true);
    }

    public void setInterpolator(Interpolator interpolator)
    {
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((Node)iterator.next()).animation.setInterpolator(interpolator);
        } while (true);
    }

    public void setStartDelay(long l)
    {
        mStartDelay = l;
    }

    public void setTarget(Object obj)
    {
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            Animator animator = ((Node)iterator.next()).animation;
            if (animator instanceof AnimatorSet)
            {
                ((AnimatorSet)animator).setTarget(obj);
            } else
            if (animator instanceof ObjectAnimator)
            {
                ((ObjectAnimator)animator).setTarget(obj);
            }
        } while (true);
    }

    public void setupEndValues()
    {
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((Node)iterator.next()).animation.setupEndValues();
        } while (true);
    }

    public void setupStartValues()
    {
        Iterator iterator = mNodes.iterator();
        do
        {
            if (!iterator.hasNext())
            {
                return;
            }
            ((Node)iterator.next()).animation.setupStartValues();
        } while (true);
    }

    public void start()
    {
        int i;
        int j;
        mTerminated = false;
        mStarted = true;
        sortNodes();
        i = mSortedNodes.size();
        j = 0;
_L17:
        if (j < i) goto _L2; else goto _L1
_L1:
        final ArrayList nodesToStart;
        int k;
        nodesToStart = new ArrayList();
        k = 0;
_L21:
        if (k < i) goto _L4; else goto _L3
_L3:
        if (mStartDelay > 0L) goto _L6; else goto _L5
_L5:
        Iterator iterator = nodesToStart.iterator();
_L24:
        if (iterator.hasNext()) goto _L8; else goto _L7
_L7:
        if (mListeners == null) goto _L10; else goto _L9
_L9:
        ArrayList arraylist1;
        int l1;
        int i2;
        arraylist1 = (ArrayList)mListeners.clone();
        l1 = arraylist1.size();
        i2 = 0;
_L25:
        if (i2 < l1) goto _L11; else goto _L10
_L10:
        if (mNodes.size() != 0 || mStartDelay != 0L) goto _L13; else goto _L12
_L12:
        mStarted = false;
        if (mListeners == null) goto _L13; else goto _L14
_L14:
        ArrayList arraylist;
        int j1;
        int k1;
        arraylist = (ArrayList)mListeners.clone();
        j1 = arraylist.size();
        k1 = 0;
_L26:
        if (k1 < j1)
        {
            break MISSING_BLOCK_LABEL_553;
        }
_L13:
        return;
_L2:
        Node node2;
        ArrayList arraylist2;
        node2 = (Node)mSortedNodes.get(j);
        arraylist2 = node2.animation.getListeners();
        if (arraylist2 == null || arraylist2.size() <= 0) goto _L16; else goto _L15
_L15:
        Iterator iterator1 = (new ArrayList(arraylist2)).iterator();
_L18:
        if (iterator1.hasNext())
        {
            break MISSING_BLOCK_LABEL_234;
        }
_L16:
        j++;
          goto _L17
        Animator.AnimatorListener animatorlistener = (Animator.AnimatorListener)iterator1.next();
        if ((animatorlistener instanceof DependencyListener) || (animatorlistener instanceof AnimatorSetListener))
        {
            node2.animation.removeListener(animatorlistener);
        }
          goto _L18
_L4:
        Node node;
        node = (Node)mSortedNodes.get(k);
        if (mSetListener == null)
        {
            mSetListener = new AnimatorSetListener(this);
        }
        if (node.dependencies != null && node.dependencies.size() != 0) goto _L20; else goto _L19
_L19:
        nodesToStart.add(node);
_L22:
        node.animation.addListener(mSetListener);
        k++;
          goto _L21
_L20:
        int l;
        int i1;
        l = node.dependencies.size();
        i1 = 0;
_L23:
label0:
        {
            if (i1 < l)
            {
                break label0;
            }
            node.tmpDependencies = (ArrayList)node.dependencies.clone();
        }
          goto _L22
        Dependency dependency = (Dependency)node.dependencies.get(i1);
        dependency.node.animation.addListener(new DependencyListener(this, node, dependency.rule));
        i1++;
          goto _L23
_L8:
        Node node1 = (Node)iterator.next();
        node1.animation.start();
        mPlayingSet.add(node1.animation);
          goto _L24
_L6:
        mDelayAnim = ValueAnimator.ofFloat(new float[] {
            0.0F, 1.0F
        });
        mDelayAnim.setDuration(mStartDelay);
        mDelayAnim.addListener(new AnimatorListenerAdapter() {

            boolean canceled;
            final AnimatorSet this$0;
            private final ArrayList val$nodesToStart;

            public void onAnimationCancel(Animator animator)
            {
                canceled = true;
            }

            public void onAnimationEnd(Animator animator)
            {
                if (canceled) goto _L2; else goto _L1
_L1:
                int j2;
                int k2;
                j2 = nodesToStart.size();
                k2 = 0;
_L5:
                if (k2 < j2) goto _L3; else goto _L2
_L2:
                return;
_L3:
                Node node3 = (Node)nodesToStart.get(k2);
                node3.animation.start();
                mPlayingSet.add(node3.animation);
                k2++;
                if (true) goto _L5; else goto _L4
_L4:
            }

            
            {
                this$0 = AnimatorSet.this;
                nodesToStart = arraylist;
                super();
                canceled = false;
            }
        });
        mDelayAnim.start();
          goto _L7
_L11:
        ((Animator.AnimatorListener)arraylist1.get(i2)).onAnimationStart(this);
        i2++;
          goto _L25
        ((Animator.AnimatorListener)arraylist.get(k1)).onAnimationEnd(this);
        k1++;
          goto _L26
    }





}
