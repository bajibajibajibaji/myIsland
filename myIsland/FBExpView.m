//
//  FBExpView.m
//  myIsland
//
//  Created by cc on 16/8/18.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBExpView.h"
#import "constant.h"

@interface FBExpView ()

@property (strong, nonatomic) UIImageView *exp1ImageView;
@property (strong, nonatomic) UIImageView *exp2ImageView;
@property (strong, nonatomic) UIImageView *exp3ImageView;

@property (strong, nonatomic) UILabel     *expLabel;

@property (assign, nonatomic) NSInteger currExpNum;
@property (assign, nonatomic) NSInteger totalExpNum;

@end

@implementation FBExpView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self subInitLayout];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self subInitLayout];
    }
    
    return self;
}

+ (instancetype)expViewWithCurrExpNum:(NSInteger)currExpNum TotalExpNum:(NSInteger)totalExpNum
{
    FBExpView *expView = [[FBExpView alloc] init];
    expView.currExpNum = currExpNum;
    expView.totalExpNum = totalExpNum;
    NSString *str = [NSString stringWithFormat:@"%ld/%ld", currExpNum, totalExpNum];
    expView.expLabel.text = str;
    
    return expView;
}

- (void)subInitLayout
{
    WS(ws);
    
    self.exp1ImageView = imageViewOfAutoScaleImage(@"d6 exp1.png");
    self.exp2ImageView = imageViewOfAutoScaleImage(@"d6 exp2.png");
    self.exp3ImageView = imageViewOfAutoScaleImage(@"d6 exp3.png");
    self.exp3ImageView.layer.contentsCenter = CGRectMake(0.45, 0, 0.1, 0);
    
    
    self.expLabel = [[UILabel alloc] init];
    self.expLabel.textAlignment = NSTextAlignmentCenter;
    self.expLabel.numberOfLines = 1;
    self.expLabel.font = [UIFont systemFontOfSize:10*RATIO weight:UIFontWeightThin];
    self.expLabel.textColor = [UIColor redColor];
    self.expLabel.text = @"0/0";
    
    [self addSubview:self.exp1ImageView];
    [self.exp1ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(22*RATIO, 20*RATIO));
        make.left.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
    }];
    
    [self insertSubview:self.exp2ImageView belowSubview:self.exp1ImageView];
    [self.exp2ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(210*RATIO, 20*RATIO));
        make.left.mas_equalTo(ws);
        make.top.mas_equalTo(ws);
    }];
    
    [self insertSubview:self.exp3ImageView belowSubview:self.exp1ImageView];
    [self.exp3ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(22*RATIO, 20*RATIO));
        make.centerY.mas_equalTo(ws.exp2ImageView);
        make.left.mas_equalTo(ws);
    }];
    
    [self addSubview:self.expLabel];
    [self.expLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(ws.exp3ImageView);
        make.centerY.mas_equalTo(ws.exp2ImageView);
        make.centerX.mas_equalTo(ws);
    }];
}

- (void)startAnimaling
{
    CGFloat r = (CGFloat)self.currExpNum / (CGFloat)self.totalExpNum;
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.exp3ImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(@((208-22)*RATIO*r + 22*RATIO));
        }];
        
        [self layoutIfNeeded];
    } completion:nil];
}

@end
