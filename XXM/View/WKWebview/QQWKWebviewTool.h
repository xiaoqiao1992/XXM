//
//  QQWKWebviewTool.h
//  XXM
//
//  Created by QQ on 2021/12/14.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+Category.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQWKWebviewTool : NSObject
// 调转到App Store
+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withUrl:(NSURL *)url;
+ (void)jumpToAppStoreFromVc:(UIViewController *)fromVc withAppID:(NSString *)appID;

/// 打开对应App的URL
+ (void)openURLFromVc:(UIViewController *)fromVc withUrl:(NSURL *)url;

/// 选择图片相关
+ (void)chooseImageFromVC:(UIViewController *)fromVc sourceType:(UIImagePickerControllerSourceType)type callBackMethod:(NSString *)callback;
+ (void)removeTempImages;

@end

NS_ASSUME_NONNULL_END
