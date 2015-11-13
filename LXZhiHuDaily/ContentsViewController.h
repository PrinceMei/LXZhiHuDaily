//
//  ContentsViewController.h
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDCycleScrollView.h>
#import "ParallaxHeaderView.h"

@interface ContentsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate,ParallaxHeaderViewDelegate>

//@property (nonatomic, strong) UITableView *tableView;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
