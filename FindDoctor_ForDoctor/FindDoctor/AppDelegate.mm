//
//  AppDelegate.m
//  CollegeUnion
//
//  Created by li na on 15/2/17.
//  Copyright (c) 2015年 li na. All rights reserved.
//

#import "AppDelegate.h"
#import "SNTabViewController.h"
#import "AppCore.h"
#import "CUUIContant.h"
//#import "BMapKit.h"
#import "CUUserManager.h"

//#import "UMSocial.h"
//#import "UMSocialWechatHandler.h"
//#import "UMSocialQQHandler.h"
//#import "UMSocialSinaHandler.h"
//#import "UMSocialSinaSSOHandler.h"

//#import "MobClick.h"
#import "CUShareConstant.h"

#import "SNTabBarItem.h"
#import "UIConstants.h"

#import "SNIntroduceView.h"
#import "CUPlatFormManager.h"

#import "CurrentTreatmentViewController.h"
#import "CurrentTreatmentListModel.h"
#import "HomeViewController.h"
#import "UserViewController.h"

#import "OrderManager+ThirdPay.h"

#import "LoginViewController.h"
#import "LoginView.h"
#import "JSONKit.h"


@interface AppDelegate ()
//<BMKGeneralDelegate>

@property (nonatomic,strong)SNTabViewController * tabController;


@end

@implementation AppDelegate
{
//    BMKMapManager *_mapManager;
//    BMKLocationService *_locService;
//    BMKGeoCodeSearch   *_geoSearcher;
    BOOL isLogin;
    NSOperationQueue *_myQueue;
}

+ (AppDelegate *)app
{
    return (AppDelegate *)([UIApplication sharedApplication].delegate);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[AppCore sharedInstance] load];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(IOS_7_0)) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self postRequestVersionCheck];
    
    // TODO:暂时关闭基础组件
    // 地图
    //[self initMapService];
    
    // 统计
    //[MobClick startWithAppkey:UmengAppkey reportPolicy:BATCH channelId:kChannelID];
    //[MobClick setAppVersion:[CUPlatFormManager currentAppVersion]];
    
    // 分享
    //[self initShare];
    
    // 主页面
    [self launchFirstView];
    
    // 版本号
    [[CUPlatFormManager sharedInstance] sychronizeVersion];
    
    [self.window makeKeyAndVisible];
    
    return YES;

}

