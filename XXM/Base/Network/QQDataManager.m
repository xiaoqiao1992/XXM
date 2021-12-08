//
//  QQDataManager.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQDataManager.h"

@implementation QQDataManager
+ (QQDataManager *)sharedManager
{
    static QQDataManager *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance  = [[self alloc] init];
    });
    return instance;
}








@end
