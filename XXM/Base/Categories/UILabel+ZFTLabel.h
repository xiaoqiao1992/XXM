//
//  UILabel+ZFTLabel.h
//  TYGJ
//
//  Created by QQ on 2019/2/26.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ZFTLabel)
//固定宽度 获取label高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
