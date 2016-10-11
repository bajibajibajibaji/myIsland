//
//  FBMySettingViewController.m
//  myIsland
//
//  Created by cc on 16/8/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBMySettingViewController.h"
#import "FBMySettingTableViewCell.h"
#import "constant.h"

@interface FBMySettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIButton    *cancelButton;

// datasource
@property (strong, nonatomic) NSArray <FBMySettingTableViewCell *> *cells;

@end

@implementation FBMySettingViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self subInit];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的设置";
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self subLayout];
}

- (void)subInit
{
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    
    self.cancelButton = [[UIButton alloc] init];
    self.cancelButton.layer.cornerRadius = 13;
    self.cancelButton.layer.masksToBounds = YES;
    self.cancelButton.backgroundColor = [UIColor redColor];
    self.cancelButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self.cancelButton setTitle:@"安全退出" forState:UIControlStateNormal];
}

- (void)subLayout
{
    WS(ws);
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(SCREEN_WIDTH));
        make.height.mas_equalTo(@200);
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).offset(64 + 29*RATIO_V);
    }];
    
    [self.view addSubview:self.cancelButton];
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.tableView.mas_bottom).offset(100*RATIO_V);
    }];
}

#pragma mark -----------------set&get------------------
- (NSArray<UITableViewCell *> *)cells
{
    if (_cells == nil) {
        _cells = [NSMutableArray arrayWithCapacity:4];
        
        FBMySettingTableViewCell *cell0 = [FBMySettingTableViewCell cellWithUpdPasswd];
        [(NSMutableArray *)_cells addObject:cell0];
        
        FBMySettingTableViewCell *cell1 = [FBMySettingTableViewCell cellWithCleanCache];
        cell1.cacheStr = @"9999M";
        [(NSMutableArray *)_cells addObject:cell1];
        
        FBMySettingTableViewCell *cell2 = [FBMySettingTableViewCell cellWithAboutFB];
        [(NSMutableArray *)_cells addObject:cell2];
        
        FBMySettingTableViewCell *cell3 = [FBMySettingTableViewCell cellWithShareFB];
        [(NSMutableArray *)_cells addObject:cell3];
    }
    
    return _cells;
}

#pragma mark -----------UITableViewDataSource------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cells.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cells[indexPath.row];
}

#pragma mark -----------UITableViewDelegate------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20*RATIO_V + 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"update passwd");
    } else if (indexPath.row == 1) {
        self.cells[1].cacheStr = @"0M";
    } else if (indexPath.row == 2) {
        NSLog(@"about FB");
    } else if (indexPath.row == 3) {
        NSLog(@"share FB");
    }
}

@end
