//
//  FourViewController.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "FourViewController.h"
#import "QQUserInfoModel.h"
@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 350, 100, 100)];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
}
-(void)onClickButton{
    //获取个人信息
    [QQDataManager netWorkGetUserInfoWithOnComplete:^(QQUserInfoModel * _Nonnull data) {
        QQUserInfoModel * model = [QQUserInfoModel new];
        model = data;
        NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:model];
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user setObject:data2 forKey:@"QQUserInfoModel"];
        [user synchronize];
    } onFault:^(id  _Nonnull error) {
        NSLog(@"%@",error);
    }];
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
