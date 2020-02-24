//
//  JDPopupAnimationCover.m
//  Example
//
//  Created by My Mac on 2019/5/7.
//  Copyright © 2019年 Jedediah. All rights reserved.
//

#import "JDPopupAnimationCover.h"

@interface JDPopupAnimationCover ()


@property (nonatomic,assign) BOOL touchEnable;
@property (nonatomic,assign) CGFloat popupDuration;

@end
@implementation JDPopupAnimationCover

+ (instancetype)initCoverWithDimbg:(BOOL)dimBg touchEnabel:(BOOL)touchEnabel popupDuration:(CGFloat)popupDuration{
    
    JDPopupAnimationCover *cover = [[JDPopupAnimationCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor clearColor];
    cover.alpha = 0;
    cover.popupDuration = popupDuration;
    cover.dimBackground = dimBg;
    cover.touchEnable = touchEnabel;
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    return cover;
}

#pragma mark - method
- (void)setDimBackground:(BOOL)dimBackground{
    _dimBackground = dimBackground;
    [UIView animateWithDuration:self.popupDuration animations:^{
        if(dimBackground){
            self.backgroundColor = [UIColor blackColor];
            self.alpha = 0.5;
        }else{
            self.backgroundColor = [UIColor clearColor];
            self.alpha = 1;
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if(self.touchEnable){
        
        if(self.popupAnimationCoverTouchBlock){
            self.dimBackground = NO;
            self.popupAnimationCoverTouchBlock();
        }
    }
}

@end
