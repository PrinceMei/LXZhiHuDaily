//
//  Stories.m
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import "Stories.h"

@implementation Stories

+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    return @{
             @"storyId":@"id",
             @"title":@"title",
             @"type":@"type",
             @"images":@"images",
             @"ga_prefix":@"ga_prefix",
             };
}

@end
