//
//  QQDataManager.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQDataManager.h"
#import "QQNetwork.h"
@implementation QQDataManager

+(void)netWorkMainBannerWithParam:(NSDictionary *)param onComplete:(void (^)(QQMainBannerModel * _Nonnull))onComplete onFault:(void (^)(id _Nonnull))onFault{
    [[QQNetwork Network] dataWithUrl:QQMainBannerUrl Host:nil param:param method:QQHttpRequestMethodGet modelClassName:QQMainBannerModel.self onProgress:nil onComplete:^(QQMainBannerModel * data) {
        onComplete(data);
    } onFault:^(id error) {
        onFault(error);
        NSLog(@"%@",error);
    }];
}








@end
