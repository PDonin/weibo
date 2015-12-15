//
//  UIBarButtonItem+Extension.h
//  许微博
//
//  Created by 许继广 on 15/12/15.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(instancetype)buttonItemWithImage:(NSString *)image selectedImage:(NSString *)selectedImage target:(id)target selector:(SEL)selector;
@end
