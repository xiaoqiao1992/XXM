//
//  ViewController.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "ViewController.h"
#import "HttpTool.h"
#import "QQLoginModel.h"
#import "QQLoginModel.h"
#import "MJExtension.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary * dict = @{
        @"username":@"13112819921",
        @"password":@"123456",
//        @"repassword":@"123456"
    };
    
    
    [HttpTool postWithURL:@"https://www.wanandroid.com/user/login" params:dict success:^(id json) {
        QQLoginModel *model = [QQLoginModel mj_objectWithKeyValues:json];
        NSLog(@"请求成功");
        NSLog(@"%@",model);
    } failure:^(NSError *error) {
        NSLog(@"请求失败");
    }];
    
    
    
    
    
    
    
    
    self.topNavView = [[QQCommonNavigationBar alloc] initWithTitle:@"二级页面" controller:self];
    self.topNavView.backgroundColor = kRed_Color10;
    __weak ViewController * weakSelf = self;
    [self.topNavView addItemWithLeft:YES isImg:YES content:@"navigationBar_backV2" block:^(QQCommonNavigationBar * _Nonnull cusBar, UIButton * _Nonnull btn, UIViewController * _Nonnull viewC) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}


@end
