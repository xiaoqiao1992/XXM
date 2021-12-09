//
//  QQAccountMessageModel.h
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import <Foundation/Foundation.h>
#import "QQLoginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQAccountMessageModel : NSObject
@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) int errorCode;
@property (nonatomic, strong) QQLoginModel * data;


@end

NS_ASSUME_NONNULL_END
