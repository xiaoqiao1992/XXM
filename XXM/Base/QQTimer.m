//
//  QQTimer.m
//  GCD定时器 - 02
//
//  Created by QQ on 2021/11/25.
//

#import "QQTimer.h"

@implementation QQTimer

static NSMutableDictionary * timers;
dispatch_semaphore_t semaphore;


+(void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers = [[NSMutableDictionary alloc] init];
        semaphore = dispatch_semaphore_create(1);
    });
}


+(NSString *)execTask:(void (^)(void))task start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async{
    
    if (!task || start < 0 || (interval <= 0 && repeat)) {
        return nil;
    }

    //队列
    dispatch_queue_t queue = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    //创建定时器
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //设置时间
    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, start * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
    
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    //唯一标识符
    NSString * name = [NSString stringWithFormat:@"%zd",timers.count];
    //放到字典中
    timers[name] = timer;
    dispatch_semaphore_signal(semaphore);

    //设置回调
    dispatch_source_set_event_handler(timer, ^{
        task();
        if (!repeat) {
            [self cancleTask:name];
        }
    });
    
    //启动定时器
    dispatch_resume(timer);
   
    return name;
}


+(NSString *)execTask:(id)target selector:(SEL)selector start:(NSTimeInterval)start interval:(NSTimeInterval)interval repeat:(BOOL)repeat async:(BOOL)async{
    
  if (!target || !selector) {
      return nil;
    }
    
    return [self execTask:^{
        if ([target respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [target performSelector:selector];
#pragma clang diagnostic pop
        }
    } start:start interval:interval repeat:repeat async:async];
}



+(void)cancleTask:(NSString *)name{
    if (name.length == 0) {
        return;
    }
    dispatch_source_t timer = timers[name];
    if (!timer) {
        return;
    }
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    dispatch_source_cancel(timer);
    [timers removeObjectForKey:name];
    dispatch_semaphore_signal(semaphore);
}
@end
