//
//  QQDataManager.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import "QQAccountMessageModel.h"
#import "QQMainBannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQDataManager : NSObject
//+(QQDataManager *)shareManager;
+(void)netWorkMainBannerWithParam:(NSDictionary *)param onComplete:(void(^)(QQMainBannerModel * data))onComplete onFault:(void(^)(id error))onFault;


@end

NS_ASSUME_NONNULL_END