- (void)initShare
{
//    // 友盟分享
//    [UMSocialData setAppKey:UmengAppkey];
//    
//    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatSession,UMShareToWechatTimeline]];
//    [UMSocialConfig setFinishToastIsHidden:YES position:UMSocialiToastPositionCenter];
//    
//    //设置微信AppId，设置分享url，默认使用友盟的网址
//    [UMSocialWechatHandler setWXAppId:@"wx2bdc2e8d006e143a" appSecret:@"98ab890642e1bb1144334ab140abb1cd" url:kAppShareURL];
//    
//    //打开新浪微博的SSO开关
//    //[UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
//    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
//    
//    //设置分享到QQ空间的应用Id，和分享url 链接
//    [UMSocialQQHandler setQQWithAppId:@"1104732674" appKey:@"hskafPocswDChVyA" url:kAppShareURL];
//    //设置支持没有客户端情况下使用SSO授权
//    [UMSocialQQHandler setSupportWebView:YES];
//    
//    [UMSocialConfig setNavigationBarConfig:^(UINavigationBar *bar,
//                                             UIButton *closeButton,
//                                             UIButton *backButton,
//                                             UIButton *postButton,
//                                             UIButton *refreshButton,
//                                             UINavigationItem * navigationItem){
//        bar.frame = CGRectMake(0, 0, kScreenWidth, kNavigationHeight);
//        
//        if ([bar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
//            [bar setBackgroundImage:[UIImage imageNamed:ImgStr_NavBackground] forBarMetrics:UIBarMetricsDefault];
//        }
//        
//        [closeButton setImage:[UIImage imageNamed:imgStr_CloseBtn] forState:UIControlStateNormal];
//        [backButton setImage:[UIImage imageNamed:ImgStr_BackBtn] forState:UIControlStateNormal];
//        
//        [postButton setImage:nil forState:UIControlStateNormal];
//        [postButton setTitle:@"发送" forState:UIControlStateNormal];
//        [postButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        
//        [refreshButton setImage:nil forState:UIControlStateNormal];
//        refreshButton.userInteractionEnabled = NO;
//        
//        UILabel *titleLabel = (id)navigationItem.titleView;
//        if ([titleLabel isKindOfClass:[UILabel class]]) {
//            titleLabel.textColor = [UIColor whiteColor];
//        }
//        
//        UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]
//                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
//                                           target:nil action:nil];
//        leftSpacer.width = -15;
//        
//        if (navigationItem.leftBarButtonItems.count == 1) {
//            navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:leftSpacer, [navigationItem.leftBarButtonItems objectAtIndex:0], nil];
//        }
//    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    [_locService stopUserLocationService];
    
    [[AppCore sharedInstance] save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
//    [_locService startUserLocationService];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)launchFirstView
{
    // 启动画面->新手引导->主页面
    // 新安装
//    if (0 && [CUPlatFormManager sharedInstance].isNewInstall)
//    {
//        [self launchIntroduceView];
//    }
//    else
//    {
//    if ([[CUUserManager sharedInstance] isLogin]) {
//        isLogin = YES;
//    }else   {
//        isLogin = NO;
//    }
    [self launchMainView];
//    }
}

//- (void)changeRootView
//{
//    isLogin = YES;
//    [self launchMainView];
//}

- (void)launchMainView
{
    
    if (![[CUUserManager sharedInstance] isLogin]) {
        LoginViewController *loginviewcontroller = [[LoginViewController alloc] init];
        loginviewcontroller.hasNavigationBar = NO;
        self.window.rootViewController = loginviewcontroller;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginSuccess" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(launchMainView) name:@"loginSuccess" object:nil];
        return;
    }
    //showStatusBar
    if (!SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(IOS_7_0))
    {
        [UIApplication sharedApplication].statusBarHidden = NO;
    }
    
    self.slideNaviController = [[SNSlideNavigationController alloc] initWithRootViewController:[self createTabBarController]];
    self.window.rootViewController = self.slideNaviController;

    return;
}


- (void)launchIntroduceView
{
    [SNIntroduceView showWithComplete:^(SNIntroduceView *introduceView){
        [self launchMainView];
    }];
}


- (SNTabViewController*)createTabBarController
{
    CurrentTreatmentListModel *currentTreatmentListModel = [[CurrentTreatmentListModel alloc] initWithSortType:CurrentTreatmentSortTypetime];
    CurrentTreatmentListViewController *treatmentVC = [[CurrentTreatmentListViewController alloc]initWithPageName:@"CurrentTreatmentListViewController" listModel:currentTreatmentListModel];
//    CurrentTreatmentViewController *treatmentVC = [[CurrentTreatmentViewController alloc] initWithPageName:@"CurrentTreatmentViewController"];
    treatmentVC.customTabBarItem = [self tabBarItemAtIndex:0];
    
    HomeViewController *homeVC = [[HomeViewController alloc] initWithPageName:@"HomeViewController"];
    homeVC.customTabBarItem = [self tabBarItemAtIndex:1];
    
    UserViewController *userVC = [[UserViewController alloc] initWithPageName:@"UserViewController"];
    userVC.customTabBarItem = [self tabBarItemAtIndex:2];
    
    self.tabController = [[SNTabViewController alloc] initWithHeight:Height_Tabbar];
    self.tabController.viewControllers = @[treatmentVC,homeVC,userVC];
    
    self.tabController.selectedIndex = 1;
    self.tabController.customTabBar.selectedIndex = 1;
    

    
    return self.tabController;

}


- (SNTabBarItem *)tabBarItemAtIndex:(int)index
{
    NSArray *titles = @[@"诊疗",@"首页",@"我"];
    NSArray *norIcons = @[@"button_diagnosis_noselect",@"button_head_noselect",@"button_my_noselect"];
//    NSArray *hilIcons = @[@"tabbar_icon_home_highlighted",@"tabbar_icon_service_highlighted",@"tabbar_icon_discount_highlighted",@"tabbar_icon_mine_highlighted"];
   NSArray *selIcons = @[@"button_diagnosis_select",@"button_head_select",@"button_my_select"];
    
    float tabBarWidth = kScreenWidth / titles.count;
    SNTabBarItem *customTabBarItem = [[SNTabBarItem alloc] initWithFrame:CGRectMake(tabBarWidth * index, 0, tabBarWidth, Height_Tabbar)];
    customTabBarItem.image = [UIImage imageNamed:[norIcons objectAtIndex:index]];
//    customTabBarItem.highlightedImage = [UIImage imageNamed:[hilIcons objectAtIndex:index]];
    customTabBarItem.selectedImage = [UIImage imageNamed:[selIcons objectAtIndex:index]];
        
//    customTabBarItem.titleEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
//    customTabBarItem.title = [titles objectAtIndex:index];
//    customTabBarItem.titleColor = UIColorFromHex(0xabaeb2);
//    customTabBarItem.selectedTitleColor = kDarkBlueColor;


    return customTabBarItem;
}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    if ([[CUOrderManager sharedInstance] isThirdPayURL:url]) {
//        [[CUOrderManager sharedInstance] handleThirdPayOpenURL:url];
//    }
//    
//    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
//}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    if ([[CUOrderManager sharedInstance] isThirdPayURL:url]) {
//        [[CUOrderManager sharedInstance] handleThirdPayOpenURL:url];
//    }
//    
//    return  [UMSocialSnsService handleOpenURL:url wxApiDelegate:nil];
//}

#pragma mark - BMKMapManager Delegate

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}

#pragma mark - MKMapView Delegate
//
//处理位置坐标更新
//- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
//{
//    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//    if (userLocation) {
//        NSString *baiduLat = [[NSString alloc] initWithFormat:@"%f",userLocation.location.coordinate.latitude];
//        
//        NSString *baiduLng = [[NSString alloc] initWithFormat:@"%f",userLocation.location.coordinate.longitude];
//        NSLog(@"x=%@,y=%@",baiduLat,baiduLng);
//        [[NSUserDefaults standardUserDefaults] setObject:baiduLat forKey:@"lat"];
//        [[NSUserDefaults standardUserDefaults] setObject:baiduLng forKey:@"lng"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//        [_locService stopUserLocationService];
//        
//        BMKReverseGeoCodeOption *option = [[BMKReverseGeoCodeOption alloc] init];
//        option.reverseGeoPoint = userLocation.location.coordinate;
//        [_geoSearcher reverseGeoCode:option];
//    }
//}
//
//- (void)didFailToLocateUserWithError:(NSError *)error
//{}
//
//- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
//{
//    if (error == BMK_SEARCH_NO_ERROR) {
//        NSString *cityName = [result.addressDetail.city stringByReplacingOccurrencesOfString:@"市" withString:@""];
//        NSLog(@"当前城市是 %@", cityName);
//    }
//    else {
//        NSLog(@"抱歉，未找到结果");
//    }
//}
//
//- (void)initMapService
//{
//    // 要使用百度地图，请先启动BaiduMapManager
//    // com.wallet.BaiduFinance iECHAdtn1ql3FlkGKasXyGbs
//    // com.jiayu.eshijia hm8ufnt0raPVEUrMRSdrb8qq
//    _mapManager = [[BMKMapManager alloc]init];
//    BOOL ret = [_mapManager start:@"iECHAdtn1ql3FlkGKasXyGbs" generalDelegate:self];
//    if (!ret) {
//        NSLog(@"manager start failed!");
//    }
//    
//    //初始化BMKLocationService
//    _locService = [[BMKLocationService alloc]init];
//    _locService.delegate = (id)self;
//    
//    _geoSearcher = [[BMKGeoCodeSearch alloc]init];
//    _geoSearcher.delegate = (id)self;
//}

#pragma mark --------- 临时 ---------

//版本检查
- (void)postRequestVersionCheck{
    
    NSURL* url = [NSURL URLWithString:@"http://www.uyi365.com/baseFrame/base/g_VersionCheck.jmw?from=APP_IOS_DOCTOR"];
    NSMutableURLRequest * postRequest=[NSMutableURLRequest requestWithURL:url];
    
    [postRequest setHTTPMethod:@"GET"];
    [postRequest setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    postRequest.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    __block __weak typeof(self) weakSelf = self;

    _myQueue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:postRequest queue:_myQueue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            if (!connectionError) {
                NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
                NSDictionary * dataDict = [dict dictionaryForKeySafely:@"data"];
                NSString * appVersion = [dataDict stringForKeySafely:@"name"];
                NSInteger forceupdate = [[dataDict objectForKeySafely:@"forceupdate"] integerValue];
                NSString * message = [dataDict stringForKeySafely:@"message"];
                //必要更新
                if (forceupdate == 1) {
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:weakSelf cancelButtonTitle:@"退出" otherButtonTitles:@"下载", nil];
                    alert.tag = 10000;
                    alert.delegate = self;
                    [alert show];
                }
                //非必要更新
                else{
                    if([weakSelf checkIfNeedUpdateWithAppVersion:appVersion]){
                        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil message:message delegate:weakSelf cancelButtonTitle:@"取消" otherButtonTitles:@"下载", nil];
                        alert.tag = 20000;
                        alert.delegate = self;
                        [alert show];
                    }else{
                        return ;
                    }
                    
                }
            }else{
                return ;
            }
    }];
}

//比较版本号，检查是否更新
- (BOOL)checkIfNeedUpdateWithAppVersion : (NSString *)appVersion{
    NSInteger oldVer =  [CUPlatFormManager appVersionNumInBundle];
    NSInteger newVer =  [CUPlatFormManager changeVersionFromStringToInt:appVersion];
    if (newVer > oldVer) {
        return YES;
    }
    return NO;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self exitApp];
    }
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id1090790909"]];
    }
}

//退出APP
- (void)exitApp{
    [UIView animateWithDuration:0.4f animations:^{
        self.window.alpha = 0;
        CGFloat y = self.window.bounds.size.height;
        CGFloat x = self.window.bounds.size.width / 2;
        self.window.frame = CGRectMake(x, y, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
}


@end
