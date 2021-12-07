//
//  UILabel+ZFTLabel.m
//  TYGJ
//
//  Created by QQ on 2019/2/26.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import "UILabel+ZFTLabel.h"

@implementation UILabel (ZFTLabel)
//固定宽度 获取label高度
+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}
@end
