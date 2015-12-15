//
//  AppDelegate.m
//  许微博
//
//  Created by 许继广 on 15/12/4.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "AppDelegate.h"


#import "XUTabBarViewController.h"
#import <objc/runtime.h>
#import "XUNewfeatureViewController.h"
#import "XUOAuthViewController.h"
#import "XUAccount.h"
#import "XUAccountManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    XUAccount *account = [XUAccountManager account];
    
    if (account == nil) {
        self.window.rootViewController = [[XUOAuthViewController alloc]init];
    } else {
        
        //获取储存在沙盒中得版本号
        NSString *version = [[NSUserDefaults standardUserDefaults]objectForKey:@"CFBundleVersion"];
        
        //当前软件的版本从info.plist中取
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *currentVersion = infoDictionary[@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults]synchronize];//赶紧写入
        if ([version isEqualToString:currentVersion]) {
            UITabBarController *tabBarVC =  [[XUTabBarViewController alloc]init];
            self.window.rootViewController  = tabBarVC;
        }else {
            self.window.rootViewController = [[XUNewfeatureViewController alloc]init];
        }
    }
    
    /*
    */

    [self.window makeKeyAndVisible];
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
