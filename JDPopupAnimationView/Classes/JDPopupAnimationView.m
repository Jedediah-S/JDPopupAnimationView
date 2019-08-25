//
//  JDPopupAnimationView.m
//  Example
//
//  Created by My Mac on 2019/5/7.
//  Copyright © 2019年 Jedediah. All rights reserved.
//

#import "JDPopupAnimationView.h"
#import "JDPopupAnimationCover.h"

@implementation JDPopupAnimationView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.popupDuration = 0.25;
        self.touchEnable = YES;
        self.dimBackground = YES;
        self.finalRect = frame;
    }
    return self;
}

#pragma mark - method
- (void)show{
    
    __weak typeof(self) weakSelf = self;
    
    self.cover = [JDPopupAnimationCover initCoverWithDimbg:self.dimBackground touchEnabel:self.touchEnable popupDuration:self.popupDuration];
    self.cover.popupAnimationCoverTouchBlock = ^{
        [weakSelf remove];
    };
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:self.popupDuration animations:^{
        [weakSelf showAnimate];
    }];
}
- (void)remove{
    
    __weak typeof(self) weakSelf = self;

    self.cover.dimBackground = NO;
    [UIView animateWithDuration:self.popupDuration animations:^{
        [weakSelf removeAnimate];
    } completion:^(BOOL finished) {
        [weakSelf.cover removeFromSuperview];
        [weakSelf removeFromSuperview];
    }];
}

#pragma mark - animate
- (void)showAnimate{
    
    switch (self.popupAnimate) {
        case JDPopupFadein:
            self.alpha = 1;
            break;
        case JDPopupRise:
        case JDPopupDown:
            [self setupY:self.finalRect.origin.y];
            break;
        case JDPopupLeft:
        case JDPopupRight:
            [self setupX:self.finalRect.origin.x];
            break;
        case JDPopupScaleFadein:
            self.alpha = 1;
            self.frame= self.finalRect;
            break;
        default:
            break;
    }
}
- (void)removeAnimate{
    
    CGSize winSize = [UIScreen mainScreen].bounds.size;
    
    switch (self.popupAnimate) {
        case JDPopupFadein:
            self.alpha = 0;
            break;
        case JDPopupRise:
            [self setupY:winSize.height];
            break;
        case JDPopupDown:
            [self setupY:-self.finalRect.size.height];
            break;
        case JDPopupLeft:
            [self setupX:-self.finalRect.size.width];
            break;
        case JDPopupRight:
            [self setupX:winSize.width];
            break;
        default:
            break;
    }
}

#pragma mark - setup
- (void)setPopupAnimate:(JDPopupAnimate)popupAnimate{
    _popupAnimate = popupAnimate;
    
    CGSize winSize = [UIScreen mainScreen].bounds.size;
    switch (popupAnimate) {
        case JDPopupFadein:
            self.alpha = 0;
            break;
        case JDPopupRise:
            [self setupY:winSize.height];
            break;
        case JDPopupDown:
            [self setupY:-self.finalRect.size.height];
            break;
        case JDPopupLeft:
            [self setupX:-self.finalRect.size.width];
            break;
        case JDPopupRight:
            [self setupX:winSize.width];
            break;
        case JDPopupScaleFadein:
            self.alpha = 0;
            [self setupX:self.finalRect.origin.x + self.finalRect.size.width/2];
            [self setupSize:CGSizeZero];
            break;
        default:
            break;
    }
}

- (void)setupX:(CGFloat)x{
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setupY:(CGFloat)y{
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setupSize:(CGSize)size{
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

@end
