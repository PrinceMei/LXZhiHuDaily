//
//  TopStories.h
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLJSONAdapter.h>
#import <MTLModel.h>

@interface TopStories : MTLModel<MTLJSONSerializing>

/**
 *  故事id
 */
@property (nonatomic, assign) NSInteger storyId;

/**
 *  故事标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  故事图片地址
 */
@property (nonatomic, copy) NSString *image;

/**
 *  故事类型,貌似没用
 */
@property (nonatomic, assign) NSInteger type;

/**
 *  不知道有什么用
 */
@property (nonatomic, copy) NSString *ga_prefix;

@end
