//
//  FBWeakTimer.m
//  myIsland
//
//  Created by cc on 16/8/22.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBWeakTimer.h"

@interface FBWeakTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer* timer;

@end

@implementation FBWeakTimerTarget

- (void) fire:(NSTimer *)timer
{
    if(self.target) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f];
#pragma clang diagnostic pop
    } else {
        [self.timer invalidate];
    }
}

@end

@implementation FBWeakTimer

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats
{
    FBWeakTimerTarget* timerTarget = [[FBWeakTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    return timerTarget.timer;
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(FBTimerHandler)block
                                   userInfo:(id)userInfo
                                    repeats:(BOOL)repeats
{
    NSMutableArray *userInfoArray = [NSMutableArray arrayWithObject:[block copy]];
    if (userInfo != nil) {
        [userInfoArray addObject:userInfo];
    }
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(_timerBlockInvoke:)
                                       userInfo:[userInfoArray copy]
                                        repeats:repeats];
}

+ (void)_timerBlockInvoke:(NSArray*)userInfo
{
    FBTimerHandler block = userInfo[0];
    id info = nil;
    if (userInfo.count == 2) {
        info = userInfo[1];
    }
    
    if (block) {
        block(info);
    }
}

@end