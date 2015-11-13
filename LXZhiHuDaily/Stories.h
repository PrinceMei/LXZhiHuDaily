//
//  Stories.h
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MTLModel.h>
#import <MTLJSONAdapter.h>

@interface Stories : MTLModel<MTLJSONSerializing>

/**
 *  storyId
 */
@property (nonatomic, assign) NSInteger storyId;

/**
 *  故事标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  故事类型,不知道有什么用
 */
@property (nonatomic, assign) NSInteger type;

/**
 *  故事图片地址,数组类型
 */
@property (nonatomic, strong) NSArray<NSString *> *images;

/**
 *  没什么用
 */
@property (nonatomic, copy) NSString *ga_prefix;


@end
