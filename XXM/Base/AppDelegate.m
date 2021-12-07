//
//  AppDelegate.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "QQNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    MainViewController * rootVC = [[MainViewController alloc] init];
    self.window.rootViewController = [[QQNavigationController alloc] initWithRootViewController:rootVC];
    [self.window makeKeyAndVisible];
    return YES;
}




@end
