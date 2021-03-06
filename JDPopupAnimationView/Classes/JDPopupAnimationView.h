//
//  JDPopupAnimationView.h
//  Example
//
//  Created by My Mac on 2019/5/7.
//  Copyright © 2019年 Jedediah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDPopupAnimationCover.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,JDPopupAnimate){
    
    JDPopupFadein       = 0,
    JDPopupRise         = 1,
    JDPopupDown         = 2,
    JDPopupLeft         = 3,
    JDPopupRight        = 4,
    JDPopupScaleFadein  = 5
};

@class JDPopupAnimationCover;

@interface JDPopupAnimationView : UIView

@property (nonatomic,assign) JDPopupAnimate popupAnimate;
@property (nonatomic,strong) JDPopupAnimationCover *cover;

/**
 目标frame
 */
@property (nonatomic,assign) CGRect finalRect;

/**
 是否需要半透明遮罩层
 */
@property (nonatomic,assign) BOOL dimBackground;

/**
 是否可点击移除
 */
@property (nonatomic,assign) BOOL touchEnable;

/**
 动画时长
 */
@property (nonatomic,assign) CGFloat popupDuration;

@property (nonatomic, copy) void(^disappearBlock)(void);

- (void)show;
- (void)showWithAlpha:(CGFloat)alpha hasRemoveAnimation:(BOOL)hasRemoveAnimation;   //设置蒙层透明度
- (void)remove;
- (void)removeWithNoAnimation;          //移除时，不带动画
- (void)showAnimate;
@end

NS_ASSUME_NONNULL_END
