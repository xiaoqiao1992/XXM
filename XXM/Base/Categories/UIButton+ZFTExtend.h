//
//  UIButton+LCAlignment.h
//  Pods
//
//  Created by jiangliancheng on 16/4/8.
//
//

#import <UIKit/UIKit.h>

@interface UIButton (ZFTExtend)
#pragma mark - (LCAlignmnet)
- (void)lc_titleImageHorizontalAlignmentWithSpace:(float)space;
- (void)lc_imageTitleHorizontalAlignmentWithSpace:(float)space;
- (void)lc_titleImageVerticalAlignmentWithSpace:(float)space;
- (void)lc_imageTitleVerticalAlignmentWithSpace:(float)space;

#pragma mark - (KTEnlargeEdge)

- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
