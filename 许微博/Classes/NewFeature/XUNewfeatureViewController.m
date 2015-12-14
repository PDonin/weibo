//
//  XUNewfeatureViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/8.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUNewfeatureViewController.h"
#import "XUTabBarViewController.h"
#define  PAGENUM 4

@interface XUNewfeatureViewController () <UIScrollViewDelegate>
@property(nonatomic, weak) UIPageControl *pageControl;
@property(nonatomic, weak) UIScrollView *scrollView;
@end

@implementation XUNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
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
        if (i == PAGENUM - 1) {
            [self setUpLastImageView:imgView];
        }
        
        [scrollView addSubview:imgView];
    }
    
    //pageControl
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

-(void)setUpLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    //checkBox利用按钮实现
    UIButton *shareBtn = [[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 150;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开始微博" forState:UIControlStateNormal];

    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = imageView.width * 0.5;
    startBtn.centerY = imageView.height * 0.75;
    
    [startBtn addTarget:self action:@selector(startBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    [imageView addSubview:startBtn];
    
    
}

-(void)startBtnClick:(UIButton *)sender
{
    /*
     1.push
     2.modal
     3.切换窗口控制器:切换window的rootViewController
     */
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = [[XUTabBarViewController alloc]init];
}

-(void)shareBtnClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
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
