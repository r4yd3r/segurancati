.class public Lcom/isaacwaller/wikipedia/WelcomeActivity;
.super Lcom/actionbarsherlock/app/SherlockFragmentActivity;
.source "WelcomeActivity.java"

# interfaces
.implements Lcom/isaacwaller/wikipedia/BookmarksFragment$OnBookmarkSelectedListener;
.implements Lcom/isaacwaller/wikipedia/QueueFragment$OnQueueItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;,
        Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;,
        Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;,
        Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer:[I = null

.field private static final DO_TRACING:Z = false

.field public static final TAG:Ljava/lang/String; = "WikidroidWelcomeActivity"


# instance fields
.field adView:Landroid/view/View;

.field languagePartOnLastPause:Ljava/lang/String;

.field mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

.field mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

.field mHackTimer:Ljava/util/Timer;

.field mHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/isaacwaller/wikipedia/PageReference;",
            ">;"
        }
    .end annotation
.end field

.field mMain:Landroid/widget/FrameLayout;

.field mMenu:Lcom/actionbarsherlock/view/Menu;

.field mProgressBar:Landroid/widget/ProgressBar;

.field mQueueFragment:Lcom/isaacwaller/wikipedia/QueueFragment;

.field mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

.field mTitleBar:Landroid/widget/LinearLayout;

.field mTitleBarEnterAnim:Landroid/view/animation/Animation;

.field mTitleBarExitAnim:Landroid/view/animation/Animation;

.field mUseEmbedTitleBar:Z

.field mWebView:Landroid/webkit/WebView;


