//
//  QQAccountManager.h
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import <Foundation/Foundation.h>
#import "QQLoginModel.h"
#import "QQAccountMessageModel.h"
#import "QQUserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQAccountManager : NSObject

+(QQAccountManager *)share;
@property (nonatomic, strong) QQUserInfoModel * userInfo;
@property (nonatomic, strong) QQLoginModel * accountModel;
+ (void)netWorkLoginWithParam:(NSDictionary *)param onComplete:(void(^)(QQAccountMessageModel * data))onComplete onFault:(void (^)(id error))onFault;




@end

NS_ASSUME_NONNULL_END
