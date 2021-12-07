//
//  UIColor+Custom.m
//  BeMothor
//
//  Created by zhouhan on 15/6/7.
//  Copyright (c) 2015年 yongbaoHealth. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha {
    stringToConvert = [stringToConvert stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    unsigned hex;
    if (![scanner scanHexInt:&hex]) return nil;
    return [UIColor colorWithRGBHex:hex alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    return [self colorWithHexString:stringToConvert alpha:1.0f];
}

+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:alpha];
}
+ (UIImage *)imgWithColor:(UIColor *)color{
    return [self imageWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
@end
