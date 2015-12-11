//
//  XUNewfeatureViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/8.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUNewfeatureViewController.h"
#define  PAGENUM 4

@interface XUNewfeatureViewController () <UIScrollViewDelegate>
@property(nonatomic, weak) UIPageControl *pageControl;
@property(nonatomic, weak) UIScrollView *scrollView;
@end

@implementation XUNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XULog(@"viewDidLoad");
   
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width * PAGENUM, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    //添加图片到scrollView
    for (int i = 0; i < PAGENUM; i++) {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:scrollView.bounds];
        NSString *imgName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imgView.image = [UIImage imageNamed:imgName];
        imgView.x = i * scrollView.bounds.size.width;
        [scrollView addSubview:imgView];
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.width = 100;
    pageControl.centerX = self.view.centerX;
    pageControl.centerY = CGRectGetMaxY(self.view.frame) - 50;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    pageControl.numberOfPages = PAGENUM;
    self.pageControl = pageControl;
    
    pageControl.userInteractionEnabled = NO;
    
    [self.view addSubview:pageControl];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.scrollView.contentOffset.x;
    int index = (int)(offset / self.scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = index;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
