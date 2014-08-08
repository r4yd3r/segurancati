// Decompiled by Jad v1.5.8e. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/kpdus/jad.html
// Decompiler options: braces fieldsfirst space lnc 

package com.isaacwaller.wikipedia;

import android.app.ProgressDialog;
import android.app.SearchManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.text.Html;
import android.text.Spanned;
import android.util.Log;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.Toast;
import com.actionbarsherlock.app.ActionBar;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.actionbarsherlock.view.Menu;
import com.actionbarsherlock.view.MenuInflater;
import com.actionbarsherlock.view.MenuItem;
import com.actionbarsherlock.widget.SearchView;
import com.isaacwaller.wikipedia.newloader.Wiki;
import com.isaacwaller.wikipedia.newloader.WikiManager;
import com.slidingmenu.lib.SlidingMenu;
import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import org.json.JSONObject;
import org.json.JSONTokener;

// Referenced classes of package com.isaacwaller.wikipedia:
//            PageReference, BookmarksDBAdapter, BookmarksFragment, ProManager, 
//            QueueFragment, PreferencesActivity, Utils, HomeScreenShortcutActivity, 
//            OfflinePageSaver

public class WelcomeActivity extends SherlockFragmentActivity
    implements BookmarksFragment.OnBookmarkSelectedListener, QueueFragment.OnQueueItemSelectedListener
{
    private class ActivateElectionPlusTask extends AsyncTask
    {

        final WelcomeActivity this$0;

        protected volatile transient Object doInBackground(Object aobj[])
        {
            return doInBackground((Object[])aobj);
        }

        protected transient Void doInBackground(Object aobj[])
        {
            ProgressDialog progressdialog;
            String s1;
            String s = (String)aobj[0];
            progressdialog = (ProgressDialog)aobj[1];
            s1 = (new StringBuilder("http://www.siriusapplications.com/wikidroidelectionsurvey/redeem.php?survey_id=")).append(Uri.encode(s)).toString();
            JSONObject jsonobject = new JSONObject(new JSONTokener(Utils.slurp((new URL(s1)).openStream())));
            if (!"error".equals(jsonobject.getString("status"))) goto _L2; else goto _L1
_L1:
            String s5;
            String s4 = getString(0x7f0b005b);
            Object aobj1[] = new Object[1];
            aobj1[0] = jsonobject.getString("reason");
            s5 = String.format(s4, aobj1);
            String s2 = s5;
_L4:
            final String _toastText = s2;
            runOnUiThread(progressdialog. new Runnable() {

                final ActivateElectionPlusTask this$1;
                private final String val$_toastText;
                private final ProgressDialog val$dialog;

                public void run()
                {
                    Toast.makeText(_fld0, _toastText, 1).show();
                    dialog.dismiss();
                    updateProFeatures();
                }

            
            {
                this$1 = final_activateelectionplustask;
                _toastText = s;
                dialog = ProgressDialog.this;
                super();
            }
            });
            return null;
_L2:
            boolean flag = "success".equals(jsonobject.getString("status"));
            s2 = null;
            if (!flag)
            {
                continue; /* Loop/switch isn't completed */
            }
            String s3;
            android.content.SharedPreferences.Editor editor = PreferenceManager.getDefaultSharedPreferences(WelcomeActivity.this).edit();
            editor.putBoolean("com.siriusapplications.wikipedia.ProManager.KEY_PRO_ACTIVATED-Please-do-not-change-me-it-would-be-much-appreciated", true);
            editor.commit();
            s3 = getString(0x7f0b005c);
            s2 = s3;
            continue; /* Loop/switch isn't completed */
            Exception exception;
            exception;
            exception.printStackTrace();
            s2 = getString(0x7f0b005a);
            if (true) goto _L4; else goto _L3
_L3:
        }


        private ActivateElectionPlusTask()
        {
            this$0 = WelcomeActivity.this;
            super();
        }

        ActivateElectionPlusTask(ActivateElectionPlusTask activateelectionplustask)
        {
            this();
        }
    }

    public static final class Installer extends Enum
    {

        public static final Installer AMAZON_APPSTORE;
        public static final Installer ANDROID_MARKET;
        public static final Installer DEVICE_BUNDLING_NO_MARKET;
        private static final Installer ENUM$VALUES[];

        public static final Installer getInstaller()
        {
            return ANDROID_MARKET;
        }

        public static Installer valueOf(String s)
        {
            return (Installer)Enum.valueOf(com/isaacwaller/wikipedia/WelcomeActivity$Installer, s);
        }

        public static Installer[] values()
        {
            Installer ainstaller[] = ENUM$VALUES;
            int i = ainstaller.length;
            Installer ainstaller1[] = new Installer[i];
            System.arraycopy(ainstaller, 0, ainstaller1, 0, i);
            return ainstaller1;
        }

        static 
        {
            ANDROID_MARKET = new Installer("ANDROID_MARKET", 0);
            AMAZON_APPSTORE = new Installer("AMAZON_APPSTORE", 1);
            DEVICE_BUNDLING_NO_MARKET = new Installer("DEVICE_BUNDLING_NO_MARKET", 2);
            Installer ainstaller[] = new Installer[3];
            ainstaller[0] = ANDROID_MARKET;
            ainstaller[1] = AMAZON_APPSTORE;
            ainstaller[2] = DEVICE_BUNDLING_NO_MARKET;
            ENUM$VALUES = ainstaller;
        }

        private Installer(String s, int i)
        {
            super(s, i);
        }
    }

    private class WikidroidWebChromeClient extends WebChromeClient
    {

        final WelcomeActivity this$0;

        public void onProgressChanged(WebView webview, int i)
        {
            setProgressBarProgress(i + 50, (new StringBuilder("onProgressChanged ")).append(i).toString());
        }

        public void onReceivedTitle(WebView webview, String s)
        {
            getSupportActionBar().setTitle(Html.fromHtml(s));
        }

        private WikidroidWebChromeClient()
        {
            this$0 = WelcomeActivity.this;
            super();
        }

        WikidroidWebChromeClient(WikidroidWebChromeClient wikidroidwebchromeclient)
        {
            this();
        }
    }

    private class WikidroidWebViewClient extends WebViewClient
    {

        final WelcomeActivity this$0;

        public boolean shouldOverrideUrlLoading(WebView webview, String s)
        {
            Uri uri = Uri.parse(s);
            if ("market.android.com".equals(uri.getAuthority()) || "play.google.com".equals(uri.getAuthority()))
            {
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.addCategory("android.intent.category.BROWSABLE");
                intent.setData(Uri.parse((new StringBuilder("market://details?id=")).append(uri.getQueryParameter("id")).append("&referrer=utm_source%3Dwikidroid%26utm_medium%3Dbanner%26utm_campaign%3Dwikidroid").toString()));
                startActivity(intent);
                return true;
            }
            if ("googleads.g.doubleclick.net".equals(uri.getAuthority()))
            {
                mWebView.loadUrl(uri.toString());
                return true;
            }
            if (uri.getAuthority() != null && (uri.getAuthority().endsWith("wikipedia.org") || uri.getAuthority().endsWith("minecraftwiki.net")))
            {
                loadPage(PageReference.fromUrl(WelcomeActivity.this, uri.toString()));
                return true;
            } else
            {
                Intent intent1 = new Intent("android.intent.action.VIEW");
                intent1.addCategory("android.intent.category.BROWSABLE");
                intent1.setData(Uri.parse(s));
                startActivity(intent1);
                return true;
            }
        }

        private WikidroidWebViewClient()
        {
            this$0 = WelcomeActivity.this;
            super();
        }

        WikidroidWebViewClient(WikidroidWebViewClient wikidroidwebviewclient)
        {
            this();
        }
    }


    private static int $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer[];
    private static final boolean DO_TRACING = false;
    public static final String TAG = "WikidroidWelcomeActivity";
    View adView;
    String languagePartOnLastPause;
    BookmarksFragment mBookmarksFragment;
    PageReference.LoadResult mCurrentPage;
    Timer mHackTimer;
    ArrayList mHistory;
    FrameLayout mMain;
    Menu mMenu;
    ProgressBar mProgressBar;
    QueueFragment mQueueFragment;
    SlidingMenu mSlidingMenu;
    LinearLayout mTitleBar;
    Animation mTitleBarEnterAnim;
    Animation mTitleBarExitAnim;
    boolean mUseEmbedTitleBar;
    WebView mWebView;

    static int[] $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer()
    {
        int ai[] = $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer;
        if (ai != null)
        {
            return ai;
        }
        int ai1[] = new int[Installer.values().length];
        try
        {
            ai1[Installer.AMAZON_APPSTORE.ordinal()] = 2;
        }
        catch (NoSuchFieldError nosuchfielderror) { }
        try
        {
            ai1[Installer.ANDROID_MARKET.ordinal()] = 1;
        }
        catch (NoSuchFieldError nosuchfielderror1) { }
        try
        {
            ai1[Installer.DEVICE_BUNDLING_NO_MARKET.ordinal()] = 3;
        }
        catch (NoSuchFieldError nosuchfielderror2) { }
        $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer = ai1;
        return ai1;
    }

    public WelcomeActivity()
    {
        mWebView = null;
        mTitleBar = null;
        mProgressBar = null;
        mMenu = null;
        mMain = null;
        adView = null;
        mSlidingMenu = null;
        mBookmarksFragment = null;
        mQueueFragment = null;
        mHackTimer = null;
        mTitleBarEnterAnim = null;
        mTitleBarExitAnim = null;
        mUseEmbedTitleBar = false;
        mHistory = new ArrayList();
        mCurrentPage = null;
        languagePartOnLastPause = null;
    }

    private void addBookmark()
    {
        String s = ((PageReference)mHistory.get(-1 + mHistory.size())).toUrl();
        BookmarksDBAdapter bookmarksdbadapter = new BookmarksDBAdapter(this);
        bookmarksdbadapter.open();
        Log.i("WikidroidWelcomeActivity", (new StringBuilder("Saving a bookmark as URL ")).append(s).toString());
        bookmarksdbadapter.addBookmark(this, s, Html.fromHtml(mWebView.getTitle()).toString());
        bookmarksdbadapter.close();
        Toast.makeText(this, 0x7f0b001f, 0).show();
        mBookmarksFragment.refreshBookmarks();
    }

    private void doSearch(String s)
    {
        loadPage(new PageReference(PageReference.PageType.SEARCH_RESULTS, WikiManager.getCurrentWiki(this), s));
    }

    private boolean goBack()
    {
        if (mHistory.size() < 2)
        {
            return false;
        } else
        {
            mHistory.remove(-1 + mHistory.size());
            loadPage((PageReference)mHistory.remove(-1 + mHistory.size()));
            return true;
        }
    }

    private void goHome()
    {
        loadPage(new PageReference(PageReference.PageType.HOME_PAGE, WikiManager.getCurrentWiki(this), null));
    }

    private void loadCurrentPage()
    {
        mWebView.loadDataWithBaseURL(WikiManager.getCurrentWiki(this).getFullScriptPath().toString(), mCurrentPage.html, "text/html", "UTF-8", null);
    }

    private void loadErrorPage()
    {
        mWebView.loadUrl("file:///android_asset/loadingerror.html");
    }

    private void loadPage(final PageReference reference)
    {
        mHistory.add(reference);
        setProgressBarProgress(0, "loadPage");
        mSlidingMenu.showContent();
        updatePageMenu();
        mWebView.loadUrl("about:blank");
        ActionBar actionbar = getSupportActionBar();
        PageReference.PageType pagetype = reference.getType();
        PageReference.PageType pagetype1 = PageReference.PageType.HOME_PAGE;
        boolean flag = false;
        if (pagetype != pagetype1)
        {
            flag = true;
        }
        actionbar.setDisplayHomeAsUpEnabled(flag);
        (new Thread(new Runnable() {

            final WelcomeActivity this$0;
            private final PageReference val$reference;

            public void run()
            {
                try
                {
                    mCurrentPage = reference.loadPage(WelcomeActivity.this);
                    loadCurrentPage();
                    return;
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                }
                loadErrorPage();
            }

            
            {
                this$0 = WelcomeActivity.this;
                reference = pagereference;
                super();
            }
        })).start();
    }

    private void loadRandomPage()
    {
        setProgressBarProgress(25, "loadRandomPage");
        (new Thread(new Runnable() {

            final WelcomeActivity this$0;

            public void run()
            {
                try
                {
                    String s = WikiManager.queryWikiForRandomPage(WikiManager.getCurrentWiki(WelcomeActivity.this));
                    runOnUiThread(s. new Runnable() {

                        final _cls4 this$1;
                        private final String val$randomPage;

                        public void run()
                        {
                            loadPage(new PageReference(PageReference.PageType.WIKI_PAGE, WikiManager.getCurrentWiki(_fld0), randomPage));
                        }

            
            {
                this$1 = final__pcls4;
                randomPage = String.this;
                super();
            }
                    });
                    return;
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                }
                mWebView.loadUrl("file:///android_asset/loadingerror.html");
            }


            
            {
                this$0 = WelcomeActivity.this;
                super();
            }
        })).start();
    }

    private void onLanguageChange()
    {
        String s = PreferenceManager.getDefaultSharedPreferences(this).getString("com.isaacwaller.wikipedia.Language", "en");
        PageReference pagereference = (PageReference)mHistory.get(-1 + mHistory.size());
        PageReference pagereference1 = new PageReference(pagereference.mType, WikiManager.getCurrentWiki(this), pagereference.mData);
        if (pagereference.getType() == PageReference.PageType.WIKI_PAGE && mCurrentPage.langlinks != null && mCurrentPage.langlinks.containsKey(s))
        {
            pagereference1.mData = (String)mCurrentPage.langlinks.get(s);
        }
        loadPage(pagereference1);
    }

    private void openBookmarks()
    {
        mSlidingMenu.showSecondaryMenu();
    }

    private void openSavedPages()
    {
        mSlidingMenu.showSecondaryMenu();
    }

    private void refresh()
    {
        loadPage((PageReference)mHistory.get(-1 + mHistory.size()));
    }

    private void savePage()
    {
        (new Thread(new Runnable() {

            final WelcomeActivity this$0;
            private final ProgressDialog val$progress;

            public void run()
            {
                int ai[] = {
                    0x7f0b003d
                };
                try
                {
                    OfflinePageSaver.savePage(WelcomeActivity.this, (PageReference)mHistory.get(-1 + mHistory.size()));
                }
                catch (OfflinePageSaver.PageAlreadyExistsException pagealreadyexistsexception)
                {
                    pagealreadyexistsexception.printStackTrace();
                    ai[0] = 0x7f0b003a;
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                    ai[0] = 0x7f0b003b;
                }
                runOnUiThread(ai. new Runnable() {

                    final _cls3 this$1;
                    private final ProgressDialog val$progress;
                    private final int val$toastText[];

                    public void run()
                    {
                        progress.dismiss();
                        Toast.makeText(_fld0, toastText[0], 1).show();
                        mBookmarksFragment.refreshPages();
                    }

            
            {
                this$1 = final__pcls3;
                progress = progressdialog;
                toastText = _5B_I.this;
                super();
            }
                });
            }


            
            {
                this$0 = WelcomeActivity.this;
                progress = progressdialog;
                super();
            }
        })).start();
    }

    private void setProgressBarProgress(int i, String s)
    {
        if (i >= 150)
        {
            mProgressBar.setVisibility(4);
            return;
        } else
        {
            mProgressBar.setVisibility(0);
            mProgressBar.setProgress(i);
            return;
        }
    }

    private void setZoomControls()
    {
        mWebView.getSettings().setBuiltInZoomControls(true);
        if (android.os.Build.VERSION.SDK_INT >= 11)
        {
            mWebView.getSettings().setDisplayZoomControls(false);
        }
    }

    private void swapLanguage()
    {
        SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(this);
        String s = sharedpreferences.getString("com.isaacwaller.wikipedia.Language", "en");
        String s1 = sharedpreferences.getString("language2", "en");
        android.content.SharedPreferences.Editor editor = sharedpreferences.edit();
        editor.putString("com.isaacwaller.wikipedia.Language", s1);
        editor.putString("language2", s);
        editor.commit();
        onLanguageChange();
    }

    private void updateInfoMenu()
    {
        boolean flag = ProManager.isPro(this);
        boolean flag1 = PreferenceManager.getDefaultSharedPreferences(this).getBoolean("languageSwapButton", false);
        mMenu.findItem(0x7f060055).setVisible(flag1);
        MenuItem menuitem = mMenu.findItem(0x7f060056);
        boolean flag2 = false;
        if (!flag)
        {
            flag2 = true;
        }
        menuitem.setVisible(flag2);
    }

    private void updatePageMenu()
    {
        boolean flag = true;
        if (mMenu == null)
        {
            return;
        }
        PageReference.PageType pagetype;
        com.actionbarsherlock.view.SubMenu submenu;
        MenuItem menuitem;
        boolean flag1;
        MenuItem menuitem1;
        boolean flag2;
        MenuItem menuitem2;
        boolean flag3;
        MenuItem menuitem3;
        boolean flag4;
        MenuItem menuitem4;
        if (mHistory.size() > 0)
        {
            pagetype = ((PageReference)mHistory.get(-1 + mHistory.size())).getType();
        } else
        {
            pagetype = null;
        }
        submenu = mMenu.findItem(0x7f06004c).getSubMenu();
        menuitem = submenu.findItem(0x7f06004f);
        if (pagetype == PageReference.PageType.WIKI_PAGE)
        {
            flag1 = flag;
        } else
        {
            flag1 = false;
        }
        menuitem.setEnabled(flag1);
        menuitem1 = submenu.findItem(0x7f060052);
        if (pagetype != null)
        {
            flag2 = flag;
        } else
        {
            flag2 = false;
        }
        menuitem1.setEnabled(flag2);
        menuitem2 = submenu.findItem(0x7f06004e);
        if (pagetype == PageReference.PageType.WIKI_PAGE)
        {
            flag3 = flag;
        } else
        {
            flag3 = false;
        }
        menuitem2.setEnabled(flag3);
        menuitem3 = submenu.findItem(0x7f060054);
        if (pagetype == PageReference.PageType.WIKI_PAGE)
        {
            flag4 = flag;
        } else
        {
            flag4 = false;
        }
        menuitem3.setEnabled(flag4);
        menuitem4 = submenu.findItem(0x7f060055);
        if (pagetype == null)
        {
            flag = false;
        }
        menuitem4.setEnabled(flag);
    }

    private void updateProFeatures()
    {
        mWebView.loadUrl((new StringBuilder("javascript:displayAds(")).append(ProManager.isPro(this)).append(");").toString());
        updatelp();
    }

    private void updatelp()
    {
        android.widget.FrameLayout.LayoutParams layoutparams = new android.widget.FrameLayout.LayoutParams(-1, -1);
        int i;
        if (ProManager.isPro(this))
        {
            i = 0;
        } else
        {
            i = 50;
        }
        int _tmp = i + 50;
        layoutparams.topMargin = (int)TypedValue.applyDimension(1, 0.0F, getResources().getDisplayMetrics());
        mWebView.setLayoutParams(layoutparams);
    }

    public void onBookmarkSelected(String s)
    {
        loadPage(PageReference.fromUrl(this, s));
        mSlidingMenu.showContent();
    }

    public void onConfigurationChanged(Configuration configuration)
    {
        super.onConfigurationChanged(configuration);
        mSlidingMenu.setBehindWidthRes(0x7f080015);
    }

    public void onCreate(Bundle bundle)
    {
        super.onCreate(bundle);
        setContentView(0x7f03001d);
        mWebView = new WebView(this);
        mWebView.setWebChromeClient(new WikidroidWebChromeClient(null));
        mWebView.setWebViewClient(new WikidroidWebViewClient(null));
        mWebView.getSettings().setSupportZoom(true);
        setZoomControls();
        mWebView.setScrollBarStyle(0);
        mWebView.setOnLongClickListener(new android.view.View.OnLongClickListener() {

            final WelcomeActivity this$0;

            public boolean onLongClick(View view)
            {
                android.webkit.WebView.HitTestResult hittestresult = mWebView.getHitTestResult();
                if (hittestresult.getType() == 7)
                {
                    String s = hittestresult.getExtra();
                    Uri uri = Uri.parse(s);
                    if (uri.getAuthority().endsWith("wikipedia.org") && ((String)uri.getPathSegments().get(0)).equals("wiki"))
                    {
                        String s1 = HomeScreenShortcutActivity.getArticleNameFromURL(WelcomeActivity.this, uri);
                        Toast.makeText(getApplication(), (new StringBuilder("Added '")).append(s1).append("' to queue.").toString(), 0).show();
                        mQueueFragment.addToQueue(s);
                    }
                    return true;
                } else
                {
                    return false;
                }
            }

            
            {
                this$0 = WelcomeActivity.this;
                super();
            }
        });
        mMain = (FrameLayout)findViewById(0x7f060044);
        WebSettings websettings = mWebView.getSettings();
        websettings.setJavaScriptEnabled(true);
        websettings.setLoadsImagesAutomatically(true);
        websettings.setPluginsEnabled(true);
        mTitleBar = (LinearLayout)View.inflate(this, 0x7f030028, null);
        mMain.addView(mTitleBar);
        mUseEmbedTitleBar = false;
        mProgressBar = (ProgressBar)mTitleBar.findViewById(0x7f060039);
        mProgressBar.setMax(150);
        mTitleBarEnterAnim = AnimationUtils.loadAnimation(this, 0x7f040000);
        mTitleBarExitAnim = AnimationUtils.loadAnimation(this, 0x7f040001);
        mSlidingMenu = new SlidingMenu(this);
        mSlidingMenu.setContent(mWebView);
        mSlidingMenu.setMode(2);
        mSlidingMenu.setTouchModeAbove(0);
        mSlidingMenu.setMenu(0x7f030023);
        mSlidingMenu.setSecondaryMenu(0x7f030024);
        mSlidingMenu.setFadeEnabled(false);
        mSlidingMenu.setBehindWidthRes(0x7f080015);
        mSlidingMenu.setShadowDrawable(0x7f020073);
        mSlidingMenu.setShadowWidthRes(0x7f080016);
        mSlidingMenu.setBehindScrollScale(0.0F);
        mSlidingMenu.setSecondaryShadowDrawable(0x7f020074);
        mMain.addView(mSlidingMenu);
        mBookmarksFragment = new BookmarksFragment();
        getSupportFragmentManager().beginTransaction().replace(0x7f060046, mBookmarksFragment).commit();
        mQueueFragment = new QueueFragment();
        getSupportFragmentManager().beginTransaction().replace(0x7f060045, mQueueFragment).commit();
        if (bundle == null)
        {
            onNewIntent(getIntent());
            return;
        } else
        {
            mCurrentPage = (PageReference.LoadResult)bundle.getSerializable("currentPage");
            mHistory = (ArrayList)bundle.getSerializable("history");
            loadCurrentPage();
            return;
        }
    }

    public boolean onCreateOptionsMenu(Menu menu)
    {
        mMenu = menu;
        getSupportMenuInflater().inflate(0x7f0e0000, menu);
        SearchManager searchmanager = (SearchManager)getSystemService("search");
        SearchView searchview = (SearchView)menu.findItem(0x7f06004b).getActionView();
        if (searchview != null)
        {
            searchview.setSearchableInfo(searchmanager.getSearchableInfo(getComponentName()));
        }
        updatePageMenu();
        updateInfoMenu();
        return true;
    }

    protected void onDestroy()
    {
        super.onDestroy();
    }

    public boolean onKeyDown(int i, KeyEvent keyevent)
    {
        if (i != 4 || keyevent.getRepeatCount() != 0) goto _L2; else goto _L1
_L1:
        if (!mSlidingMenu.isMenuShowing()) goto _L4; else goto _L3
_L3:
        mSlidingMenu.showContent();
_L5:
        return true;
_L4:
        if (!goBack())
        {
            finish();
        }
        if (true) goto _L5; else goto _L2
_L2:
        return false;
    }

    public boolean onKeyUp(int i, KeyEvent keyevent)
    {
        if (i == 82 && keyevent.getRepeatCount() == 0)
        {
            mMenu.performIdentifierAction(0x7f06004c, 0);
            return true;
        } else
        {
            return super.onKeyUp(i, keyevent);
        }
    }

    protected void onNewIntent(Intent intent)
    {
        super.onNewIntent(intent);
        if (intent.getAction() == null || "android.intent.action.MAIN".equals(intent.getAction()))
        {
            boolean flag = PreferenceManager.getDefaultSharedPreferences(this).getBoolean("loadHomePage", true);
            if (mHistory.isEmpty() && flag)
            {
                loadPage(new PageReference(PageReference.PageType.HOME_PAGE, WikiManager.getCurrentWiki(this), null));
            }
        } else
        {
            if ("android.intent.action.SEARCH".equals(intent.getAction()))
            {
                doSearch(intent.getStringExtra("query"));
                return;
            }
            if (intent.getData() != null && "com.isaacwaller.wikipedia".equals(intent.getData().getScheme()))
            {
                if ("redeem_election_survey_code".equals(intent.getData().getHost()))
                {
                    ProgressDialog progressdialog = new ProgressDialog(this);
                    progressdialog.setTitle(0x7f0b0058);
                    progressdialog.setMessage(getString(0x7f0b0059));
                    progressdialog.show();
                    ActivateElectionPlusTask activateelectionplustask = new ActivateElectionPlusTask(null);
                    Object aobj[] = new Object[2];
                    aobj[0] = intent.getData().getQueryParameter("id");
                    aobj[1] = progressdialog;
                    activateelectionplustask.execute(aobj);
                    return;
                } else
                {
                    Log.e("WikidroidWelcomeActivity", (new StringBuilder("Unknown URI: ")).append(intent.getData()).toString());
                    return;
                }
            }
            if ("android.intent.action.VIEW".equals(intent.getAction()))
            {
                try
                {
                    loadPage(PageReference.fromUrl(this, intent.getData()));
                    return;
                }
                catch (Exception exception)
                {
                    exception.printStackTrace();
                }
                loadErrorPage();
                return;
            }
        }
    }

    public boolean onOptionsItemSelected(MenuItem menuitem)
    {
        super.onOptionsItemSelected(menuitem);
        menuitem.getItemId();
        JVM INSTR lookupswitch 13: default 128
    //                   16908332: 130
    //                   2131099723: 148
    //                   2131099725: 130
    //                   2131099726: 136
    //                   2131099727: 366
    //                   2131099728: 142
    //                   2131099729: 167
    //                   2131099730: 155
    //                   2131099731: 161
    //                   2131099732: 176
    //                   2131099733: 273
    //                   2131099734: 296
    //                   2131099735: 279;
           goto _L1 _L2 _L3 _L2 _L4 _L5 _L6 _L7 _L8 _L9 _L10 _L11 _L12 _L13
_L1:
        return false;
_L2:
        goHome();
        return true;
_L4:
        addBookmark();
        return true;
_L6:
        openBookmarks();
        return true;
_L3:
        onSearchRequested();
        return true;
_L8:
        refresh();
        return true;
_L9:
        loadRandomPage();
        return true;
_L7:
        mSlidingMenu.showMenu();
        return true;
_L10:
        String s1 = (new StringBuilder(String.valueOf(getString(0x7f0b0012)))).append(((PageReference)mHistory.get(-1 + mHistory.size())).toUrl()).toString();
        Intent intent = new Intent("android.intent.action.SEND");
        intent.setType("text/plain");
        intent.putExtra("android.intent.extra.TEXT", s1);
        startActivity(Intent.createChooser(intent, getString(0x7f0b0011)));
        return true;
_L11:
        swapLanguage();
        return true;
_L13:
        startActivity(new Intent(this, com/isaacwaller/wikipedia/PreferencesActivity));
        return true;
_L12:
        $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer()[Installer.getInstaller().ordinal()];
        JVM INSTR tableswitch 1 2: default 328
    //                   1 359
    //                   2 352;
           goto _L14 _L15 _L16
_L14:
        String s = "";
_L17:
        startActivity(new Intent("android.intent.action.VIEW", Uri.parse(s)));
        return true;
_L16:
        s = "http://www.amazon.com/gp/mas/dl/android/com.isaacwaller.wikipedia.plus";
          goto _L17
_L15:
        s = "market://details?id=com.isaacwaller.wikipedia.plus";
          goto _L17
_L5:
        savePage();
        return true;
    }

    public void onPageSelected(File file)
    {
        loadPage(PageReference.fromUrl(this, Uri.fromFile(new File((new StringBuilder(String.valueOf(file.getAbsolutePath()))).append("/page.html").toString()))));
        mSlidingMenu.showContent();
    }

    protected void onPause()
    {
        super.onPause();
        if (mHackTimer != null)
        {
            mHackTimer.cancel();
            mHackTimer = null;
        }
        languagePartOnLastPause = PreferenceManager.getDefaultSharedPreferences(this).getString("com.isaacwaller.wikipedia.Language", "en");
    }

    public boolean onPrepareOptionsMenu(Menu menu)
    {
        super.onPrepareOptionsMenu(menu);
        return true;
    }

    public void onQueueItemSelected(String s)
    {
        loadPage(PageReference.fromUrl(this, s));
        mSlidingMenu.showContent();
    }

    protected void onResume()
    {
        super.onResume();
        updateProFeatures();
        SharedPreferences sharedpreferences = PreferenceManager.getDefaultSharedPreferences(this);
        boolean flag = sharedpreferences.getBoolean("com.isaacwaller.wikipedia.KeepScreenOn", false);
        boolean flag1 = sharedpreferences.getBoolean("com.isaacwaller.wikipedia.FullScreen", false);
        String s = sharedpreferences.getString("com.isaacwaller.wikipedia.Language", "en");
        Window window = getWindow();
        if (flag)
        {
            window.addFlags(128);
        } else
        {
            window.clearFlags(128);
        }
        if (flag1)
        {
            window.addFlags(1024);
        } else
        {
            window.clearFlags(1024);
        }
        if (languagePartOnLastPause != null && !languagePartOnLastPause.equals(s))
        {
            onLanguageChange();
        }
        if (mMenu != null)
        {
            updateInfoMenu();
        }
        if (android.os.Build.VERSION.SDK_INT <= 10)
        {
            mHackTimer = new Timer();
            mHackTimer.scheduleAtFixedRate(new TimerTask() {

                final WelcomeActivity this$0;

                public void run()
                {
                    mSlidingMenu.postInvalidate();
                }

            
            {
                this$0 = WelcomeActivity.this;
                super();
            }
            }, 0L, 11L);
        }
    }

    protected void onSaveInstanceState(Bundle bundle)
    {
        super.onSaveInstanceState(bundle);
        bundle.putSerializable("currentPage", mCurrentPage);
        bundle.putSerializable("history", mHistory);
        byte byte0;
        if (mSlidingMenu.isMenuShowing())
        {
            if (mSlidingMenu.isSecondaryMenuShowing())
            {
                byte0 = 2;
            } else
            {
                byte0 = 1;
            }
        } else
        {
            byte0 = 0;
        }
        bundle.putSerializable("sliderState", Integer.valueOf(byte0));
    }





}
