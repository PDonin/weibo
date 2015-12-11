//
//  XUself.m
//  许微博
//
//  Created by 许继广 on 15/12/7.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUSearchBar.h"

@implementation XUSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索";
        
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        
        leftView.size = CGSizeMake(30, 30);
        leftView.contentMode = UIViewContentModeCenter;

        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)searchBar
{
    return [[self alloc]init];
}
@end
