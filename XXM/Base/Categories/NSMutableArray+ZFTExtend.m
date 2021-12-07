//
//  NSMutableArray+ZFTExtend.m
//  TYGJ
//
//  Created by Eric Mao on 2019/5/10.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import "NSMutableArray+ZFTExtend.h"
#import <objc/message.h>

@implementation NSMutableArray (ZFTExtend)
-(BOOL(^)(id checkID))contains{
    return ^BOOL(id checkID){
        return [self containsObject:checkID];
    };
}

-(BOOL(^)(NSString *str))containsStr{
    return ^BOOL(NSString *str){
        NSArray *ckArray = [[self.rac_sequence map:^id _Nullable(NSString *value) {
            return [value isEqualToString:str]?value:nil;
        }] array];
        return ckArray.count>0;
    };
}

+ (void)load {
    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(addObject:));
    Method toMethod = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(em_addObject:));
    method_exchangeImplementations(fromMethod, toMethod);
}

-(void)em_addObject:(id)anObject{
    if (anObject) {
        [self em_addObject:anObject];
    }
}



- (BOOL(^)(NSArray *array))containsAll
{
    return ^BOOL(NSArray *array){
        //创建俩新的数组
        NSMutableArray *oldArr = [NSMutableArray arrayWithArray:self];
        NSMutableArray *newArr = [NSMutableArray arrayWithArray:array];
        bool bol = false;
        //对数组1排序。
        [oldArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 localizedStandardCompare: obj2];
        }];
        
        //对数组2排序。
        [newArr sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
            return [obj1 localizedStandardCompare: obj2];
            
        }];
        
        if (newArr.count == oldArr.count) {
            
            bol = true;
            for (int16_t i = 0; i < oldArr.count; i++) {
                
                id c1 = [oldArr objectAtIndex:i];
                id newc = [newArr objectAtIndex:i];
                
                if (![newc isEqualToString:c1]) {
                    bol = false;
                    break;
                }
            }
        }
        return bol;
    };
}

- (void(^)(id obj))add
{
    return ^void(id obj){
        [self addObject:obj];
        
    };
}

- (void(^)(NSArray * array))addAll
{
    return ^void(NSArray * array){
        [self addObjectsFromArray:array];
    };
}

- (void(^)(NSInteger index))remove
{
    return ^void(NSInteger index){
        [self removeObjectAtIndex:index];
    };
}

- (void(^)(void))clear
{
    return ^{
        [self removeAllObjects];
    };
}

- (NSMutableArray *)removeRepetition
{
    NSMutableArray *newArray = [NSMutableArray array];
    for (id obj in self) {
        if (![newArray containsObject:obj]) {
            [newArray addObject:obj];
        }
    }
    [self removeAllObjects];
    [self addObjectsFromArray:newArray];
    return self;
}

- (void(^)(int index,NSObject * obj))set
{
    return ^void(int index,NSObject * obj){
        self[index] = obj;
    };
}

//meats.put(@"AI-00001403", itemValueHistory[@"AI-00001403"));
@end
