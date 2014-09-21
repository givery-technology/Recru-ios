//
//  Timeline.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "Timeline.h"

@implementation Timeline

+(STDeferred*)fetchCompanyList{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{}.mutableCopy;
    [manager GET:[Core generateUrlPath:@"company_list_post.php"] parameters:[Core addUserId:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}

+(STDeferred*)createContribution:(NSNumber*)categoryId companyId:(NSNumber*)companyId text:(NSString*)text{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{@"category_id": categoryId, @"company_id": companyId, @"text": text}.mutableCopy;
    [manager POST:[Core generateUrlPath:@"create_contribution.php"] parameters:[Core addUserId:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}

+(STDeferred*)createReaction:(NSNumber*)contributionId text:(NSString*)text{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{@"contribution_id": contributionId, @"text": text}.mutableCopy;
    [manager POST:[Core generateUrlPath:@"create_reaction.php"] parameters:[Core addUserId:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}

+(STDeferred*)createUser:(NSString*)uid name:(NSString*)name{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{@"uid": uid, @"name": name}.mutableCopy;
    [manager POST:[Core generateUrlPath:@"create_user.php"] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}


+(STDeferred*)fetchReactionList:(NSNumber*)contributionId{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{@"id": contributionId}.mutableCopy;
    [manager GET:[Core generateUrlPath:@"reaction_post.php"] parameters:[Core addUserId:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}

+(STDeferred*)fetchTimeline{
    STDeferred *deferred = [STDeferred deferred];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *params = @{}.mutableCopy;
    [manager GET:[Core generateUrlPath:@"timeline_post.php"] parameters:[Core addUserId:params] success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [deferred resolve: responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error");
        [deferred reject:error];
    }];
    return deferred;
}



@end
