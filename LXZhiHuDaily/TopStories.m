//
//  TopStories.m
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import "TopStories.h"

@implementation TopStories

+ (NSDictionary*)JSONKeyPathsByPropertyKey{
    
    return @{@"storyId":@"id",
             @"title":@"title",
             @"image":@"image",
             @"type":@"type",
             @"ga_prefix":@"ga_prefix"
             };
}
@end
