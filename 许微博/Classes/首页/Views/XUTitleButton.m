//
//  XUTitleButton.m
//  许微博
//
//  Created by 许继广 on 15/12/16.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUTitleButton.h"

@implementation XUTitleButton
-(void)layoutSubviews
{
    [super layoutSubviews];
    /**
     这两句代码比设置titleRect和imageRect不知道高到哪里去了！！！
     */
    self.titleLabel.x = self.imageView.x;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}
@end
