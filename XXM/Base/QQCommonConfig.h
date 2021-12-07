//
//  QQCommonConfig.h
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQCommonConfig : NSObject

#pragma mark - 公共宏
#define kSCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define kScreenScale  [UIScreen mainScreen].scale


#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...)
#endif

/********** IPHONE INFO **********/
#define kAPP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_BUILD  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kSYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
#define kKEYWINDOW [[UIApplication sharedApplication] keyWindow]
#define kUserId ([NSString stringWithFormat:@"%d",(int)[ZFTAccountManager share].currentAccount.userid])
#define kIPHONE4 kiPhone4
#define kIPHONE5 kiPhone5
#define kIPHONE6 kiPhone6
#define KIPHONE6PLUS kiPhone6Plus
#define KIPHONE_X IS_IPHONE_X_Series
#define kChatInputHeight  (kFitSize(86.0f) ) //chat底部输入高度 // + kBottomSafeAreaHeight
#define kBottomHeight (IS_IPHONE_X_Series?40:20)
#define kTaskTreeNavigationBarHeight (kFitSize(44)+kStatusBarHeight)
//Math
#define kRADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))//弧度转角度
#define kDEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)//角度转弧度

//判断是否是ipad
#define kIsPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
//判断iPhone4系列
//#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
#define kiPhone4 (kSCREEN_WIDTH == 320.0 && kSCREEN_HEIGHT == 480.0)
//判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iPhone678系列
#define kiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iphone678+系列
#define kiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)

//判断iPhone12
#define IS_IPHONE_12 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 2340), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)

//判断iPhone12_Max_Pro
#define IS_IPHONE_12_Max_Pro ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1170, 2532), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)

//判断iPhone12_ProMax
#define IS_IPHONE_12_ProMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1284, 2778), [[UIScreen mainScreen] currentMode].size) && !kIsPad : NO)

// 判断是不是iphoneX 系列
#define IS_IPHONE_X_Series (IS_IPHONE_X==YES || IS_IPHONE_Xr ==YES || IS_IPHONE_Xs== YES || IS_IPHONE_Xs_Max== YES || IS_IPHONE_12==YES || IS_IPHONE_12_Max_Pro==YES||IS_IPHONE_12_ProMax==YES)

//iPhoneX系列
#define kStatusBarHeight (IS_IPHONE_X_Series ? 44.0 : 20.0)
#define kNavigationHeight kTaskTreeNavigationBarHeight
#define kTabbarHeight (kFitSize(32.0f+17.0f+10.0f)+kBottomSafeAreaHeight) // (IS_IPHONE_X_Series ? 83.0 : 49.0)

#define kBottomSafeAreaHeight (IS_IPHONE_X_Series ? 34.0 : 0.0)




#pragma mark - Color

#define kFont_Normal_Color [UIColor colorWithHexString:@"666666"]
#define kRed_Color10 [UIColor colorWithHexString:@"F91C37"]
#define kGray_Color15 [UIColor colorWithHexString:@"F9F9F9"]



@end

NS_ASSUME_NONNULL_END
