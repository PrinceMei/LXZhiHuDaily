//
//  HttpRequest.h
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "TopStories.h"
#import "Stories.h"

typedef void(^requestSuccess)(NSArray *array);
typedef void(^requestFaled)(NSError * error);

@interface HttpRequest : NSObject

/**
 *  获取首页照片轮播内容以及最新消息
 *
 *  @param successBlock 请求成功返回的内容
 *  @param failedBlock  请求失败返回错误信息
 */
+ (void)getTopStoryCompletion:(requestSuccess)successBlock failed:(requestFaled)failedBlock;

@end
