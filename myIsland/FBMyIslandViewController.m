//
//  FBMyIslandViewController.m
//  myIsland
//
//  Created by cc on 16/8/18.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBMyIslandViewController.h"
#import "FBExpView.h"
#import "FBLunBoView.h"
#import "FBLunBoContentView.h"
#import "FBMySettingViewController.h"
#import "constant.h"

@interface FBMyIslandViewController ()

@property (strong, nonatomic) UIImageView *bgImageView;

@property (strong, nonatomic) UIImageView *avatorBorderImageView;
@property (strong, nonatomic) UIImageView *avatorImageView;
@property (strong, nonatomic) UILabel     *usernameLabel;
@property (strong, nonatomic) UILabel     *signatureLabel;

@property (strong, nonatomic) UIImageView *lvlImageView;
@property (strong, nonatomic) UILabel     *lvlLabel;

@property (strong, nonatomic) UIImageView *rankImageView;
@property (strong, nonatomic) UILabel     *rankLabel;

@property (strong, nonatomic) FBExpView   *expView;

@property (strong, nonatomic) FBLunBoView *lunBoView;
@property (strong, nonatomic) UIView      *horizontalLineView;



@property (strong, nonatomic) UIButton    *myShareButton;
@property (strong, nonatomic) UILabel     *myShareButtonLabel;

@property (strong, nonatomic) UIButton    *orderRecordButton;
@property (strong, nonatomic) UILabel     *orderRecordButtonLabel;

@property (strong, nonatomic) UIButton    *myShellButton;
@property (strong, nonatomic) UILabel     *myShellButtonLabel;

@property (strong, nonatomic) UIButton    *myFriendButton;
@property (strong, nonatomic) UILabel     *myFriendButtonLabel;

@property (strong, nonatomic) UIButton    *mySettingButton;
@property (strong, nonatomic) UILabel     *mySettingButtonLabel;

@property (strong, nonatomic) UIButton    *suggestingButton;
@property (strong, nonatomic) UILabel     *suggestingButtonLabel;

@property (strong, nonatomic) NSArray<FBLunBoContentView *> *scrollContents; // 滚动文字数据源

@end

@implementation FBMyIslandViewController

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
    self.title = @"我的岛";
    self.view.backgroundColor = [UIColor colorWithRed:35.0f/255.0f green:205.0f/255.0f blue:250.0f/255.0f alpha:1.0f];
    
    [self subLayout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.expView startAnimaling];
}

