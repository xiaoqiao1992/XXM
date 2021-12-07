//
//  NSMutableArray+ZFTExtend.h
//  TYGJ
//
//  Created by Eric Mao on 2019/5/10.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (ZFTExtend)

-(BOOL(^)(id checkID))contains;

-(BOOL(^)(NSString *str))containsStr;

- (BOOL(^)(NSArray *array))containsAll;

- (void(^)(id obj))add;

- (void(^)(NSArray * array))addAll;

- (void(^)(NSInteger index))remove;

- (void(^)(void))clear;

- (NSMutableArray *)removeRepetition;

- (void(^)(int index,NSObject * obj))set;

@end

NS_ASSUME_NONNULL_END
