//
//  QQNavigationController.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "QQNavigationController.h"

@interface QQNavigationController ()

@end

@implementation QQNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    UIViewController *curVC = [super popViewControllerAnimated:animated];
//    if (self.viewControllers.count == 1) {
//        if ([self.viewControllers[0] isKindOfClass:NSClassFromString(@"ZFTPhotosController")]) {
//            [ZFTAssistantManager share].assistantWindow.hidden = YES;
//        }else if([ZFTAccountManager share].currentAccount!=nil){
//            [ZFTAssistantManager share].assistantWindow.hidden = NO;
//        }
//    }
    
    return curVC;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
