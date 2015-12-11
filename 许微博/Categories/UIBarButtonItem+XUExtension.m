//
//  UIBarButtonItem+XUExtension.m
//  许微博
//
//  Created by 许继广 on 15/12/7.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "UIBarButtonItem+XUExtension.h"

@implementation UIBarButtonItem (XUExtension)

+(instancetype)buttonItemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIImage *nor_img = [UIImage imageNamed:image];
    UIImage *sel_img = [UIImage imageNamed:selectedImage];
    [btn setBackgroundImage:nor_img forState:UIControlStateNormal];
    [btn setBackgroundImage:sel_img forState:UIControlStateSelected];
    btn.size = nor_img.size;
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn];
    return item;

}
@end
