//
//  UIFont+Custom.m
//  Hotspot
//
//  Created by YUMO on 15/5/29.
//  Copyright (c) 2015年 qianxun. All rights reserved.
//

#import "UIFont+Custom.h"
@implementation UIFont (Custom)

+ (UIFont *)customFontOfSizeCustom:(CGFloat)size andWidth:(CGFloat)width
{
    return [UIFont systemFontOfSize:size weight:+width];
}

+ (UIFont *)sportStepBigFontOfSizeCustom:(CGFloat)size{
    return [UIFont systemFontOfSize:size weight:+3];
}

+ (UIFont *)superBigFontOfSizeCustom:(CGFloat)size{
    return [UIFont systemFontOfSize:size weight:+0.5];
}

+ (UIFont *)bigFontOfSizeCustom:(CGFloat)size{
    return [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)systemFontOfSizeCustom:(CGFloat)size{
    return [UIFont systemFontOfSize:size weight:-0.5];
}
+ (UIFont *)boldFontOfSizeCustom:(CGFloat)size{
    return [UIFont systemFontOfSize:size];
}
@end
