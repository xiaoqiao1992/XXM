//
//  QQAccountManager.m
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import "QQAccountManager.h"

@implementation QQAccountManager

+(QQAccountManager *)share{
    static dispatch_once_t onceToken;
    static QQAccountManager *instance;
    dispatch_once(&onceToken, ^{
        instance=[[self alloc] init];
    });
    return instance;
}
@end
