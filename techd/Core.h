//
//  Core.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Core : NSObject

+ (NSDictionary *)addUserId:(NSDictionary *)dictionary;

+ (NSString *)generateUrlPath:(NSString *)apiName;


+ (NSString *)generateUrlHost;
@end
