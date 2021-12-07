//
//  ViewController.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.topNavView = [[QQCommonNavigationBar alloc] initWithTitle:@"二级页面" controller:self];
    __weak ViewController * weakSelf = self;
    [self.topNavView addItemWithLeft:YES isImg:YES content:@"navigationBar_backV2" block:^(QQCommonNavigationBar * _Nonnull cusBar, UIButton * _Nonnull btn, UIViewController * _Nonnull viewC) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    
}


@end
