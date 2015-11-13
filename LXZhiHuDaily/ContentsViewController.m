//
//  ContentsViewController.m
//  LXZhiHuDaily
//
//  Created by Lonely Stone on 15/11/13.
//  Copyright © 2015年 LonelyStone. All rights reserved.
//

#import "ContentsViewController.h"
#import <UINavigationBar+Awesome.h>
#import <SWRevealViewController.h>
#import <UIImageView+WebCache.h>
#import "MainContentTableViewCell.h"
#import "ParallaxHeaderView.h"
#import "HttpRequest.h"

#define kScreenWidth self.view.bounds.size.width
#define kScreenHeight self.view.bounds.size.height
#define kScrollImageHeight 154

@interface ContentsViewController (){
    SDCycleScrollView *_scrollImageView;
    ParallaxHeaderView *_headerView;
    NSArray *_topStoriesArray;
    NSArray *_storiesArray;
}

@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}

#pragma mark - loadData
- (void)loadData {
    
    [HttpRequest getTopStoryCompletion:^(NSArray *array) {
        _topStoriesArray = array[0];
        _storiesArray = array[1];

        [self addTableViewHeader];
        [self.tableView reloadData];
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - initNavigationBar
- (void)initNavigationBar{
    
    SWRevealViewController *revealController = self.revealViewController;
    revealController.rearViewRevealWidth = 230;
    revealController.bounceBackOnOverdraw = NO;
    revealController.bounceBackOnLeftOverdraw = NO;
    [self.view addGestureRecognizer:revealController.tapGestureRecognizer];
    [self.view addGestureRecognizer:revealController.panGestureRecognizer];
    UIBarButtonItem *leftBarButtom = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Home_Icon"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = leftBarButtom;
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    
}

#pragma mark - addTableViewHeader
- (void)addTableViewHeader {
    
    //初始化照片轮播器
    _scrollImageView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScrollImageHeight)];
    _scrollImageView.titleLabelBackgroundColor = [UIColor clearColor];
    _scrollImageView.titleLabelTextColor = [UIColor whiteColor];
    _scrollImageView.titleLabelHeight = 100;
    _scrollImageView.titleLabelTextFont = [UIFont boldSystemFontOfSize:17.0];
    _scrollImageView.autoScrollTimeInterval = 6;
    _scrollImageView.delegate = self;
    _scrollImageView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    
    NSMutableArray *urlArray = [NSMutableArray array];
    NSMutableArray *titleAray = [NSMutableArray array];
    for (TopStories *top in _topStoriesArray) {
        NSString *urlStr = top.image;
        NSLog(@"%@",urlStr);
        NSString *titleStr = top.title;
        [urlArray addObject:urlStr];
        [titleAray addObject:titleStr];
    }
    _scrollImageView.imageURLStringsGroup = urlArray;
    _scrollImageView.titlesGroup = titleAray;
    
    //初始化可以伸缩放大的表头
    _headerView = [ParallaxHeaderView parallaxHeaderViewWithSubView:_scrollImageView forSize:CGSizeMake(kScreenWidth, kScrollImageHeight)];
    _headerView.delegate = self;
    self.tableView.tableHeaderView = _headerView;
    
    //给照片轮播器添加阴影效果
    UIImageView *topMaskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    topMaskImageView.image = [UIImage imageNamed:@"News_Image_Mask"];
    [_scrollImageView addSubview:topMaskImageView];
    
    UIImageView *bottomMaskImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight - 100)];
    bottomMaskImageView.image = [UIImage imageNamed:@"Home_Image_Mask"];
    [_scrollImageView addSubview:bottomMaskImageView];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _storiesArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainContentCell"];
    Stories *story = _storiesArray[indexPath.row];
    [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:story.images[0]]];
    cell.contentLabel.text = story.title;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    UIColor *navigaitonBarColor = [UIColor colorWithRed:0.067 green:0.561 blue:0.910 alpha:1.000];
    CGFloat alpha = (64 + offsetY) / kScrollImageHeight ;
    
    //根据偏移量来设置导航栏的透明度
    [self.navigationController.navigationBar lt_setBackgroundColor:[navigaitonBarColor colorWithAlphaComponent:alpha]];
    
    if (scrollView == self.tableView) {
        [_headerView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
    }
}

#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld张照片",index);
}

#pragma mark - ParallaxHeaderViewDelegate
- (void)lockDirection{
    [self.tableView setContentOffset:CGPointMake(0, - kScrollImageHeight)];
}

@end
