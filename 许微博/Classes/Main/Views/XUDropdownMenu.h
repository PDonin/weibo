//
//  XUDropdownMenu.h
//  许微博
//
//  Created by 许继广 on 15/12/7.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XUDropdownMenu;
@protocol XUDropdownMenuDelegate <NSObject>
@optional
-(void)dropdownMenuDismiss:(XUDropdownMenu *)dropdownMenu;
@end
@interface XUDropdownMenu : UIView
@property(nonatomic, strong)UIView *content;//内容
@property(nonatomic, strong)UIViewController *contentController;
@property(nonatomic, weak) id<XUDropdownMenuDelegate> delegate;
+(instancetype)menu;
-(void)show;
-(void)dismiss;
-(void)showFrom:(UIView *)from;
@end
