//
//  XUOAuthViewController.m
//  许微博
//
//  Created by 许继广 on 15/12/11.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUOAuthViewController.h"
#import "AFNetworking.h"
#import "XUTabBarViewController.h"
#import "XUNewfeatureViewController.h"
#import "XUAccount.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+MJ.h"
#import "XUAccountManager.h"

@interface XUOAuthViewController () <UIWebViewDelegate>

@end

@implementation XUOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=976904100&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url = request.URL.absoluteString;
    NSRange range =[url rangeOfString:@"code="];
    if (range.length != 0) {
        //获取授权码
        int fromIndex = range.length + range.location;
        NSString *code = [url substringFromIndex:fromIndex];
        //利用code获取accessToken
        [self accessTokenWithCode:code];
        return NO;
    }
    return YES;
}

- (void)accessTokenWithCode:(NSString *)code
{
    /*
     URL：https://api.weibo.com/oauth2/access_token
     
     请求参数：
     client_id：申请应用时分配的AppKey
     client_secret：申请应用时分配的AppSecret
     grant_type：使用authorization_code
     redirect_uri：授权成功后的回调地址
     code：授权成功后返回的code
     */
    // 1.请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // AFN的AFJSONResponseSerializer默认不接受text/plain这种类型
    
    // 2.拼接请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"client_id"] = @"976904100";
    params[@"client_secret"] = @"4ca87182a71bc38163ff3c04fda66c2f";
    params[@"grant_type"] = @"authorization_code";
    params[@"code"] = code;
    params[@"redirect_uri"] = @"http://www.baidu.com";
    
    
    // 3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        
        XUAccount *account = [XUAccount accountWithDict:responseObject];
        [XUAccountManager saveAccount:account];
        
        
        //获取储存在沙盒中得版本号
        NSString *version = [[NSUserDefaults standardUserDefaults]objectForKey:@"CFBundleVersion"];
        
        //当前软件的版本从info.plist中取
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        NSString *currentVersion = infoDictionary[@"CFBundleVersion"];
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"CFBundleVersion"];
        [[NSUserDefaults standardUserDefaults]synchronize];//赶紧写入
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        if ([version isEqualToString:currentVersion]) {
            UITabBarController *tabBarVC =  [[XUTabBarViewController alloc]init];
            window.rootViewController  = tabBarVC;
        }else {
            window.rootViewController = [[XUNewfeatureViewController alloc]init];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [MBProgressHUD hideHUD];
    }];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在登录中"];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}
@end
