//
//  UIView+ZFTExtend.h
//  TYGJV2
//
//  Created by Eric  on 2019/8/30.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZFTExtend)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

//获取当前view的superView对应的控制器
- (ZFTBaseViewController *)zftViewController;

@end

NS_ASSUME_NONNULL_END