# direct methods
.method static synthetic $SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer()[I
    .locals 3

    .prologue
    .line 58
    sget-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->$SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer:[I

    if-eqz v0, :cond_0

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->values()[Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->AMAZON_APPSTORE:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_1
    :try_start_1
    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ANDROID_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_2
    :try_start_2
    sget-object v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->DEVICE_BUNDLING_NO_MARKET:Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_3
    sput-object v0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->$SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer:[I

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 58
    invoke-direct {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;-><init>()V

    .line 72
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    .line 73
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBar:Landroid/widget/LinearLayout;

    .line 74
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    .line 75
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    .line 76
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMain:Landroid/widget/FrameLayout;

    .line 77
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->adView:Landroid/view/View;

    .line 78
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    .line 79
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    .line 80
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mQueueFragment:Lcom/isaacwaller/wikipedia/QueueFragment;

    .line 81
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    .line 83
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBarEnterAnim:Landroid/view/animation/Animation;

    .line 84
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBarExitAnim:Landroid/view/animation/Animation;

    .line 86
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mUseEmbedTitleBar:Z

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    .line 89
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    .line 180
    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->languagePartOnLastPause:Ljava/lang/String;

    .line 58
    return-void
.end method

.method static synthetic access$0(Lcom/isaacwaller/wikipedia/WelcomeActivity;ILjava/lang/String;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 109
    invoke-direct {p0, p1, p2}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->setProgressBarProgress(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic access$1(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/PageReference;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 611
    invoke-direct {p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    return-void
.end method

.method static synthetic access$2(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 225
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updateProFeatures()V

    return-void
.end method

.method static synthetic access$3(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 637
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadCurrentPage()V

    return-void
.end method

.method static synthetic access$4(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 606
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadErrorPage()V

    return-void
.end method

.method private addBookmark()V
    .locals 5

    .prologue
    .line 590
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-virtual {v2}, Lcom/isaacwaller/wikipedia/PageReference;->toUrl()Ljava/lang/String;

    move-result-object v1

    .line 591
    .local v1, url:Ljava/lang/String;
    new-instance v0, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    invoke-direct {v0, p0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;-><init>(Landroid/content/Context;)V

    .line 592
    .local v0, adapter:Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->open()Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;

    .line 594
    const-string v2, "WikidroidWelcomeActivity"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Saving a bookmark as URL "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 596
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v2}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Spanned;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v1, v2}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->addBookmark(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)J

    .line 597
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/BookmarksDBAdapter;->close()V

    .line 599
    const v2, 0x7f0b001f

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 600
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    invoke-virtual {v2}, Lcom/isaacwaller/wikipedia/BookmarksFragment;->refreshBookmarks()V

    .line 601
    return-void
.end method

.method private doSearch(Ljava/lang/String;)V
    .locals 3
    .parameter "query"

    .prologue
    .line 354
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->SEARCH_RESULTS:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    .line 355
    invoke-static {p0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    .line 356
    invoke-direct {v0, v1, v2, p1}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    .line 354
    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 357
    return-void
.end method

.method private goBack()Z
    .locals 2

    .prologue
    .line 753
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    const/4 v0, 0x0

    .line 757
    :goto_0
    return v0

    .line 755
    :cond_0
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 756
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 757
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private goHome()V
    .locals 4

    .prologue
    .line 761
    new-instance v0, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v1, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 762
    return-void
.end method

.method private loadCurrentPage()V
    .locals 6

    .prologue
    .line 638
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v1

    invoke-virtual {v1}, Lcom/isaacwaller/wikipedia/newloader/Wiki;->getFullScriptPath()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    .line 639
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    iget-object v2, v2, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->html:Ljava/lang/String;

    .line 640
    const-string v3, "text/html"

    const-string v4, "UTF-8"

    const/4 v5, 0x0

    .line 638
    invoke-virtual/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    return-void
.end method

.method private loadErrorPage()V
    .locals 2

    .prologue
    .line 607
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    const-string v1, "file:///android_asset/loadingerror.html"

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 608
    return-void
.end method

.method private loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V
    .locals 4
    .parameter "reference"

    .prologue
    const/4 v0, 0x0

    .line 612
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 613
    const-string v1, "loadPage"

    invoke-direct {p0, v0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->setProgressBarProgress(ILjava/lang/String;)V

    .line 614
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v1}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 616
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updatePageMenu()V

    .line 618
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    const-string v2, "about:blank"

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 619
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSupportActionBar()Lcom/actionbarsherlock/app/ActionBar;

    move-result-object v1

    invoke-virtual {p1}, Lcom/isaacwaller/wikipedia/PageReference;->getType()Lcom/isaacwaller/wikipedia/PageReference$PageType;

    move-result-object v2

    sget-object v3, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-eq v2, v3, :cond_0

    const/4 v0, 0x1

    :cond_0
    invoke-virtual {v1, v0}, Lcom/actionbarsherlock/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 621
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;

    invoke-direct {v1, p0, p1}, Lcom/isaacwaller/wikipedia/WelcomeActivity$5;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/PageReference;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 634
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 635
    return-void
.end method

.method private loadRandomPage()V
    .locals 2

    .prologue
    .line 568
    const/16 v0, 0x19

    const-string v1, "loadRandomPage"

    invoke-direct {p0, v0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->setProgressBarProgress(ILjava/lang/String;)V

    .line 570
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;

    invoke-direct {v1, p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$4;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 586
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 587
    return-void
.end method

.method private onLanguageChange()V
    .locals 6

    .prologue
    .line 232
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "com.isaacwaller.wikipedia.Language"

    const-string v5, "en"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 234
    .local v1, languagePart:Ljava/lang/String;
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/PageReference;

    .line 235
    .local v0, currentPage:Lcom/isaacwaller/wikipedia/PageReference;
    new-instance v2, Lcom/isaacwaller/wikipedia/PageReference;

    iget-object v3, v0, Lcom/isaacwaller/wikipedia/PageReference;->mType:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v4

    .line 236
    iget-object v5, v0, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    .line 235
    invoke-direct {v2, v3, v4, v5}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    .line 238
    .local v2, newPage:Lcom/isaacwaller/wikipedia/PageReference;
    invoke-virtual {v0}, Lcom/isaacwaller/wikipedia/PageReference;->getType()Lcom/isaacwaller/wikipedia/PageReference$PageType;

    move-result-object v3

    sget-object v4, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    iget-object v3, v3, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->langlinks:Ljava/util/Map;

    if-eqz v3, :cond_0

    .line 239
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    iget-object v3, v3, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->langlinks:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 240
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    iget-object v3, v3, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;->langlinks:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, v2, Lcom/isaacwaller/wikipedia/PageReference;->mData:Ljava/lang/String;

    .line 243
    :cond_0
    invoke-direct {p0, v2}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 244
    return-void
.end method

.method private openBookmarks()V
    .locals 1

    .prologue
    .line 522
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showSecondaryMenu()V

    .line 523
    return-void
.end method

.method private openSavedPages()V
    .locals 1

    .prologue
    .line 526
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showSecondaryMenu()V

    .line 527
    return-void
.end method

.method private refresh()V
    .locals 2

    .prologue
    .line 561
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 562
    return-void
.end method

.method private savePage()V
    .locals 3

    .prologue
    .line 530
    const v1, 0x7f0b003e

    invoke-virtual {p0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0b003f

    invoke-virtual {p0, v2}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/app/ProgressDialog;

    move-result-object v0

    .line 532
    .local v0, progress:Landroid/app/ProgressDialog;
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;

    invoke-direct {v2, p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$3;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Landroid/app/ProgressDialog;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 557
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 558
    return-void
.end method

.method private setProgressBarProgress(ILjava/lang/String;)V
    .locals 2
    .parameter "newProgress"
    .parameter "tag"

    .prologue
    .line 111
    const/16 v0, 0x96

    if-lt p1, v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 117
    :goto_0
    return-void

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 115
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_0
.end method

.method private setZoomControls()V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 398
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 400
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    .line 401
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebSettings;->setDisplayZoomControls(Z)V

    .line 403
    :cond_0
    return-void
.end method

.method private swapLanguage()V
    .locals 6

    .prologue
    .line 247
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 248
    .local v3, prefs:Landroid/content/SharedPreferences;
    const-string v4, "com.isaacwaller.wikipedia.Language"

    const-string v5, "en"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 249
    .local v2, languagePart:Ljava/lang/String;
    const-string v4, "language2"

    const-string v5, "en"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 251
    .local v0, altLanguagePart:Ljava/lang/String;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 252
    .local v1, edit:Landroid/content/SharedPreferences$Editor;
    const-string v4, "com.isaacwaller.wikipedia.Language"

    invoke-interface {v1, v4, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 253
    const-string v4, "language2"

    invoke-interface {v1, v4, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 254
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 256
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->onLanguageChange()V

    .line 257
    return-void
.end method

.method private updateInfoMenu()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 677
    invoke-static {p0}, Lcom/isaacwaller/wikipedia/ProManager;->isPro(Landroid/content/Context;)Z

    move-result v0

    .line 678
    .local v0, isPro:Z
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v4, "languageSwapButton"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    .line 680
    .local v1, shouldShowLanguageSwap:Z
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    const v4, 0x7f060055

    invoke-interface {v3, v4}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/actionbarsherlock/view/MenuItem;->setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 681
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    const v4, 0x7f060056

    invoke-interface {v3, v4}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v3

    if-eqz v0, :cond_0

    :goto_0
    invoke-interface {v3, v2}, Lcom/actionbarsherlock/view/MenuItem;->setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 682
    return-void

    .line 681
    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private updatePageMenu()V
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 660
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    if-nez v2, :cond_0

    .line 673
    :goto_0
    return-void

    .line 664
    :cond_0
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-virtual {v2}, Lcom/isaacwaller/wikipedia/PageReference;->getType()Lcom/isaacwaller/wikipedia/PageReference$PageType;

    move-result-object v0

    .line 666
    .local v0, pageType:Lcom/isaacwaller/wikipedia/PageReference$PageType;
    :goto_1
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    const v5, 0x7f06004c

    invoke-interface {v2, v5}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Lcom/actionbarsherlock/view/MenuItem;->getSubMenu()Lcom/actionbarsherlock/view/SubMenu;

    move-result-object v1

    .line 668
    .local v1, subMenu:Lcom/actionbarsherlock/view/Menu;
    const v2, 0x7f06004f

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v5

    sget-object v2, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-ne v0, v2, :cond_2

    move v2, v3

    :goto_2
    invoke-interface {v5, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 669
    const v2, 0x7f060052

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v5

    if-eqz v0, :cond_3

    move v2, v3

    :goto_3
    invoke-interface {v5, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 670
    const v2, 0x7f06004e

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v5

    sget-object v2, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-ne v0, v2, :cond_4

    move v2, v3

    :goto_4
    invoke-interface {v5, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 671
    const v2, 0x7f060054

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v5

    sget-object v2, Lcom/isaacwaller/wikipedia/PageReference$PageType;->WIKI_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    if-ne v0, v2, :cond_5

    move v2, v3

    :goto_5
    invoke-interface {v5, v2}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    .line 672
    const v2, 0x7f060055

    invoke-interface {v1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v2

    if-eqz v0, :cond_6

    :goto_6
    invoke-interface {v2, v3}, Lcom/actionbarsherlock/view/MenuItem;->setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;

    goto :goto_0

    .line 664
    .end local v0           #pageType:Lcom/isaacwaller/wikipedia/PageReference$PageType;
    .end local v1           #subMenu:Lcom/actionbarsherlock/view/Menu;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    .restart local v0       #pageType:Lcom/isaacwaller/wikipedia/PageReference$PageType;
    .restart local v1       #subMenu:Lcom/actionbarsherlock/view/Menu;
    :cond_2
    move v2, v4

    .line 668
    goto :goto_2

    :cond_3
    move v2, v4

    .line 669
    goto :goto_3

    :cond_4
    move v2, v4

    .line 670
    goto :goto_4

    :cond_5
    move v2, v4

    .line 671
    goto :goto_5

    :cond_6
    move v3, v4

    .line 672
    goto :goto_6
.end method

.method private updateProFeatures()V
    .locals 3

    .prologue
    .line 226
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "javascript:displayAds("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/ProManager;->isPro(Landroid/content/Context;)Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 228
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updatelp()V

    .line 229
    return-void
.end method

.method private updatelp()V
    .locals 5

    .prologue
    const/4 v2, -0x1

    .line 645
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 646
    .local v0, lp:Landroid/widget/FrameLayout$LayoutParams;
    invoke-static {p0}, Lcom/isaacwaller/wikipedia/ProManager;->isPro(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v1, v2, 0x32

    .line 647
    .local v1, totalHeight:I
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    invoke-static {v2, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 648
    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v2, v0}, Landroid/webkit/WebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 649
    return-void

    .line 646
    .end local v1           #totalHeight:I
    :cond_0
    const/16 v2, 0x32

    goto :goto_0
.end method


# virtual methods
.method public onBookmarkSelected(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 791
    invoke-static {p0, p1}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Ljava/lang/String;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 792
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 793
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .parameter "newConfig"

    .prologue
    .line 516
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 518
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v1, 0x7f080015

    invoke-virtual {v0, v1}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindWidthRes(I)V

    .line 519
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .parameter "savedInstanceState"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 412
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 413
    const v1, 0x7f03001d

    invoke-virtual {p0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->setContentView(I)V

    .line 421
    new-instance v1, Landroid/webkit/WebView;

    invoke-direct {v1, p0}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    .line 422
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;

    invoke-direct {v2, p0, v5}, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebChromeClient;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 423
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;

    invoke-direct {v2, p0, v5}, Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$WikidroidWebViewClient;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 424
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 425
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->setZoomControls()V

    .line 426
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v3}, Landroid/webkit/WebView;->setScrollBarStyle(I)V

    .line 427
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    new-instance v2, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;

    invoke-direct {v2, p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$2;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 455
    const v1, 0x7f060044

    invoke-virtual {p0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMain:Landroid/widget/FrameLayout;

    .line 457
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .line 458
    .local v0, settings:Landroid/webkit/WebSettings;
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 459
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setLoadsImagesAutomatically(Z)V

    .line 460
    invoke-virtual {v0, v4}, Landroid/webkit/WebSettings;->setPluginsEnabled(Z)V

    .line 464
    const v1, 0x7f030028

    invoke-static {p0, v1, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBar:Landroid/widget/LinearLayout;

    .line 465
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMain:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBar:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 468
    iput-boolean v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mUseEmbedTitleBar:Z

    .line 470
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBar:Landroid/widget/LinearLayout;

    const v2, 0x7f060039

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    .line 471
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v2, 0x96

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setMax(I)V

    .line 473
    const/high16 v1, 0x7f04

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBarEnterAnim:Landroid/view/animation/Animation;

    .line 474
    const v1, 0x7f040001

    invoke-static {p0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mTitleBarExitAnim:Landroid/view/animation/Animation;

    .line 477
    new-instance v1, Lcom/slidingmenu/lib/SlidingMenu;

    invoke-direct {v1, p0}, Lcom/slidingmenu/lib/SlidingMenu;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    .line 478
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mWebView:Landroid/webkit/WebView;

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setContent(Landroid/view/View;)V

    .line 480
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setMode(I)V

    .line 481
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v1, v3}, Lcom/slidingmenu/lib/SlidingMenu;->setTouchModeAbove(I)V

    .line 482
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f030023

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setMenu(I)V

    .line 483
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f030024

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setSecondaryMenu(I)V

    .line 484
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v1, v3}, Lcom/slidingmenu/lib/SlidingMenu;->setFadeEnabled(Z)V

    .line 485
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f080015

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindWidthRes(I)V

    .line 486
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f020073

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowDrawable(I)V

    .line 487
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f080016

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setShadowWidthRes(I)V

    .line 488
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setBehindScrollScale(F)V

    .line 489
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    const v2, 0x7f020074

    invoke-virtual {v1, v2}, Lcom/slidingmenu/lib/SlidingMenu;->setSecondaryShadowDrawable(I)V

    .line 490
    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMain:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 492
    new-instance v1, Lcom/isaacwaller/wikipedia/BookmarksFragment;

    invoke-direct {v1}, Lcom/isaacwaller/wikipedia/BookmarksFragment;-><init>()V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    .line 493
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 494
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 495
    const v2, 0x7f060046

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mBookmarksFragment:Lcom/isaacwaller/wikipedia/BookmarksFragment;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 496
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 498
    new-instance v1, Lcom/isaacwaller/wikipedia/QueueFragment;

    invoke-direct {v1}, Lcom/isaacwaller/wikipedia/QueueFragment;-><init>()V

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mQueueFragment:Lcom/isaacwaller/wikipedia/QueueFragment;

    .line 499
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    .line 500
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 501
    const v2, 0x7f060045

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mQueueFragment:Lcom/isaacwaller/wikipedia/QueueFragment;

    invoke-virtual {v1, v2, v3}, Landroid/support/v4/app/FragmentTransaction;->replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    .line 502
    invoke-virtual {v1}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    .line 504
    if-nez p1, :cond_0

    .line 505
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 512
    :goto_0
    return-void

    .line 508
    :cond_0
    const-string v1, "currentPage"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    .line 509
    const-string v1, "history"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    .line 510
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadCurrentPage()V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    .line 362
    iput-object p1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    .line 364
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSupportMenuInflater()Lcom/actionbarsherlock/view/MenuInflater;

    move-result-object v2

    const/high16 v3, 0x7f0e

    invoke-virtual {v2, v3, p1}, Lcom/actionbarsherlock/view/MenuInflater;->inflate(ILcom/actionbarsherlock/view/Menu;)V

    .line 367
    const-string v2, "search"

    invoke-virtual {p0, v2}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/SearchManager;

    .line 368
    .local v0, searchManager:Landroid/app/SearchManager;
    const v2, 0x7f06004b

    invoke-interface {p1, v2}, Lcom/actionbarsherlock/view/Menu;->findItem(I)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v2

    invoke-interface {v2}, Lcom/actionbarsherlock/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/actionbarsherlock/widget/SearchView;

    .line 369
    .local v1, searchView:Lcom/actionbarsherlock/widget/SearchView;
    if-eqz v1, :cond_0

    .line 374
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    .line 371
    invoke-virtual {v0, v2}, Landroid/app/SearchManager;->getSearchableInfo(Landroid/content/ComponentName;)Landroid/app/SearchableInfo;

    move-result-object v2

    .line 369
    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/widget/SearchView;->setSearchableInfo(Landroid/app/SearchableInfo;)V

    .line 378
    :cond_0
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updatePageMenu()V

    .line 379
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updateInfoMenu()V

    .line 381
    const/4 v2, 0x1

    return v2
.end method

.method protected onDestroy()V
    .locals 0

    .prologue
    .line 388
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onDestroy()V

    .line 393
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 766
    const/4 v0, 0x4

    if-ne p1, v0, :cond_2

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_2

    .line 767
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->isMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 768
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 772
    :cond_0
    :goto_0
    const/4 v0, 0x1

    .line 774
    :goto_1
    return v0

    .line 769
    :cond_1
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->goBack()Z

    move-result v0

    if-nez v0, :cond_0

    .line 770
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->finish()V

    goto :goto_0

    .line 774
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 3
    .parameter "keyCode"
    .parameter "event"

    .prologue
    .line 780
    const/16 v0, 0x52

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 781
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    const v1, 0x7f06004c

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/actionbarsherlock/view/Menu;->performIdentifierAction(II)Z

    .line 782
    const/4 v0, 0x1

    .line 785
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 10
    .parameter "intent"

    .prologue
    const/4 v7, 0x0

    const/4 v9, 0x1

    .line 261
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 271
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    const-string v4, "android.intent.action.MAIN"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 279
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 280
    .local v3, prefs:Landroid/content/SharedPreferences;
    const-string v4, "loadHomePage"

    invoke-interface {v3, v4, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 282
    .local v2, loadHomePage:Z
    iget-object v4, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 283
    if-eqz v2, :cond_1

    .line 284
    new-instance v4, Lcom/isaacwaller/wikipedia/PageReference;

    sget-object v5, Lcom/isaacwaller/wikipedia/PageReference$PageType;->HOME_PAGE:Lcom/isaacwaller/wikipedia/PageReference$PageType;

    invoke-static {p0}, Lcom/isaacwaller/wikipedia/newloader/WikiManager;->getCurrentWiki(Landroid/content/Context;)Lcom/isaacwaller/wikipedia/newloader/Wiki;

    move-result-object v6

    invoke-direct {v4, v5, v6, v7}, Lcom/isaacwaller/wikipedia/PageReference;-><init>(Lcom/isaacwaller/wikipedia/PageReference$PageType;Lcom/isaacwaller/wikipedia/newloader/Wiki;Ljava/lang/String;)V

    invoke-direct {p0, v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 310
    .end local v2           #loadHomePage:Z
    .end local v3           #prefs:Landroid/content/SharedPreferences;
    :cond_1
    :goto_0
    return-void

    .line 286
    :cond_2
    const-string v4, "android.intent.action.SEARCH"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 288
    const-string v4, "query"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->doSearch(Ljava/lang/String;)V

    goto :goto_0

    .line 289
    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_5

    const-string v4, "com.isaacwaller.wikipedia"

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 290
    const-string v4, "redeem_election_survey_code"

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 292
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 293
    .local v0, dialog:Landroid/app/ProgressDialog;
    const v4, 0x7f0b0058

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setTitle(I)V

    .line 294
    const v4, 0x7f0b0059

    invoke-virtual {p0, v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 295
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 297
    new-instance v4, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;

    invoke-direct {v4, p0, v7}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;)V

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v7

    const-string v8, "id"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    aput-object v0, v5, v9

    invoke-virtual {v4, v5}, Lcom/isaacwaller/wikipedia/WelcomeActivity$ActivateElectionPlusTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 299
    .end local v0           #dialog:Landroid/app/ProgressDialog;
    :cond_4
    const-string v4, "WikidroidWelcomeActivity"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Unknown URI: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 301
    :cond_5
    const-string v4, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 303
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Landroid/net/Uri;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 304
    :catch_0
    move-exception v1

    .line 306
    .local v1, e:Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 307
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadErrorPage()V

    goto/16 :goto_0
.end method

.method public onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
    .locals 7
    .parameter "item"

    .prologue
    const/4 v4, 0x1

    .line 686
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    .line 688
    invoke-interface {p1}, Lcom/actionbarsherlock/view/MenuItem;->getItemId()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    .line 746
    const/4 v3, 0x0

    :goto_0
    return v3

    .line 691
    :sswitch_0
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->goHome()V

    move v3, v4

    .line 692
    goto :goto_0

    .line 694
    :sswitch_1
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->addBookmark()V

    move v3, v4

    .line 695
    goto :goto_0

    .line 697
    :sswitch_2
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->openBookmarks()V

    move v3, v4

    .line 698
    goto :goto_0

    .line 700
    :sswitch_3
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->onSearchRequested()Z

    move v3, v4

    .line 701
    goto :goto_0

    .line 703
    :sswitch_4
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->refresh()V

    move v3, v4

    .line 704
    goto :goto_0

    .line 706
    :sswitch_5
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadRandomPage()V

    move v3, v4

    .line 707
    goto :goto_0

    .line 709
    :sswitch_6
    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v3}, Lcom/slidingmenu/lib/SlidingMenu;->showMenu()V

    move v3, v4

    .line 710
    goto :goto_0

    .line 712
    :sswitch_7
    new-instance v5, Ljava/lang/StringBuilder;

    const v3, 0x7f0b0012

    invoke-virtual {p0, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/isaacwaller/wikipedia/PageReference;

    invoke-virtual {v3}, Lcom/isaacwaller/wikipedia/PageReference;->toUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 713
    .local v1, shareString:Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v3, "android.intent.action.SEND"

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 714
    .local v0, intent:Landroid/content/Intent;
    const-string v3, "text/plain"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 715
    const-string v3, "android.intent.extra.TEXT"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 717
    const v3, 0x7f0b0011

    invoke-virtual {p0, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    move v3, v4

    .line 718
    goto :goto_0

    .line 720
    .end local v0           #intent:Landroid/content/Intent;
    .end local v1           #shareString:Ljava/lang/String;
    :sswitch_8
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->swapLanguage()V

    move v3, v4

    .line 721
    goto :goto_0

    .line 723
    :sswitch_9
    new-instance v3, Landroid/content/Intent;

    const-class v5, Lcom/isaacwaller/wikipedia/PreferencesActivity;

    invoke-direct {v3, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    move v3, v4

    .line 724
    goto/16 :goto_0

    .line 726
    :sswitch_a
    const/4 v2, 0x0

    .line 728
    .local v2, url:Ljava/lang/String;
    invoke-static {}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->$SWITCH_TABLE$com$isaacwaller$wikipedia$WelcomeActivity$Installer()[I

    move-result-object v3

    invoke-static {}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->getInstaller()Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;

    move-result-object v5

    invoke-virtual {v5}, Lcom/isaacwaller/wikipedia/WelcomeActivity$Installer;->ordinal()I

    move-result v5

    aget v3, v3, v5

    packed-switch v3, :pswitch_data_0

    .line 736
    const-string v2, ""

    .line 739
    :goto_1
    new-instance v3, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v3, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v3}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->startActivity(Landroid/content/Intent;)V

    move v3, v4

    .line 740
    goto/16 :goto_0

    .line 730
    :pswitch_0
    const-string v2, "http://www.amazon.com/gp/mas/dl/android/com.isaacwaller.wikipedia.plus"

    .line 731
    goto :goto_1

    .line 733
    :pswitch_1
    const-string v2, "market://details?id=com.isaacwaller.wikipedia.plus"

    .line 734
    goto :goto_1

    .line 742
    .end local v2           #url:Ljava/lang/String;
    :sswitch_b
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->savePage()V

    move v3, v4

    .line 743
    goto/16 :goto_0

    .line 688
    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f06004b -> :sswitch_3
        0x7f06004d -> :sswitch_0
        0x7f06004e -> :sswitch_1
        0x7f06004f -> :sswitch_b
        0x7f060050 -> :sswitch_2
        0x7f060051 -> :sswitch_6
        0x7f060052 -> :sswitch_4
        0x7f060053 -> :sswitch_5
        0x7f060054 -> :sswitch_7
        0x7f060055 -> :sswitch_8
        0x7f060056 -> :sswitch_a
        0x7f060057 -> :sswitch_9
    .end sparse-switch

    .line 728
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPageSelected(Ljava/io/File;)V
    .locals 3
    .parameter "file"

    .prologue
    .line 807
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/page.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Landroid/net/Uri;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 808
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 809
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 170
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onPause()V

    .line 172
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 173
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 174
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    .line 177
    :cond_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "com.isaacwaller.wikipedia.Language"

    const-string v2, "en"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->languagePartOnLastPause:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 653
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z

    .line 655
    const/4 v0, 0x1

    return v0
.end method

.method public onQueueItemSelected(Ljava/lang/String;)V
    .locals 1
    .parameter "url"

    .prologue
    .line 814
    invoke-static {p0, p1}, Lcom/isaacwaller/wikipedia/PageReference;->fromUrl(Landroid/content/Context;Ljava/lang/String;)Lcom/isaacwaller/wikipedia/PageReference;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->loadPage(Lcom/isaacwaller/wikipedia/PageReference;)V

    .line 815
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->showContent()V

    .line 816
    return-void
.end method

.method protected onResume()V
    .locals 11

    .prologue
    const/16 v3, 0x400

    const/16 v2, 0x80

    const/4 v1, 0x0

    .line 184
    invoke-super {p0}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onResume()V

    .line 186
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updateProFeatures()V

    .line 189
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v9

    .line 190
    .local v9, prefs:Landroid/content/SharedPreferences;
    const-string v0, "com.isaacwaller.wikipedia.KeepScreenOn"

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .line 191
    .local v7, keepScreenOn:Z
    const-string v0, "com.isaacwaller.wikipedia.FullScreen"

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    .line 192
    .local v6, fullscreen:Z
    const-string v0, "com.isaacwaller.wikipedia.Language"

    const-string v1, "en"

    invoke-interface {v9, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 194
    .local v8, languagePart:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->getWindow()Landroid/view/Window;

    move-result-object v10

    .line 196
    .local v10, window:Landroid/view/Window;
    if-eqz v7, :cond_3

    invoke-virtual {v10, v2}, Landroid/view/Window;->addFlags(I)V

    .line 199
    :goto_0
    if-eqz v6, :cond_4

    invoke-virtual {v10, v3}, Landroid/view/Window;->addFlags(I)V

    .line 202
    :goto_1
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->languagePartOnLastPause:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->languagePartOnLastPause:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 203
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->onLanguageChange()V

    .line 207
    :cond_0
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mMenu:Lcom/actionbarsherlock/view/Menu;

    if-eqz v0, :cond_1

    .line 208
    invoke-direct {p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity;->updateInfoMenu()V

    .line 211
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-gt v0, v1, :cond_2

    .line 212
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    .line 213
    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHackTimer:Ljava/util/Timer;

    new-instance v1, Lcom/isaacwaller/wikipedia/WelcomeActivity$1;

    invoke-direct {v1, p0}, Lcom/isaacwaller/wikipedia/WelcomeActivity$1;-><init>(Lcom/isaacwaller/wikipedia/WelcomeActivity;)V

    .line 221
    const-wide/16 v2, 0x0

    const-wide/16 v4, 0xb

    .line 213
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 223
    :cond_2
    return-void

    .line 197
    :cond_3
    invoke-virtual {v10, v2}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_0

    .line 200
    :cond_4
    invoke-virtual {v10, v3}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_1
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .parameter "outState"

    .prologue
    .line 797
    invoke-super {p0, p1}, Lcom/actionbarsherlock/app/SherlockFragmentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 799
    const-string v0, "currentPage"

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mCurrentPage:Lcom/isaacwaller/wikipedia/PageReference$LoadResult;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 800
    const-string v0, "history"

    iget-object v1, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 801
    const-string v1, "sliderState"

    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->isMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/isaacwaller/wikipedia/WelcomeActivity;->mSlidingMenu:Lcom/slidingmenu/lib/SlidingMenu;

    invoke-virtual {v0}, Lcom/slidingmenu/lib/SlidingMenu;->isSecondaryMenuShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 802
    return-void

    .line 801
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
