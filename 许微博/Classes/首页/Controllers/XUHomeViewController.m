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
#import "AFNetworking.h"
#import "XUAccountManager.h"
#import "XUAccount.h"
#import "XUTitleButton.h"

@interface XUHomeViewController () <XUDropdownMenuDelegate>

@end

@implementation XUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setupNav];
    //获取用户昵称
    [self setupUserInfo];
}

-(void)setupUserInfo
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    XUAccount *account = [XUAccountManager account];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"access_token"] = account.access_token;
    params[@"uid"] = account.uid;
    
    [manager GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        NSString *name = responseObject[@"name"];
        account.name = name;
        //因为这里不是创建account，但是调用了saveAccount，所以创建时间不能在saveAccount中调用
        [XUAccountManager saveAccount:account];
        
        UIButton *button = (UIButton *)self.navigationItem.titleView;
        [button setTitle:name forState:UIControlStateNormal];

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        XULog(@"%@",error);
    }];
}
-(void)setupNav
{
    UIBarButtonItem *leftItem = [UIBarButtonItem buttonItemWithImage:@"navigationbar_friendsearch" selectedImage:@"navigationbar_friendsearch_highlighted" target:nil selector:nil];
    UIBarButtonItem *rightItem = [UIBarButtonItem buttonItemWithImage:@"navigationbar_pop" selectedImage:@"navigationbar_pop_highlighted" target:nil selector:nil];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    XUTitleButton *titleBtn = [[XUTitleButton alloc]init];
    
    
    NSString *name = [XUAccountManager account].name;
    [titleBtn setTitle:name?name:@"首页" forState:UIControlStateNormal];
    
    
/*
    
    //如果imageW返回的是点坐标的值，所以要根据屏幕设置
    CGFloat imageW = titleBtn.imageView.width * [UIScreen mainScreen].scale;
    CGFloat titleW = titleBtn.titleLabel.width * [UIScreen mainScreen].scale;
    CGFloat left = titleW + imageW;

    
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, titleW, 0, 0);
*/
    [titleBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleBtn;

}
-(void)titleClick:(UIButton *)sender
{
    sender.selected = !sender.isSelected;
    
    XUDropdownMenu *menu = [XUDropdownMenu menu];
    XUTitleMenuViewController *menuVc = [[XUTitleMenuViewController alloc]init];
    menuVc.view.height =44 *3;
    menuVc.view.width = 150;
    menu.contentController = menuVc;
    menu.delegate = self;
    
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
