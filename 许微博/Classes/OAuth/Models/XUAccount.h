//
//  XUAccount.h
//  许微博
//
//  Created by 许继广 on 15/12/14.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XUAccount : NSObject <NSCoding>
@property(nonatomic, copy) NSString *access_token;
/** access_token的过期时间,单位是秒数 */
@property(copy, nonatomic) NSString *expires_in;
/** 当前授权用户的UID */
@property(copy, nonatomic) NSNumber *uid;

/**access_token产生时间*/
@property(strong,nonatomic) NSDate *create_time;

/** 存储用户名 */
@property(nonatomic, strong) NSString *name;

+(instancetype)accountWithDict:(NSDictionary *)dict;
@end
