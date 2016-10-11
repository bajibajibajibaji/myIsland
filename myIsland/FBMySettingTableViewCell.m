//
//  FBMySettingTableViewCell.m
//  myIsland
//
//  Created by cc on 16/8/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBMySettingTableViewCell.h"
#import "constant.h"

@interface FBMySettingTableViewCell ()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel     *contentLabel;
@property (strong, nonatomic) UILabel     *cacheLabel;
@property (strong, nonatomic) UIImageView *indicatorImageView;

@end

@implementation FBMySettingTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initLayout];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initLayout];
    }
    
    return self;
}

- (void)initLayout
{
    WS(ws);
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.iconImageView = [[UIImageView alloc] init];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.textAlignment = NSTextAlignmentLeft;
    self.contentLabel.numberOfLines = 1;
    self.contentLabel.font = [UIFont boldSystemFontOfSize:14];
    self.contentLabel.textColor = [UIColor colorWithRed:0.0 green:80.0/255 blue:100.0/255 alpha:1.0];
    
    self.cacheLabel = [[UILabel alloc] init];
    self.cacheLabel.textAlignment = NSTextAlignmentRight;
    self.cacheLabel.numberOfLines = 1;
    self.cacheLabel.font = [UIFont boldSystemFontOfSize:14];
    self.cacheLabel.textColor = [UIColor whiteColor];
    
    self.indicatorImageView = [[UIImageView alloc] init];
    
    
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.left.mas_equalTo(ws).offset(50*RATIO);
        make.centerY.mas_equalTo(ws);
    }];
    
    [self addSubview:self.indicatorImageView];
    [self.indicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(6, 0));
        make.centerY.mas_equalTo(ws);
        make.right.mas_equalTo(ws).offset(-50*RATIO);
    }];
    
    [self addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.iconImageView.mas_right).offset(15*RATIO);
    }];
    
    [self addSubview:self.cacheLabel];
    [self.cacheLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@30);
        make.centerY.mas_equalTo(ws);
        make.left.mas_equalTo(ws.contentLabel.mas_right);
        make.right.mas_equalTo(ws.indicatorImageView.mas_left);
    }];
};

+ (instancetype)cellWithUpdPasswd
{
    FBMySettingTableViewCell *cell = [[FBMySettingTableViewCell alloc] init];
    cell.image = imageOfAutoScaleImage(@"d9 Password.png");
    cell.contentStr = @"修改密码";
    cell.isHaveIndicator = YES;
    
    return cell;
}

+ (instancetype)cellWithCleanCache
{
    FBMySettingTableViewCell *cell = [[FBMySettingTableViewCell alloc] init];
    cell.image = imageOfAutoScaleImage(@"d9 cache.png");
    cell.contentStr = @"清理缓存";
    cell.cacheStr = @"0M";
    
    return cell;
}

+ (instancetype)cellWithAboutFB
{
    FBMySettingTableViewCell *cell = [[FBMySettingTableViewCell alloc] init];
    cell.image = imageOfAutoScaleImage(@"d9 about.png");
    cell.contentStr = @"关于分贝";
    
    return cell;
}

+ (instancetype)cellWithShareFB
{
    FBMySettingTableViewCell *cell = [[FBMySettingTableViewCell alloc] init];
    cell.image = imageOfAutoScaleImage(@"d9 share.png");
    cell.contentStr = @"把分贝分享给好友";
    cell.isHaveIndicator = YES;
    
    return cell;
}

#pragma mark -------------------------set&get-------------------------
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.iconImageView.image = _image;
}

- (void)setContentStr:(NSString *)contentStr
{
    _contentStr = contentStr;
    
    self.contentLabel.text = _contentStr;
}

- (void)setCacheStr:(NSString *)cacheStr
{
    _cacheStr = cacheStr;
    
    self.cacheLabel.text = _cacheStr;
}

- (void)setIsHaveIndicator:(BOOL)isHaveIndicator
{
    _isHaveIndicator = isHaveIndicator;
    
    if (_isHaveIndicator) {
        self.indicatorImageView.image = imageOfAutoScaleImage(@"Jump nearby.png");
        [self.indicatorImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@(13));
        }];
    } else {
        self.indicatorImageView.image = nil;
    }
}

@end
