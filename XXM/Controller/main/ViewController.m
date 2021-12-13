//
//  ViewController.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "ViewController.h"
#import "QQAccountMessageModel.h"
#import "MJExtension.h"
#import "QQNetwork.h"
#import "AFHTTPSessionManager.h"
#import "QQMainBannerModel.h"


@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTopNavView];
    
    UIButton * loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [loginBtn setTitle:@"登录按钮" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(onClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
 
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"获取信息" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(didClickBtn) forControlEvents:UIControlEventTouchUpInside];
        
    
    
    
    
    
  
}

-(void)initTopNavView{
    self.topNavView = [[QQCommonNavigationBar alloc] initWithTitle:@"二级页面" controller:self];
    __weak ViewController * weakSelf = self;
    [self.topNavView addItemWithLeft:YES isImg:YES content:@"navigationBar_backV2" block:^(QQCommonNavigationBar * _Nonnull cusBar, UIButton * _Nonnull btn, UIViewController * _Nonnull viewC) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

-(void)onClickLoginBtn{
    NSDictionary * dict = @{
        @"username":@"16816816816",
        @"password":@"111111",
    };
    [[QQNetwork Network] dataWithUrl:@"/user/login" Host:nil param:dict method:QQHttpRequestMethodPost modelClassName:QQAccountMessageModel.self onProgress:nil onComplete:^(QQAccountMessageModel * data) {
        QQLoginModel * model = [QQLoginModel new];
        model = data.data;
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:model];
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:data2 forKey:@"QQLoginModel"];
        [user synchronize];

    } onFault:^(id error) {
        NSLog(@"%@",error);
    }];
}

-(void)didClickBtn{
    NSUserDefaults *userMessage = [NSUserDefaults standardUserDefaults];
    NSDate * data = [userMessage objectForKey:@"QQLoginModel"];
    [QQAccountManager share].accountModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    NSLog(@"%@",[QQAccountManager share].accountModel);
}

@end
