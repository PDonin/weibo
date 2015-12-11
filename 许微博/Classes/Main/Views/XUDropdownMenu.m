//
//  XUDropdownMenu.m
//  许微博
//
//  Created by 许继广 on 15/12/7.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUDropdownMenu.h"

@interface XUDropdownMenu ()
@property(nonatomic, weak) UIImageView *containerView;
@end

@implementation XUDropdownMenu

-(void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    self.content = contentController.view;
}

-(void)setContent:(UIView *)content
{
    _content = content;
    
    _content.x = 10;
    _content.y = 15;
    
    self.containerView.width = _content.width + 2 * content.x;
    self.containerView.height = CGRectGetMaxY(content.frame) + 10;
    
    [self.containerView addSubview:content];
}

-(UIImageView *)containerView
{
    if (_containerView == nil) {
        UIImageView *containerView = [[UIImageView alloc]init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
        self.containerView = containerView;
        
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];

    }
    return _containerView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)show
{
    //显示在最上面的窗口
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    //设置尺寸
    self.frame = window.bounds;
}

-(void)showFrom:(UIView *)from
{
    [self show];
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    //默认情况下控件的frame是相对于父控件
    //需要进行坐标转换
    CGRect newRect = [from.superview convertRect:from.frame toView:window];
    //newRect = [from convertRect:from.bounds toView:window];
    
    self.containerView.centerX = CGRectGetMidX(newRect);
    self.containerView.y = CGRectGetMaxY(newRect);
}

-(void)dismiss
{
    [self removeFromSuperview];
    if ([self.delegate respondsToSelector:@selector(dropdownMenuDismiss:)]) {
        [self.delegate dropdownMenuDismiss:self];
    }
}

+(instancetype)menu
{
    return [[self alloc]init];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

@end
