//
//  XUTabBarViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/5.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUTabBarViewController.h"
#import "XUHomeViewController.h"
#import "XUMessageCenterViewController.h"
#import "XUDiscoverViewController.h"
#import "XUProfileViewController.h"
#import "XUNavigationController.h"
#import "XUTabBar.h"

@interface XUTabBarViewController () <XUTabBarDelegate>

@end

@implementation XUTabBarViewController

-(void)tabBarDidClickPlusButton:(XUTabBar *)tabBar
{
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    XUHomeViewController *home =[[XUHomeViewController alloc]init];
    [self addChildVc:home title:@"主页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    XUMessageCenterViewController *messageCenter = [[XUMessageCenterViewController alloc]init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    XUDiscoverViewController *discover = [[XUDiscoverViewController alloc]init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    XUProfileViewController *profile = [[XUProfileViewController alloc]init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    //不能用self.tabBar = [XUTabBar alloc]init]
    //因为tabBar的属性是只读的
    XUTabBar *tabBar = [[XUTabBar alloc]init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
}


-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selected =[UIImage imageNamed:selectedImage];
    childVc.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDictionary *textAttr = @{
                               NSForegroundColorAttributeName:XUColor(113, 113, 113)
                               };
    [childVc.tabBarItem setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    NSDictionary *selectedTextAttr = @{
                                       NSForegroundColorAttributeName:[UIColor orangeColor]
                                       };
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttr forState:UIControlStateSelected];

    XUNavigationController *navVc = [[XUNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:navVc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
