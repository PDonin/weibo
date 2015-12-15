//
//  XUAccountManager.m
//  许微博
//
//  Created by 许继广 on 15/12/14.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#define XUAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"account.data"]
#import "XUAccountManager.h"

@implementation XUAccountManager

+(void)saveAccount:(XUAccount *)account
{
    //获取账号产生时间
    NSDate *createTimer = [NSDate date];
    account.create_time = createTimer;
    [NSKeyedArchiver archiveRootObject:account toFile:XUAccountPath];
}

+(XUAccount *)account
{
    XUAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:XUAccountPath];
    long long expires_in = [account.expires_in longLongValue];
    //现在时间
    NSDate *now = [NSDate date];
    
    //过期时间
    NSDate *expires_time = [account.create_time dateByAddingTimeInterval:expires_in];
    //如果now>expires_time，过期
    NSComparisonResult result = [expires_time compare:now];
    /*
     NSOrderedAscending
     NSOrderedSame
     NSOrderedDesecending
     */
    if (result != NSOrderedDescending) {
        //过期
        return nil;
    }
    return account;
}
@end
