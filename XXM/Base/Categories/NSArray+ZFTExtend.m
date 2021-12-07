//
//  NSArray+ZFTExtend.m
//  TYGJ
//
//  Created by zft on 2018/5/24.
//  Copyright © 2018年 ZFT. All rights reserved.
//

#import "NSArray+ZFTExtend.h"

@implementation NSArray (ZFTExtend)

-(id)objectAtIndexCheck:(NSUInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSString *)toJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

- (NSString *)toReadableJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data
                                             encoding:NSUTF8StringEncoding];
    return string;
}

- (NSData *)toJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    
    return data;
}

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

- (NSInteger(^)(void))size
{
    return ^NSInteger(void){
        return self.count;
    };
}

- (id(^)(NSInteger index))get
{
    return ^id(NSInteger index){
        return [self objectAtIndex:index];
    };
}

- (int(^)(void))length
{
    return ^int(void){
        return self.count;
    };
}

@end
