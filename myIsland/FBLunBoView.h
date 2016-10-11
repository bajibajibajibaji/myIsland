//
//  FBLunBoView.h
//  myIsland
//
//  Created by cc on 16/8/19.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FBLunBoDirection) {
    FBLunBoDirectionUpWard,
    FBLunBoDirectionDownWard
};

@interface FBLunBoView : UIView

@property (strong, nonatomic) NSArray <UIView *> *lunBoViews;

- (instancetype)initWithDirection:(FBLunBoDirection)direction;

@end
