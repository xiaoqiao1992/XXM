//
//  QQTimer.h
//  GCD定时器 - 02
//
//  Created by QQ on 2021/11/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQTimer : NSObject
//block方式
+(NSString *)execTask:(void(^)(void))task
                start:(NSTimeInterval)start
             interval:(NSTimeInterval)interval
               repeat:(BOOL)repeat
                async:(BOOL)async;


+(NSString *)execTask:(id)target
                selector:(SEL)selector
                start:(NSTimeInterval)start
             interval:(NSTimeInterval)interval
               repeat:(BOOL)repeat
                async:(BOOL)async;






+(void)cancleTask:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
