//
//  QQAppUrlConfig.h
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQAppUrlConfig : NSObject

#pragma mark - 配置客户端信息
extern BOOL const kIsAppRelease;//当前是否正式环境
#pragma mark - 域名
extern NSString * const QQAppURL;//app接口域名
extern NSString * const QQMainBannerUrl;//首页banner

@end

NS_ASSUME_NONNULL_END
