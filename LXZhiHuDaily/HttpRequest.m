//
//  HttpRequest.m
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+ (void)getTopStoryCompletion:(requestSuccess)successBlock failed:(requestFaled)failedBlock {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //异步请求数据
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [manager GET:@"http://news-at.zhihu.com/api/4/news/latest" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
            NSArray *topStoriesArray = [MTLJSONAdapter modelsOfClass:[TopStories class] fromJSONArray:responseObject[@"top_stories"] error:nil];
            
            NSArray *storiesArray = [MTLJSONAdapter modelsOfClass:[Stories class] fromJSONArray:responseObject[@"stories"] error:nil];
            
            NSArray *allContentArray = [NSArray arrayWithObjects:topStoriesArray,storiesArray, nil];
            if (successBlock) {
                successBlock(allContentArray);
            }
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
            failedBlock(error);
        }];
    //});
}

@end
