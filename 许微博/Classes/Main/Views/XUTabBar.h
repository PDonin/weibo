//
//  XUTabBar.h
//  许微博
//
//  Created by 许继广 on 15/12/8.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XUTabBar;
@protocol XUTabBarDelegate <UITabBarDelegate>
@optional
-(void)tabBarDidClickPlusButton:(XUTabBar *)tabBar;
@end
@interface XUTabBar : UITabBar
@property (nonatomic , weak) id<XUTabBarDelegate> delegate;
@end
