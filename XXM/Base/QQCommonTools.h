//
//  QQCommonTools.h
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQCommonTools : NSObject
//error info
+(NSError *(^)(int errorCode,...))getErrorInfo;
@end

NS_ASSUME_NONNULL_END
