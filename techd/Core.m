//
//  Core.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "Core.h"

@implementation Core


+ (NSDictionary *)addUserId:(NSDictionary *)dictionary {
    NSMutableDictionary *params = [dictionary mutableCopy];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults stringForKey:@"userId"];
    params[@"user_id"] = userId;
    NSDictionary *resParams = [params copy];
    return resParams;
}

+ (NSString *)generateUrlPath:(NSString *)apiName {
    NSString *url = [NSString stringWithFormat:@"%@/%@", [self generateUrlHost], apiName];
    return url;
}

+ (NSString *)generateUrlHost{
    NSString *urlHost = @"http://dev.cpla.jp/recru/sp";
    return urlHost;
}

@end
