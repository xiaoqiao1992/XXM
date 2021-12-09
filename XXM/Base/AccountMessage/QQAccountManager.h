//
//  QQAccountManager.h
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import <Foundation/Foundation.h>
#import "QQLoginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQAccountManager : NSObject

+(QQAccountManager *)share;

@property (nonatomic, strong) QQLoginModel * accountModel;




@end

NS_ASSUME_NONNULL_END
