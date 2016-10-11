//
//  FBLunBoView.m
//  myIsland
//
//  Created by cc on 16/8/19.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "FBLunBoView.h"
#import "FBWeakTimer.h"
#import "constant.h"

@interface FBLunBoView () <UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView       *contentView;
@property (strong, nonatomic) NSArray <UIView *> *views;

@property (assign, nonatomic) FBLunBoDirection lunBoDirection;

@property (assign, nonatomic) NSInteger currIndex;

@end

@implementation FBLunBoView

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

- (instancetype)initWithDirection:(FBLunBoDirection)direction
{
    if (self = [super init]) {
        self.lunBoDirection = direction;
    }
    
    return self;
}

- (void)subInitLayout
{
    WS(ws);
    
    [self scrollView];
    [self contentView];
    [self views];

    
    [self addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws);
    }];
    
    [self.scrollView addSubview:self.contentView];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.scrollView);
        make.width.mas_equalTo(ws.scrollView);
    }];
    
    [self.contentView addSubview:self.views[0]];
    [self.views[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(ws.contentView);
        make.top.mas_equalTo(ws.contentView);
        make.height.mas_equalTo(ws.scrollView);
    }];
    [self.contentView addSubview:self.views[1]];
    [self.views[1] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(ws.contentView);
        make.top.mas_equalTo(ws.views[0].mas_bottom);
        make.height.mas_equalTo(ws.scrollView);
    }];
    [self.contentView addSubview:self.views[2]];
    [self.views[2] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(ws.contentView);
        make.top.mas_equalTo(ws.views[1].mas_bottom);
        make.height.mas_equalTo(ws.scrollView);
        make.bottom.mas_equalTo(ws.contentView);
    }];
}

#pragma mark ------------------set&get&lazy load--------------------

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    
    return _scrollView;
}

- (UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] init];
    }
    
    return _contentView;
}

- (NSArray<UIView *> *)views
{
    if (_views == nil) {
        UIView *view0 = [[UIView alloc] init];
        UIView *view1 = [[UIView alloc] init];
        UIView *view2 = [[UIView alloc] init];
        
        _views = @[view0, view1, view2];
    }
    
    return _views;
}

- (void)viewsAtIndex:(NSInteger)viewsIndex AddLbViewAtIndex:(NSInteger)lbViewsIndex
{
    WS(ws);
    
    for (UIView *v in self.views[viewsIndex].subviews) {
        [v removeFromSuperview];
    }
    
    [self.views[viewsIndex] addSubview:self.lunBoViews[lbViewsIndex]];
    [self.lunBoViews[lbViewsIndex] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(ws.views[viewsIndex]);
    }];
}


#pragma mark ----------------UIScrollViewDelegate--------------
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    self.currIndex = [self nextIndexOfIndex:self.currIndex WithDirection:self.lunBoDirection];
    
    [self.scrollView setContentOffset:CGPointMake(0, 25*RATIO) animated:NO];
    
    [self viewsAtIndex:1 AddLbViewAtIndex:self.currIndex];
    
    if (self.lunBoDirection == FBLunBoDirectionUpWard) {
        if (self.lunBoViews.count == 2) {
            [self viewsAtIndex:2 AddLbViewAtIndex:1 - self.currIndex];
        } else {
            [self viewsAtIndex:0 AddLbViewAtIndex:[self lastIndexOfIndex:self.currIndex WithDirection:self.lunBoDirection]];
            [self viewsAtIndex:2 AddLbViewAtIndex:[self nextIndexOfIndex:self.currIndex WithDirection:self.lunBoDirection]];
        }
    } else if (self.lunBoDirection == FBLunBoDirectionDownWard) {
        if (self.lunBoViews.count == 2) {
            [self viewsAtIndex:0 AddLbViewAtIndex:1 - self.currIndex];
        } else {
            [self viewsAtIndex:0 AddLbViewAtIndex:[self nextIndexOfIndex:self.currIndex WithDirection:self.lunBoDirection]];
            [self viewsAtIndex:2 AddLbViewAtIndex:[self lastIndexOfIndex:self.currIndex WithDirection:self.lunBoDirection]];
        }
    }
}

#pragma mark ------------other-------------
- (NSInteger)nextIndexOfIndex:(NSInteger)index WithDirection:(FBLunBoDirection)direction
{
    if (direction == FBLunBoDirectionUpWard) {
        ++index;
        
        if (index == self.lunBoViews.count) {
            index = 0;
        }
    } else if (direction == FBLunBoDirectionDownWard) {
        --index;
        
        if (index == -1) {
            index = self.lunBoViews.count - 1;
        }
    }
    
    return index;
}

- (NSInteger)lastIndexOfIndex:(NSInteger)index WithDirection:(FBLunBoDirection)direction
{
    if (direction == FBLunBoDirectionUpWard) {
        --index;
        
        if (index == -1) {
            index = self.lunBoViews.count - 1;
        }
    } else if (direction == FBLunBoDirectionDownWard) {
        ++index;
        
        if (index == self.lunBoViews.count) {
            index = 0;
        }
    }
    
    return index;
}

#pragma mark ---------------set&get-----------------
- (void)setLunBoViews:(NSArray<UIView *> *)lunBoViews
{
    _lunBoViews = lunBoViews;
    
    WS(ws);
    
    if (_lunBoViews.count >= 3) {
        [self viewsAtIndex:0 AddLbViewAtIndex:_lunBoViews.count-1];
        [self viewsAtIndex:1 AddLbViewAtIndex:0];
        [self viewsAtIndex:2 AddLbViewAtIndex:1];
    } else if (_lunBoViews.count == 2) {
        if (self.lunBoDirection == FBLunBoDirectionUpWard) {
            [self viewsAtIndex:1 AddLbViewAtIndex:0];
            [self viewsAtIndex:2 AddLbViewAtIndex:1];
        } else if (self.lunBoDirection == FBLunBoDirectionDownWard ) {
            [self viewsAtIndex:0 AddLbViewAtIndex:1];
            [self viewsAtIndex:1 AddLbViewAtIndex:0];
        }
    } else if (_lunBoViews.count == 1) {
        [self viewsAtIndex:1 AddLbViewAtIndex:0];
    }
    
    self.currIndex = 0;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.scrollView setContentOffset:CGPointMake(0, 25*RATIO) animated:NO];
    });
    
    if (_lunBoViews.count > 1) {
        [FBWeakTimer scheduledTimerWithTimeInterval:3 block:^(id userInfo) {
            if (ws.lunBoDirection == FBLunBoDirectionUpWard) {
                [ws.scrollView setContentOffset:CGPointMake(0, 50*RATIO) animated:YES];
            } else if (ws.lunBoDirection == FBLunBoDirectionDownWard) {
                [ws.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            }
        } userInfo:nil repeats:YES];
    }
}



@end
