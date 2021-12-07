//
//  UIColor+Custom.h
//  BeMothor
//
//  Created by zhouhan on 15/6/7.
//  Copyright (c) 2015年 yongbaoHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Custom)
/**
 通过16位string设置颜色，并且可以传入alpha选择透明度
 
 @param stringToConvert 颜色值@"#000000"
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIImage *)imgWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
