//
//  FBExpView.h
//  myIsland
//
//  Created by cc on 16/8/18.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBExpView : UIView

+ (instancetype)expViewWithCurrExpNum:(NSInteger)currExpNum TotalExpNum:(NSInteger)totalExpNum;
- (void)startAnimaling;

@end
