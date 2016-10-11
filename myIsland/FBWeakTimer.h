//
//  FBWeakTimer.h
//  myIsland
//
//  Created by cc on 16/8/22.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^FBTimerHandler)(id userInfo);

@interface FBWeakTimer : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(FBTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats;

@end
