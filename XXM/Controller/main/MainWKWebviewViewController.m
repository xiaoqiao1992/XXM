//
//  MainWKWebviewViewController.m
//  XXM
//
//  Created by QQ on 2021/12/14.
//

#import "MainWKWebviewViewController.h"
#import "QQWKWebView.h"
@interface MainWKWebviewViewController ()
@end

@implementation MainWKWebviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden =YES;
}

//-(void)initTopNavView{
//    self.topNavView = [[QQCommonNavigationBar alloc] initWithTitle:@"二级页面" controller:self];
//    __weak MainWKWebviewViewController * weakSelf = self;
//    [self.topNavView addItemWithLeft:YES isImg:YES content:@"navigationBar_backV2" block:^(QQCommonNavigationBar * _Nonnull cusBar, UIButton * _Nonnull btn, UIViewController * _Nonnull viewC) {
//        [weakSelf.navigationController popViewControllerAnimated:YES];
//    }];
//}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
