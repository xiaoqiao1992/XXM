//
//  NSMutableDictionary+ZFTExtend.h
//  TYGJ
//
//  Created by Eric Mao on 2019/5/10.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableDictionary (ZFTExtend)

- (void(^)(id key,id value))put;

- (id(^)(id key))get;

- (BOOL(^)(void))isEmpty;

- (int(^)(void))size;

- (void(^)(id key))remove;

- (void(^)(void))clear;

@end

NS_ASSUME_NONNULL_END
