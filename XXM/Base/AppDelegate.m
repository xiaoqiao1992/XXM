//
//  AppDelegate.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "QQNavigationController.h"
#import "QQTabBarController.H"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    QQTabBarController * rootVC = [[QQTabBarController alloc] init];
    self.window.rootViewController = rootVC;//[[QQNavigationController alloc] initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    
    //获取用户信息
    NSUserDefaults *userMessage = [NSUserDefaults standardUserDefaults];
    NSDate * data = [userMessage objectForKey:@"QQUserInfoModel"];
    [QQAccountManager share].userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@",[QQAccountManager share].userInfo);
        
    return YES;
}




@end
