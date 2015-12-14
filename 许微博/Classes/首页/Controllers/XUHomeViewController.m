//
//  XUHomeViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/5.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUHomeViewController.h"
#import "XUDropdownMenu.h"
#import "XUTitleMenuViewController.h"
@interface XUHomeViewController () <XUDropdownMenuDelegate>

@end

@implementation XUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *leftItem = [UIBarButtonItem buttonItemWithImage:@"navigationbar_friendsearch" selectedImage:@"navigationbar_friendsearch_highlighted" target:nil selector:nil];
    UIBarButtonItem *rightItem = [UIBarButtonItem buttonItemWithImage:@"navigationbar_pop" selectedImage:@"navigationbar_pop_highlighted" target:nil selector:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.width = 150;
    titleBtn.height = 30;
    [titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    titleBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 100, 0, 0);
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 50);
    
    [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;
}

-(void)titleClick:(UIButton *)sender
{
    XUDropdownMenu *menu = [XUDropdownMenu menu];
    XUTitleMenuViewController *menuVc = [[XUTitleMenuViewController alloc]init];
    menuVc.view.height =44 *3;
    menuVc.view.width = 150;
    menu.contentController = menuVc;
    menu.delegate = self;
    UIButton *btn = (UIButton *)self.navigationItem.titleView;
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [menu showFrom:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

-(void)dropdownMenuDismiss:(XUDropdownMenu *)dropdownMenu
{
    UIButton *btn = (UIButton *)self.navigationItem.titleView;
    [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

@end
