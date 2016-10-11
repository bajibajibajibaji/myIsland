//
//  FBMySettingTableViewCell.h
//  myIsland
//
//  Created by cc on 16/8/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBMySettingTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImage *image;
@property (copy,   nonatomic) NSString *contentStr;
@property (copy,   nonatomic) NSString *cacheStr;
@property (assign, nonatomic) BOOL isHaveIndicator;

+ (instancetype)cellWithUpdPasswd;
+ (instancetype)cellWithCleanCache;
+ (instancetype)cellWithAboutFB;
+ (instancetype)cellWithShareFB;

@end
