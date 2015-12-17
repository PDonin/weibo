//
//  XUAccount.m
//  许微博
//
//  Created by 许继广 on 15/12/14.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import "XUAccount.h"

@implementation XUAccount
+(instancetype)accountWithDict:(NSDictionary *)dict
{
    XUAccount *account = [[self alloc]init];
    account.expires_in = dict[@"expires_in"];
    account.uid = dict[@"uid"];
    account.access_token = dict[@"access_token"];
    
    account.create_time = [NSDate date];
    return account;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:_expires_in forKey:@"expires_in"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_create_time forKey:@"create_time"];
    [aCoder encodeObject:_name forKey:@"name"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _create_time = [aDecoder decodeObjectForKey:@"create_time"];
        _name = [aDecoder decodeObjectForKey:@"name"];
    }
    return self;
}
@end
