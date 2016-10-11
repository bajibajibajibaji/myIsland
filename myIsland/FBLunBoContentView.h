//
//  FBLunBoContentView.h
//  myIsland
//
//  Created by cc on 16/8/23.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBLunBoContentView;

@interface FBLunBoContentView : UIView

@property (strong, nonatomic) UIImage *image;
@property (copy,   nonatomic) NSString *text;
@property (assign, nonatomic) BOOL isHaveIndicator;

@property(nonatomic, copy) void(^tapAction)(FBLunBoContentView *lunBoContentView);

@end
