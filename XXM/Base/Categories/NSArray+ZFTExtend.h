//
//  NSArray+ZFTExtend.h
//  TYGJ
//
//  Created by zft on 2018/5/24.
//  Copyright © 2018年 ZFT. All rights reserved.
//



@interface NSArray (ZFTExtend)

-(id)objectAtIndexCheck:(NSUInteger)index;
/**
 *  转换成JSON串字符串（没有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toJSONString;

/**
 *  转换成JSON串字符串（有可读性）
 *
 *  @return JSON字符串
 */
- (NSString *)toReadableJSONString;

/**
 *  转换成JSON数据
 *
 *  @return JSON数据
 */
- (NSData *)toJSONData;

-(BOOL(^)(id checkID))contains;
-(BOOL(^)(NSString *str))containsStr;

- (BOOL(^)(NSArray *array))containsAll;

- (NSInteger(^)(void))size;

- (id(^)(NSInteger index))get;

- (int(^)(void))length;

@end
