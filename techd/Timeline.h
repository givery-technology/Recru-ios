//
//  Timeline.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timeline : NSObject

+(STDeferred*)fetchCompanyList;

+(STDeferred*)createContribution:(NSNumber*)categoryId companyId:(NSNumber*)companyId text:(NSString*)text;

+(STDeferred*)createReaction:(NSNumber*)contributeId text:(NSString*)text;
+(STDeferred*)createUser:(NSString*)uid name:(NSString*)name;

+(STDeferred*)fetchReactionList:(NSNumber*)contributionId;

+(STDeferred*)fetchTimeline;
@end
