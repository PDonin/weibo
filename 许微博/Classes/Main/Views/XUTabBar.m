//
//  XUTabBar.m
//  许微博
//
//  Created by 许继广 on 15/12/8.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUTabBar.h"
@interface XUTabBar ()
@property(nonatomic, weak)UIButton *plusButton;
@end

@implementation XUTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"]forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
        plusButton.size = plusButton.currentBackgroundImage.size;
        
        _plusButton = plusButton;
        
        [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:plusButton];
    }
    return self;
}

-(void)plusClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    XULog(@"%@",self.subviews);
    _plusButton.centerX = self.width * 0.5;
    _plusButton.centerY = self.height * 0.5;
    CGFloat tabBarButtonW = self.width / 5;
    CGFloat tabBarButtonIndex = 0;
    for (UIView *childView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([childView isKindOfClass:class]) {
            childView.width = tabBarButtonW;
            childView.x = tabBarButtonIndex * tabBarButtonW;
            tabBarButtonIndex ++;
            if (tabBarButtonIndex == 2) {
                tabBarButtonIndex ++;
            }
        }
    }
}

@end
