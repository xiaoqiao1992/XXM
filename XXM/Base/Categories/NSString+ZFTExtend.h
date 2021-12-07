//
//  NSString+ZFTExtend.h
//  TYGJ
//
//  Created by zft on 2018/8/13.
//  Copyright © 2018 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kStrIsEmpty(str)    ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO)
#define IS_NULL(x)          (!x || [x isKindOfClass:[NSNull class]])
#define IS_EMPTY_STRING(x)  (IS_NULL(x) || [x isEqual:@""] || [x isEqual:@"(null)"] || [x isEqual:@"<null>"] || [x isEqual:@"-"] || [x isEqual:@"--"])


@interface NSString (ZFTExtend)
- (NSString *)md5;
- (NSString *)zft_trim;

- (BOOL)isPhoneNumber;

/**
 判断字符串是否包含某个字符串

 @param string string
 @return BOOL
 */
- (BOOL)contains:(NSString *)string;

-(BOOL(^)(NSString *str1))equals;

-(BOOL(^)(NSString *str1))contains;

- (BOOL(^)(NSString * prefix))startsWith;

- (NSArray<NSString *> *(^)(NSString *separator))split;

- (NSString *(^)(NSString *target,NSString * replacement))replaceAll;
/**
 未知类型（仅限字典/数组/字符串）
 
 @param object 字典/数组/字符串
 @return 字符串
 */
+(NSString *) jsonStringWithObject:(id) object;

/**
 字典类型转JSON
 
 @param dictionary 字典数据
 @return 返回字符串
 */
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;


/**
 数组类型转JSON
 
 @param array 数组类型
 @return 返回字符串
 */
+(NSString *) jsonStringWithArray:(NSArray *)array;


/**
 字符串类型转JSON
 
 @param string 字符串类型
 @return 返回字符串
 */
+(NSString *) jsonStringWithString:(NSString *) string;

//判断是否为整形：
- (BOOL(^)(void))isZFTPureInt;//

//判断是否为浮点形：
- (BOOL(^)(void))isZFTPureFloat;

- (NSString *(^)(NSString *target,NSString *replacement))replace;

- (NSString *(^)(int loc,int len))substring;

- (BOOL(^)(NSString * str))endsWith;

- (int(^)(NSString * searchString))lastIndexOf;

#pragma mark 字典转化字符串
+ (NSString *)dictionaryToJson:(NSDictionary *)dic;

/// 第二种方式计算大文件MD5
+ (NSString*)getBigfileMD5:(NSString*)path;
@end
