//
//  PopupRiseView.m
//  Example
//
//  Created by My Mac on 2019/5/7.
//  Copyright © 2019年 Jedediah. All rights reserved.
//

#import "PopupRiseView.h"

@implementation PopupRiseView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){

        self.popupAnimate = JDPopupFadein;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn addTarget:self action:@selector(didClickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
        closeBtn.frame = CGRectMake(20, 20, 100, 50);
        closeBtn.backgroundColor = [UIColor blueColor];
        [self addSubview:closeBtn];
    }
    return self;
}
- (void)didClickCloseBtn{
    [self remove];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}
@end
