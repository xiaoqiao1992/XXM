//
//  NSMutableSet+ZFTExtend.m
//  TYGJV2
//
//  Created by Eric  on 1/9/20.
//  Copyright © 2020 ZFT. All rights reserved.
//

#import "NSMutableSet+ZFTExtend.h"

@implementation NSMutableSet (ZFTExtend)
- (void(^)(id obj))add
{
    return ^void(id obj){
        [self addObject:obj];
        
    };
}
@end
