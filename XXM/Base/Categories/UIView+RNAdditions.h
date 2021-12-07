//
//  UIView+RNAdditions.h
//  RRSpring
//
//  Created by hai zhang on 2/20/12.
//  Copyright (c) 2012 Renn. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - dimen

#define kRatio (kSCREEN_WIDTH/375.0)
#define kFitSize(a) ((a)*kRatio)

#define kDIMEN_BASE_CONFIRM_BUTTON_HEIGHT 30
#define kDIMEN_CHAT_VOICE_BUNDLE_HEIGHT 40
#define kDIMEN_USER_HEAD_MIDDLE_SIZE 40
#define kDIMEN_USER_HEAD_MIDDLE_CORNER_RADIUS 20
#define kDIMEN_BASE_CORNER_RADIUS 6
#define kDIMEN_BASE_CONTENT_ELEMENT_SMALL_SPACE 4
#define kDIMEN_THUMB_SIZE_LARGE 150
#define kDIMEN_WINDOW_TITLEBAR_HEIGHT 46
#define kDIMEN_BASE_CONTENT_ELEMENT_MIDDLE_SPACE 8
#define kDIMEN_WINDOW_MARGIN 1
#define kDIMEN_WINDOW_RATIO 1.67
#define kDIMEN_TOPIC_CATEGORY_MID_ICON_SIZE 24

@interface UIView (RNAdditions)

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic, readonly) CGFloat screenViewX;

@property (nonatomic, readonly) CGFloat screenViewY;

@property (nonatomic, readonly) CGRect screenFrame;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

- (void)removeAllSubviews;

- (CGPoint)offsetFromView:(UIView*)otherView;

- (UIViewController*)viewController;

- (UINavigationController *)navigationController;

@end

