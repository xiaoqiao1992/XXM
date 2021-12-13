//
//  QQAccountManager.m
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import "QQAccountManager.h"
#import "QQNetwork.h"
@implementation QQAccountManager

+(QQAccountManager *)share{
    static dispatch_once_t onceToken;
    static QQAccountManager *instance;
    dispatch_once(&onceToken, ^{
        instance=[[self alloc] init];
    });
    return instance;
}

+(void)netWorkLoginWithParam:(NSDictionary *)param onComplete:(void (^)(QQAccountMessageModel * _Nonnull))onComplete onFault:(void (^)(id _Nonnull))onFault{

    [[QQNetwork Network] dataWithUrl:@"/user/login" Host:nil param:param method:QQHttpRequestMethodPost modelClassName:QQAccountMessageModel.self onProgress:nil onComplete:^(QQAccountMessageModel * data) {
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


@end
