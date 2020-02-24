//
//  JDPopupAnimationCover.h
//  Example
//
//  Created by My Mac on 2019/5/7.
//  Copyright © 2019年 Jedediah. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JDPopupAnimationCover : UIView

@property (nonatomic,assign) BOOL dimBackground;
/**
 点击block调用
 */
@property (nonatomic,copy) void(^popupAnimationCoverTouchBlock)(void);

+ (instancetype)initCoverWithDimbg:(BOOL)dimBg touchEnabel:(BOOL)touchEnabel popupDuration:(CGFloat)popupDuration;

@end

NS_ASSUME_NONNULL_END
