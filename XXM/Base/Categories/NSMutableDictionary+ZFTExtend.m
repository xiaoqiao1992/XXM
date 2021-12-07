//
//  NSMutableDictionary+ZFTExtend.m
//  TYGJ
//
//  Created by Eric Mao on 2019/5/10.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import "NSMutableDictionary+ZFTExtend.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (ZFTExtend)

+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(em_setObject:forKey:));
    method_exchangeImplementations(fromMethod, toMethod);
}

- (void)em_setObject:(id)emObject forKey:(NSString *)key {
    if (emObject && key) {
        [self em_setObject:emObject forKey:key];
    }
}

-(void(^)(id key,id value))put{
    return ^(id key,id value){
        [self setValue:value forKey:key];
    };
}

- (id(^)(id key))get
{
    return ^id(NSString *key){
        return [self valueForKey:key];
    };
}

//isEmpty()

- (BOOL(^)(void))isEmpty
{
    return ^BOOL(void){
        return self.count == 0;
    };
}

- (int(^)(void))size
{
    return ^int(void){
        return self.count;
    };
}

- (void(^)(id key))remove
{
    return ^void(id key){
        [self removeObjectForKey:key];
    };
}

- (void(^)(void))clear
{
    return ^{
        [self removeAllObjects];
    };
}


@end
