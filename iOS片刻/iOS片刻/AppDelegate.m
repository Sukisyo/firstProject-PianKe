//
//  AppDelegate.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"
#import "PKLeftMenuViewController.h"
#import "PKHomeViewController.h"
#import "PKSuiPianViewController.h"
#import "PKBaseViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[PKHomeViewController alloc] init]];
    PKLeftMenuViewController *leftMenuViewController = [[PKLeftMenuViewController alloc] init];

    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navigationController
                                                                    leftMenuViewController:leftMenuViewController                   rightMenuViewController:nil];
    
    
    sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
//    sideMenuViewController.delegate = self;
//    sideMenuViewController.contentViewShadowColor = [UIColor blackColor];
//    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
//    sideMenuViewController.contentViewShadowOpacity = 0.6;
//    sideMenuViewController.contentViewShadowRadius = 12;
//    sideMenuViewController.contentViewShadowEnabled = YES;
    sideMenuViewController.contentViewScaleValue = 1;//缩放比列
    sideMenuViewController.contentViewInPortraitOffsetCenterX = VIEW_WIDTH / 2 - 45;//偏移量
    sideMenuViewController.bouncesHorizontally = NO;

    
    self.window.rootViewController = sideMenuViewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"passwd"]&&[[NSUserDefaults standardUserDefaults] valueForKey:@"email"]) {
    /**
     *  登录
     */
    NSDictionary *dic = @{@"auth" : @"",
                          @"client" : @"1",
                          @"deviceid" : @"D34C5085-30AE-4EA6-9E06-BA5B0C841EDA",
                          @"email" : [[NSUserDefaults standardUserDefaults] valueForKey:@"email"],
                          @"passwd" :[[NSUserDefaults standardUserDefaults] valueForKey:@"passwd"],
                          @"version" : @"3.0.6"};
        
    [leftMenuViewController POSTHttpRequest:@"http://api2.pianke.me/user/login" dic:dic successBalck:^(id JSON) {
        NSDictionary *dic = JSON[@"data"];
        if ([JSON[@"result"] integerValue]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                                [leftMenuViewController changeMineInfo:[NSURL URLWithString:dic[@"icon"]] coverimg:[NSURL URLWithString:dic[@"coverimg"]] uname:dic[@"uname"]];
                });
        }
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
