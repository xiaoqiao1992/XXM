//
//  NSDictionary+ZFTExtend.h
//  TYGJ
//
//  Created by Eric Mao on 2019/5/17.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ZFTExtend)
/**
 实体转字典
 */
+ (NSDictionary*)getObjectData:(id)obj;

- (BOOL(^)(void))isEmpty;

- (int(^)(void))size;

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

- (id(^)(id key))get;

@end

NS_ASSUME_NONNULL_END
