//
//  UIWindow+Extension.m
//  许微博
//
//  Created by 许继广 on 15/12/15.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "XUTabBarViewController.h"
#import "XUNewfeatureViewController.h"

@implementation UIWindow (Extension)
+(void)switchRootViewController
{
    //获取储存在沙盒中得版本号
    NSString *version = [[NSUserDefaults standardUserDefaults]objectForKey:@"CFBundleVersion"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //当前软件的版本从info.plist中取
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDictionary[@"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
    [[NSUserDefaults standardUserDefaults]synchronize];//赶紧写入
    if ([version isEqualToString:currentVersion]) {
        UITabBarController *tabBarVC =  [[XUTabBarViewController alloc]init];
        window.rootViewController  = tabBarVC;
    }else {
        window.rootViewController = [[XUNewfeatureViewController alloc]init];
    }

}
@end
