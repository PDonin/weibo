//
//  XUAccountManager.h
//  许微博
//
//  Created by 许继广 on 15/12/14.
//  Copyright (c) 2015年 许继广. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XUAccount.h"

@interface XUAccountManager : NSObject
+(void)saveAccount:(XUAccount *)account;
+(XUAccount *)account;
@end
