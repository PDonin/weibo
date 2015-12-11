//
//  XUNavigationController.m
//  许微博
//
//  Created by 许继广 on 15/12/7.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUNavigationController.h"

@implementation XUNavigationController

+(void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName:[UIColor orangeColor],
                           NSFontAttributeName:[UIFont systemFontOfSize:12]
                           };
    [item setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    NSDictionary *disable_dict = @{
                           NSForegroundColorAttributeName:[UIColor grayColor],
                           NSFontAttributeName:[UIFont systemFontOfSize:12]
                           };
    [item setTitleTextAttributes:disable_dict forState:UIControlStateDisabled];
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 1) {
        //rootViewController需要显示底部栏
        viewController.hidesBottomBarWhenPushed = YES; //底部栏不显示
        
        UIBarButtonItem *leftItem = [UIBarButtonItem buttonItemWithImage:@"navigationbar_back" selectedImage:@"navigationbar_back_highlighted" target:self selector:nil];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
}

@end
