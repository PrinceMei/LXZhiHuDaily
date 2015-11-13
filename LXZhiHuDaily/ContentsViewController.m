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

@interface ContentsViewController ()

@end

@implementation ContentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self.view addSubview:self.tableView];
}

- (UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"cell %ld",indexPath.row];
    return cell;
}

@end
