//
//  FBLunBoContentView.m
//  myIsland
//
//  Created by cc on 16/8/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBLunBoContentView.h"
#import "constant.h"

@interface FBLunBoContentView ()

@property (strong, nonatomic) UIImageView *lunBoLeftImageView;
@property (strong, nonatomic) UIView      *verticalLineView;
@property (strong, nonatomic) UIImageView *lunBoRightImageView;
@property (strong, nonatomic) UILabel     *textLabel;

@property (strong, nonatomic) UITapGestureRecognizer *tapGes;

@end

@implementation FBLunBoContentView

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


- (void)subInitLayout
{
    WS(ws);
    
    self.lunBoLeftImageView = [[UIImageView alloc] init];
    
    self.verticalLineView = [[UIView alloc] init];
    self.verticalLineView.backgroundColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    
    self.lunBoRightImageView = [[UIImageView alloc] init];
    
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.numberOfLines = 1;
    self.textLabel.font = [UIFont boldSystemFontOfSize:15*RATIO];
    
    self.tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesFun)];
    self.tapGes.numberOfTapsRequired = 1;
    self.tapGes.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:self.tapGes];
    
    [self addSubview:self.lunBoLeftImageView];
    [self.lunBoLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(24*RATIO, 24*RATIO));
        make.left.mas_equalTo(ws);
        make.centerY.mas_equalTo(ws);
    }];
    
    [self addSubview:self.verticalLineView];
    [self.verticalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(1, 25*RATIO));
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.lunBoLeftImageView.mas_right).offset(4*RATIO);
    }];
    
    [self addSubview:self.lunBoRightImageView];
    [self.lunBoRightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(@(6*RATIO));
        make.height.mas_equalTo(@0);
//        make.size.mas_equalTo(CGSizeMake(6*RATIO, 13*RATIO));
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws);
    }];
    
    [self addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(20*RATIO));
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.verticalLineView.mas_right).offset(4*RATIO);
        make.right.mas_equalTo(ws.lunBoRightImageView.mas_left);
    }];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.lunBoLeftImageView.image = _image;
}

- (void)setText:(NSString *)text
{
    _text = text;
    
    self.textLabel.text = _text;
}

- (void)setIsHaveIndicator:(BOOL)isHaveIndicator
{
    _isHaveIndicator = isHaveIndicator;
    
    if (_isHaveIndicator) {
        self.lunBoRightImageView.image = imageOfAutoScaleImage(@"Jump nearby.png");
        [self.lunBoRightImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@(13*RATIO));
        }];
    } else {
        self.lunBoRightImageView.image = nil;
    }
}

#pragma mark -----------------------gesture-------------------------
- (void)tapGesFun
{
    if (self.tapAction != nil) {
        self.tapAction(self);
    }
}

@end
