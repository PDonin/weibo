//
//  XUDiscoverViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/5.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUDiscoverViewController.h"
#import "XUSearchBar.h"

@interface XUDiscoverViewController ()

@end

@implementation XUDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UISearchBar *searchBar = [[UISearchBar alloc]init];
//    searchBar.scopeBarBackgroundImage = [UIImage imageNamed:@"searchbar_textfield_background"];
    
    XUSearchBar *searchBar = [XUSearchBar searchBar];
    
    searchBar.width = 300;
    searchBar.height = 30;

    self.navigationItem.titleView = searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.view resignFirstResponder];
    [self.navigationItem.titleView resignFirstResponder];
}
@end
