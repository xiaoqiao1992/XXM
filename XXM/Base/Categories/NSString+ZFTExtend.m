//
//  NSString+ZFTExtend.m
//  TYGJ
//
//  Created by zft on 2018/8/13.
//  Copyright © 2018 ZFT. All rights reserved.
//

#import "NSString+ZFTExtend.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (ZFTExtend)

- (NSString *)md5{
    NSData* inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([inputData bytes], (unsigned int)[inputData length], outputData);
    
    NSMutableString* hashStr = [NSMutableString string];
    int i = 0;
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; ++i)
        [hashStr appendFormat:@"%02x", outputData[i]];
    
    return hashStr;
}

- (NSString *)zft_trim{
    if (self==nil) {
        return @"";
    }
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(BOOL)isPhoneNumber {
    //手机号以13,14,15,18,17开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1\\d{10}$";//(3[0-9]|4[57]|5[0-35-9]|8[0-345-9]|7[013678])
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)contains:(NSString *)string
{
    if ([self rangeOfString:string].location != NSNotFound) {
        return YES;
    }else{
        return NO;
    }
}

-(BOOL(^)(NSString *str1))equals{
    return ^BOOL(NSString *str1){
        return [self isEqualToString:[str1 zft_trim]];
    };
}

-(BOOL(^)(NSString *str1))contains{
    return ^BOOL(NSString *str1){
        return [self containsString:str1];
    };
}

- (BOOL(^)(NSString * prefix))startsWith
{
    return ^BOOL(NSString * prefix){
        return [self hasPrefix:prefix];
    };
}

- (NSArray<NSString *> *(^)(NSString *separator))split
{
    return ^NSArray<NSString *> *(NSString *separator){
        return [self componentsSeparatedByString:separator];
    };
}

- (NSString *(^)(NSString *target,NSString * replacement))replaceAll
{
    return ^NSString *(NSString *target,NSString * replacement){
        return [self stringByReplacingOccurrencesOfString:target withString:replacement];
    };
}
/**
 未知类型（仅限字典/数组/字符串）
 
 @param object 字典/数组/字符串
 @return 字符串
 */
+(NSString *)jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [NSString jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [NSString jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [NSString jsonStringWithArray:object];
    }
    return value;
}

/**
 字符串类型转JSON
 
 @param string 字符串类型
 @return 返回字符串
 */
+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"%@",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""]
            ];
}

/**
 数组类型转JSON
 
 @param array 数组类型
 @return 返回字符串
 */
+(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [NSString jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}

/**
 字典类型转JSON
 
 @param dictionary 字典数据
 @return 返回字符串
 */
+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

//判断是否为整形：
- (BOOL(^)(void))isZFTPureInt{//isPureInt
    return ^BOOL{//(NSString*string)
        NSScanner* scan = [NSScanner scannerWithString:self];
        int val;
        return[scan scanInt:&val] && [scan isAtEnd];
    };
}

//判断是否为浮点形：
- (BOOL(^)(void))isZFTPureFloat{//NSString*string
    return ^BOOL{//(NSString*string)
        NSScanner* scan = [NSScanner scannerWithString:self];
        float val;
        return[scan scanFloat:&val] && [scan isAtEnd];
    };
}

- (NSString *(^)(NSString *target,NSString *replacement))replace
{
    return ^NSString *(NSString *target,NSString *replacement){
        return [self stringByReplacingOccurrencesOfString:target withString:replacement];
    };
}

- (BOOL(^)(NSString * str))endsWith
{
    return ^BOOL(NSString * str){
        return [self hasSuffix:str];
    };
}

- (NSString *(^)(int loc,int len))substring
{
    return ^NSString *(int loc,int len){
        return [self substringWithRange:NSMakeRange(loc, len)];
    };
}

+(id)jsonToObject:(NSString *)json{
    //string转data
    NSData * jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    //json解析
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    return obj;
}

#pragma mark 字典转化字符串
+(NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

// 获取字符串的坐标
- (int(^)(NSString * searchString))lastIndexOf
{
    return ^int(NSString * searchString){
        // 从末尾开始搜索
        return (int)[self rangeOfString:searchString options:NSBackwardsSearch].location;
    };
}

//首先声明一个宏定义
#define FileHashDefaultChunkSizeForReadingData 1024*8
CFStringRef FileMD5HashCreateWithPath(CFStringRef filePath,
                                       size_t chunkSizeForReadingData) {
    
    // Declare needed variables
    CFStringRef result = NULL;
    CFReadStreamRef readStream = NULL;
    
    // Get the file URL
    CFURLRef fileURL =
    CFURLCreateWithFileSystemPath(kCFAllocatorDefault,
                                  (CFStringRef)filePath,
                                  kCFURLPOSIXPathStyle,
                                  (Boolean)false);
    if (!fileURL) goto done;
    
    // Create and open the read stream
    readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault,
                                            (CFURLRef)fileURL);
    if (!readStream) goto done;
    bool didSucceed = (bool)CFReadStreamOpen(readStream);
    if (!didSucceed) goto done;
    
    // Initialize the hash object
    CC_MD5_CTX hashObject;
    CC_MD5_Init(&hashObject);
    
    // Make sure chunkSizeForReadingData is valid
    if (!chunkSizeForReadingData) {
        chunkSizeForReadingData = FileHashDefaultChunkSizeForReadingData;
    }
    
    // Feed the data to the hash object
    bool hasMoreData = true;
    while (hasMoreData) {
        uint8_t buffer[chunkSizeForReadingData];
        CFIndex readBytesCount = CFReadStreamRead(readStream,
                                                  (UInt8 *)buffer,
                                                  (CFIndex)sizeof(buffer));
        if (readBytesCount == -1) break;
        if (readBytesCount == 0) {
            hasMoreData = false;
            continue;
        }
        CC_MD5_Update(&hashObject,(const void *)buffer,(CC_LONG)readBytesCount);
    }
    
    // Check if the read operation succeeded
    didSucceed = !hasMoreData;
    
    // Compute the hash digest
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(digest, &hashObject);
    
    // Abort if the read operation failed
    if (!didSucceed) goto done;
    
    // Compute the string result
    char hash[2 * sizeof(digest) + 1];
    for (size_t i = 0; i < sizeof(digest); ++i) {
        snprintf(hash + (2 * i), 3, "%02x", (int)(digest[i]));
    }
    result = CFStringCreateWithCString(kCFAllocatorDefault,
                                       (const char *)hash,
                                       kCFStringEncodingUTF8);
    
done:
    
    if (readStream) {
        CFReadStreamClose(readStream);
        CFRelease(readStream);
    }
    if (fileURL) {
        CFRelease(fileURL);
    }
    return result;
}
/// 第二种方式计算大文件MD5
+ (NSString*)getBigfileMD5:(NSString*)path{
    return (__bridge_transfer NSString *)FileMD5HashCreateWithPath((__bridge CFStringRef)path, FileHashDefaultChunkSizeForReadingData);
}
@end
