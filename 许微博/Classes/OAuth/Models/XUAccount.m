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
    [account setValuesForKeysWithDictionary:dict];
    return account;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeObject:_expires_in forKey:@"expires_in"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_remind_in forKey:@"remind_in"];
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:@"access_token"];
        _expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _remind_in = [aDecoder decodeObjectForKey:@"remind_in"];
    }
    return self;
}
@end
