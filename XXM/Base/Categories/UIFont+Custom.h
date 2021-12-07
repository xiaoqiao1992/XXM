//
//  UIFont+Custom.h
//  Hotspot
//
//  Created by YUMO on 15/5/29.
//  Copyright (c) 2015年 qianxun. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 字体设置

//粗体
#define kR92 kBoldFontSize(46)
#define kR90 kBoldFontSize(45)
#define kR80 kBoldFontSize(40)
#define kR70 kBoldFontSize(35)
#define kR68 kBoldFontSize(34)
#define kR64 kBoldFontSize(32)
#define kR60 kBoldFontSize(30)
#define kR56 kBoldFontSize(28)
#define kR52 kBoldFontSize(26)
#define kR50 kBoldFontSize(25)
#define kR48 kBoldFontSize(24)
#define kR46 kBoldFontSize(23)
#define kR44 kBoldFontSize(22)
#define kR42 kBoldFontSize(21)
#define kR40 kBoldFontSize(20)
#define kR38 kBoldFontSize(19)
#define kR36 kBoldFontSize(18)
#define kR34 kBoldFontSize(17)
#define kR32 kBoldFontSize(16)
#define kR30 kBoldFontSize(15)
#define kR28 kBoldFontSize(14)
#define kR26 kBoldFontSize(13)
#define kR24 kBoldFontSize(12)
#define kR22 kBoldFontSize(11)
#define kR18 kBoldFontSize(9)

//标准
#define kL100 kNormalFontSize(50)
#define kL92 kNormalFontSize(46)
#define kL90 kNormalFontSize(45)
#define kL80 kNormalFontSize(40)
#define kL68 kNormalFontSize(34)
#define kL56 kNormalFontSize(28)
#define kL50 kNormalFontSize(25)
#define kL48 kNormalFontSize(24)
#define kL44 kNormalFontSize(22)
#define kL40 kNormalFontSize(20)
#define kL38 kNormalFontSize(19)
#define kL36 kNormalFontSize(18)
#define kL34 kNormalFontSize(17)
#define kL32 kNormalFontSize(16)
#define kL30 kNormalFontSize(15)
#define kL28 kNormalFontSize(14)
#define kL26 kNormalFontSize(13)
#define kL24 kNormalFontSize(12)
#define kL22 kNormalFontSize(11)
#define kL20 kNormalFontSize(10)
#define kL18 kNormalFontSize(9)


#define kLightFontSize(a) [UIFont systemFontOfSizeCustom:kFitSize(a)]
#define kNormalFontSize(a) [UIFont boldFontOfSizeCustom:kFitSize(a)]
#define kBoldFontSize(a) [UIFont bigFontOfSizeCustom:kFitSize(a)]
#define kSuperBoldFontSize(a) [UIFont superBigFontOfSizeCustom:kFitSize(a)]

@interface UIFont (Custom)

+ (UIFont *)bigFontOfSizeCustom:(CGFloat)size;

+ (UIFont *)systemFontOfSizeCustom:(CGFloat)size; 

+ (UIFont *)boldFontOfSizeCustom:(CGFloat)size;

+ (UIFont *)superBigFontOfSizeCustom:(CGFloat)size;

+ (UIFont *)sportStepBigFontOfSizeCustom:(CGFloat)size;

+ (UIFont *)customFontOfSizeCustom:(CGFloat)size andWidth:(CGFloat)width;

@end