- (void)subInit
{
    WS(ws);
    
    self.bgImageView = imageViewOfAutoScaleImage(@"d4 wave1.png");
    self.bgImageView.layer.contentsCenter = CGRectMake(0, 0.95, 0, 0.05);
    
    self.avatorBorderImageView = imageViewOfAutoScaleImage(@"d1 head.png");
    self.avatorBorderImageView.backgroundColor = [UIColor whiteColor];
    
    self.avatorImageView = [[UIImageView alloc] init];
    self.avatorImageView.image = imageOfAutoScaleImage(@"d6 friend.png");
    
    self.usernameLabel = [[UILabel alloc] init];
    self.usernameLabel.textAlignment = NSTextAlignmentCenter;
    self.usernameLabel.numberOfLines = 1;
    self.usernameLabel.font = [UIFont boldSystemFontOfSize:17*RATIO];
    self.usernameLabel.textColor = [UIColor whiteColor];
    self.usernameLabel.text = @"创唐突弟弟";
    
    self.signatureLabel = [[UILabel alloc] init];
    self.signatureLabel.textAlignment = NSTextAlignmentCenter;
    self.signatureLabel.numberOfLines = 1;
    self.signatureLabel.font = [UIFont boldSystemFontOfSize:13*RATIO];
    self.signatureLabel.text = @"创闯闯，啦啦啦啦啦啦啦啦啦啦";
    
    self.lvlImageView = imageViewOfAutoScaleImage(@"d6 level.png");
    
    self.lvlLabel = [[UILabel alloc] init];
    self.lvlLabel.textAlignment = NSTextAlignmentLeft;
    self.lvlLabel.numberOfLines = 1;
    self.lvlLabel.font = [UIFont boldSystemFontOfSize:19*RATIO];
    self.lvlLabel.text = @"123";
    
    self.rankImageView = imageViewOfAutoScaleImage(@"d6 rank.png");
    
    self.rankLabel = [[UILabel alloc] init];
    self.rankLabel.textAlignment = NSTextAlignmentLeft;
    self.rankLabel.numberOfLines = 1;
    self.rankLabel.font = [UIFont boldSystemFontOfSize:19*RATIO];
    self.rankLabel.text = @"456";
    
    self.expView = [FBExpView expViewWithCurrExpNum:500 TotalExpNum:1000];
    
    self.lunBoView = [[FBLunBoView alloc] initWithDirection:FBLunBoDirectionUpWard];
    
    FBLunBoContentView *lbcV0 = [[FBLunBoContentView alloc] init];
    lbcV0.image = imageOfAutoScaleImage(@"d6 Prompt.png");
    lbcV0.text = @"我事测试测试测试测试";
    lbcV0.isHaveIndicator = YES;
    lbcV0.tapAction = ^(FBLunBoContentView *lunBoContentView) {
        [ws lunBoViewTap:lunBoContentView];
    };
    
    FBLunBoContentView *lbcV1 = [[FBLunBoContentView alloc] init];
    lbcV1.image = imageOfAutoScaleImage(@"d6 feedback.png");
    lbcV1.text = @"我也是测试咯是得是得是得是得是的饿是的饿是的饿是的饿是的hi额开了房间都流口水懒得看积分的可乐加福禄寿飞但是考虑放家里的开发进来";
    lbcV1.tapAction = ^(FBLunBoContentView *lunBoContentView) {
        [ws lunBoViewTap:lunBoContentView];
    };
    
    FBLunBoContentView *lbcV2 = [[FBLunBoContentView alloc] init];
    lbcV2.image = imageOfAutoScaleImage(@"d6 level.png");
    lbcV2.text = @"我不不不不不也是测试咯是得是得是得是得是的饿是的饿是的饿是的饿是的hi额开了房间都流口水懒得看积分的可乐加福禄寿飞但是考虑放家里的开发进来";
    lbcV2.isHaveIndicator = YES;
    lbcV2.tapAction = ^(FBLunBoContentView *lunBoContentView) {
        [ws lunBoViewTap:lunBoContentView];
    };
    
    self.lunBoView.lunBoViews = @[lbcV0, lbcV1, lbcV2];
    
    self.horizontalLineView = [[UIView alloc] init];
    self.horizontalLineView.backgroundColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.horizontalLineView.alpha = 0.3;
    
    
    
    self.myShareButton = [[UIButton alloc] init];
    [self.myShareButton setImage:imageOfAutoScaleImage(@"d6 share.png") forState:UIControlStateNormal];
    [self.myShareButton addTarget:self action:@selector(myShareButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.myShareButtonLabel = [[UILabel alloc] init];
    self.myShareButtonLabel.numberOfLines = 1;
    self.myShareButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.myShareButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.myShareButtonLabel.text = @"我的分享";
    
    self.orderRecordButton = [[UIButton alloc] init];;
    [self.orderRecordButton setImage:imageOfAutoScaleImage(@"d6 Order.png") forState:UIControlStateNormal];
    [self.orderRecordButton addTarget:self action:@selector(orderRecordButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.orderRecordButtonLabel = [[UILabel alloc] init];
    self.orderRecordButtonLabel.numberOfLines = 1;
    self.orderRecordButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.orderRecordButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.orderRecordButtonLabel.text = @"订单记录";
    
    self.myShellButton = [[UIButton alloc] init];;
    [self.myShellButton setImage:imageOfAutoScaleImage(@"d6 coin.png") forState:UIControlStateNormal];
    [self.myShellButton addTarget:self action:@selector(myShellButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.myShellButtonLabel = [[UILabel alloc] init];
    self.myShellButtonLabel.numberOfLines = 1;
    self.myShellButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.myShellButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.myShellButtonLabel.text = @"我的漂贝";
    
    self.myFriendButton = [[UIButton alloc] init];;
    [self.myFriendButton setImage:imageOfAutoScaleImage(@"d6 friend.png") forState:UIControlStateNormal];
    [self.myFriendButton addTarget:self action:@selector(myFriendButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.myFriendButtonLabel = [[UILabel alloc] init];
    self.myFriendButtonLabel.numberOfLines = 1;
    self.myFriendButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.myFriendButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.myFriendButtonLabel.text = @"我的好友";
    
    self.mySettingButton = [[UIButton alloc] init];;
    [self.mySettingButton setImage:imageOfAutoScaleImage(@"d6 Set up.png") forState:UIControlStateNormal];
    [self.mySettingButton addTarget:self action:@selector(mySettingButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.mySettingButtonLabel = [[UILabel alloc] init];
    self.mySettingButtonLabel.numberOfLines = 1;
    self.mySettingButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.mySettingButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.mySettingButtonLabel.text = @"我的设置";
    
    self.suggestingButton = [[UIButton alloc] init];;
    [self.suggestingButton setImage:imageOfAutoScaleImage(@"d6 feedback.png") forState:UIControlStateNormal];
    [self.suggestingButton addTarget:self action:@selector(suggestingButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    
    self.suggestingButtonLabel = [[UILabel alloc] init];
    self.suggestingButtonLabel.numberOfLines = 1;
    self.suggestingButtonLabel.font = [UIFont boldSystemFontOfSize:16*RATIO];
    self.suggestingButtonLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    self.suggestingButtonLabel.text = @"建议反馈";
}

- (void)subLayout
{
    WS(ws);
    
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(SCREEN_WIDTH));
        make.centerX.mas_equalTo(ws.view);
        make.top.mas_equalTo(ws.view).offset(64 + 16*RATIO_V+100*RATIO);
        make.bottom.mas_equalTo(ws.view);
    }];
    
    [self.view addSubview:self.avatorBorderImageView];
    [self.avatorBorderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100*RATIO, 100*RATIO));
        make.top.mas_equalTo(ws.view).offset(64+6*RATIO_V);
        make.left.mas_equalTo(ws.view).offset(30*RATIO);
    }];
    
    [self.view addSubview:self.avatorImageView];
    [self.avatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.avatorBorderImageView);
    }];
    
    [self.view addSubview:self.usernameLabel];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(20*RATIO));
        make.left.mas_equalTo(ws.avatorImageView.mas_right).offset(20*RATIO);
        make.top.mas_equalTo(ws.view).offset(64+8*RATIO_V);
    }];
    
    [self.view addSubview:self.signatureLabel];
    [self.signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(10*RATIO));
        make.left.mas_equalTo(ws.avatorImageView.mas_right).offset(20*RATIO);
        make.top.mas_equalTo(ws.usernameLabel.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.lvlImageView];
    [self.lvlImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25*RATIO, 30*RATIO));
        make.left.mas_equalTo(ws.avatorImageView.mas_right).offset(20*RATIO);
        make.top.mas_equalTo(ws.signatureLabel.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.lvlLabel];
    [self.lvlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(30*RATIO));
        make.width.mas_equalTo(@(65*RATIO));
        make.left.mas_equalTo(ws.lvlImageView.mas_right).offset(5*RATIO);
        make.top.mas_equalTo(ws.signatureLabel.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.rankImageView];
    [self.rankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(29*RATIO, 30*RATIO));
        make.left.mas_equalTo(ws.lvlLabel.mas_right).offset(10*RATIO);
        make.top.mas_equalTo(ws.signatureLabel.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.rankLabel];
    [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(30*RATIO));
        make.left.mas_equalTo(ws.rankImageView.mas_right).offset(5*RATIO);
        make.top.mas_equalTo(ws.signatureLabel.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.expView];
    [self.expView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(210*RATIO, 20*RATIO));
        make.left.mas_equalTo(ws.avatorImageView.mas_right).offset(20*RATIO);
        make.top.mas_equalTo(ws.rankImageView.mas_bottom).offset(6*RATIO_V);
    }];
    
    [self.view addSubview:self.lunBoView];
    [self.lunBoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(25*RATIO));
        make.top.mas_equalTo(ws.avatorImageView.mas_bottom).offset(30*RATIO_V);
        make.left.mas_equalTo(ws.view).offset(30*RATIO);
        make.right.mas_equalTo(ws.view).offset(-30*RATIO);
    }];
    
    [self.view addSubview:self.horizontalLineView];
    [self.horizontalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.mas_equalTo(ws.lunBoView);
        make.right.mas_equalTo(ws.lunBoView);
        make.top.mas_equalTo(ws.lunBoView.mas_bottom).offset(4*RATIO_V);
    }];
    
    [self.view addSubview:self.myShareButton];
    [self.myShareButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.horizontalLineView.mas_bottom).offset(15*RATIO_V);
        make.right.mas_equalTo(ws.view.mas_centerX).offset(-17*RATIO);
    }];
    
    [self.myShareButton addSubview:self.myShareButtonLabel];
    [self.myShareButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.myShareButton);
        make.bottom.mas_equalTo(ws.myShareButton);
    }];
    
    [self.view addSubview:self.orderRecordButton];
    [self.orderRecordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.horizontalLineView.mas_bottom).offset(15*RATIO_V);
        make.left.mas_equalTo(ws.view.mas_centerX).offset(17*RATIO);
    }];
    
    [self.orderRecordButton addSubview:self.orderRecordButtonLabel];
    [self.orderRecordButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.orderRecordButton);
        make.bottom.mas_equalTo(ws.orderRecordButton);
    }];
    
    [self.view addSubview:self.myShellButton];
    [self.myShellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.myShareButton.mas_bottom).offset(15*RATIO_V);
        make.right.mas_equalTo(ws.view.mas_centerX).offset(-17*RATIO);
    }];
    
    [self.myShellButton addSubview:self.myShellButtonLabel];
    [self.myShellButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.myShellButton);
        make.bottom.mas_equalTo(ws.myShellButton);
    }];
    
    [self.view addSubview:self.myFriendButton];
    [self.myFriendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.orderRecordButton.mas_bottom).offset(15*RATIO_V);
        make.left.mas_equalTo(ws.view.mas_centerX).offset(17*RATIO);
    }];
    
    [self.myFriendButton addSubview:self.myFriendButtonLabel];
    [self.myFriendButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.myFriendButton);
        make.bottom.mas_equalTo(ws.myFriendButton);
    }];
    
    [self.view addSubview:self.mySettingButton];
    [self.mySettingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.myShellButton.mas_bottom).offset(15*RATIO_V);
        make.right.mas_equalTo(ws.view.mas_centerX).offset(-17*RATIO);
    }];
    
    [self.mySettingButton addSubview:self.mySettingButtonLabel];
    [self.mySettingButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.mySettingButton);
        make.bottom.mas_equalTo(ws.mySettingButton);
    }];
    
    [self.view addSubview:self.suggestingButton];
    [self.suggestingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140*RATIO, 140*RATIO));
        make.top.mas_equalTo(ws.myFriendButton.mas_bottom).offset(15*RATIO_V);
        make.left.mas_equalTo(ws.view.mas_centerX).offset(17*RATIO);
    }];
    
    [self.suggestingButton addSubview:self.suggestingButtonLabel];
    [self.suggestingButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(17*RATIO));
        make.centerX.mas_equalTo(ws.suggestingButton);
        make.bottom.mas_equalTo(ws.suggestingButton);
    }];
}

#pragma mark --------------button action----------------
- (void)myShareButtonPress:(UIButton *)button
{
    NSLog(@"myshare");
}

- (void)orderRecordButtonPress:(UIButton *)button
{
    NSLog(@"orderrecord");
}

- (void)myShellButtonPress:(UIButton *)button
{
    NSLog(@"myshell");
}

- (void)myFriendButtonPress:(UIButton *)button
{
    NSLog(@"myfriend");
}

- (void)mySettingButtonPress:(UIButton *)button
{
    FBMySettingViewController *mySettingVC = [[FBMySettingViewController alloc] init];
    
    [self.navigationController pushViewController:mySettingVC animated:YES];
}

- (void)suggestingButtonPress:(UIButton *)button
{
    NSLog(@"suggesting");
}

#pragma mark ----------------other----------------

- (void)lunBoViewTap:(FBLunBoContentView *)view
{
    NSLog(@"[%@]", view.text);
}
@end
