//
//  ViewController.h
//  MBProgressHUB+Add
//
//  Created by shen_gh on 16/5/5.
//  Copyright © 2016年 shenAlexy. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

+(void)showErrorInVC:(NSError *)error;

+ (void)showInfoWithStatus:(NSString*)status;
+ (void)showSuccessWithStatus:(NSString*)status;
+ (void)showErrorWithStatus:(NSString*)status;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view isAutoClose:(BOOL)isAutoClose;

+(UIWindow *(^)(void))lastWindow;
@end
