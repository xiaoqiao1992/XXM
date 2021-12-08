//
//  ViewController.h
//  MBProgressHUB+Add
//
//  Created by shen_gh on 16/5/5.
//  Copyright © 2016年 shenAlexy. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)
/**
 *  显示信息
 *
 *  @param text 信息内容
 *  @param icon 图标
 *  @param view 显示的视图
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (![NSThread isMainThread]) {return;}
    if (view == nil) view = self.lastWindow();
    
    //加一个判断，如果之前已经有了其他的提示，先隐藏
    if (view.subviews.count>0) {
        for (UIView *curView in view.subviews) {
            if ([curView isKindOfClass:[MBProgressHUD class]]) {
                [curView removeFromSuperview];
            }
        }
    }
    
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //hud.labelText = text;
    // 设置图片
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"MBProgressHUD" ofType:@"bundle"];
    if (icon) {
        hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@" , icon]]];
    }
    
    [hud.bezelView setStyle:MBProgressHUDBackgroundStyleSolidColor];
    [hud.bezelView setColor:[UIColor colorWithHexString:@"000000" alpha:0.5]];
    
//    hud.bezelView setb
//    [hud.bezelView setBlurEffectStyle:UIBlurEffectStyleDark];
//    [hud setBackgroundColor:[UIColor clearColor]];//kBlack_Color
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    hud.detailsLabel.text=text;//label
    hud.detailsLabel.textColor=[UIColor whiteColor];//label
    hud.detailsLabel.font = kL32;//label
    // 1秒之后再消失
//    [hud hide:YES afterDelay:1.5f];
    [hud hideAnimated:YES afterDelay:1.5f];
}

/**
 *  显示一些信息
 *
 *  @param message 信息内容
 *  @param view    需要显示信息的视图
 *
 *  @return 直接返回一个MBProgressHUD
 */
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view{
    return [self showMessage:message toView:view isAutoClose:YES];
}
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view isAutoClose:(BOOL)isAutoClose {
    if (![NSThread isMainThread]) {return nil;}
    if (view == nil) view = self.lastWindow();
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //    hud.labelText = message;
    hud.detailsLabel.text=message;//label
    hud.detailsLabel.textColor=[UIColor whiteColor];
    [hud.backgroundView setBackgroundColor:[UIColor colorWithHexString:@"000000" alpha:0.5]];
    hud.mode = MBProgressHUDModeCustomView;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
//    hud.dimBackground = YES;
    if (isAutoClose) {
        [hud hideAnimated:YES afterDelay:1.5f];
//        [hud hide:YES afterDelay:1.5f];
    }
    
    return hud;
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 */
+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

/**
 *  显示成功信息
 *
 *  @param success 信息内容
 *  @param view    显示信息的视图
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success" view:view];
}

/**
 *  显示错误信息
 *
 */
+ (void)showError:(NSString *)error{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showError:error toView:nil];
        
    });
    
    
}

/**
 *  显示错误信息
 *
 *  @param error 错误信息内容
 *  @param view  需要显示信息的视图
 */
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error" view:view];
}

/**
 *  显示错误信息
 *
 *  @param message 信息内容
 *
 *  @return 直接返回一个MBProgressHUD，需要手动关闭
 */
+ (MBProgressHUD *)showMessage:(NSString *)message{
    return [self showMessage:message toView:nil];
}

/**
 *  手动关闭MBProgressHUD
 */
+ (void)hideHUD
{
    [self hideHUDForView:nil];
}

/**
 *  手动关闭MBProgressHUD
 *
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)hideHUDForView:(UIView *)view{
    if (![NSThread isMainThread]) {return;}
    if (view == nil) view = self.lastWindow();
    [self hideHUDForView:view animated:YES];
}

//+(void)showErrorInVC:(NSError *)error{
//    [ZFTProgressHUD showMessage:(error.userInfo==nil||error.userInfo.count==0||[[error.userInfo[@"info"] zft_trim] isEqualToString:@""]||error.userInfo[@"info"]==nil)?kErrorNotificationString:error.userInfo[@"info"]];
//}

+(UIWindow *(^)(void))lastWindow{
    return ^UIWindow *{
        NSArray *windows = [UIApplication sharedApplication].windows;
        for(UIWindow *window in [windows reverseObjectEnumerator]) {
            if ([window isKindOfClass:[UIWindow class]] &&
                CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)&&!window.hidden){
                if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_9_0) {
                    UIViewController *tmpVC = [window rootViewController];
                    return [tmpVC view];
                }else{
                    return window;
                }
            }
        }
        return [UIApplication sharedApplication].keyWindow;
    };
}

+ (void)showInfoWithStatus:(NSString*)status{
    [MBProgressHUD showMessage:status];
}


+ (void)showSuccessWithStatus:(NSString*)status{
    [MBProgressHUD showSuccess:status];
}

//+ (void)showErrorWithStatus:(NSString*)status{
//    [ZFTProgressHUD showMessage:status];
//}
@end
