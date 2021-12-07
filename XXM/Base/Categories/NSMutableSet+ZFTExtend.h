//
//  NSMutableSet+ZFTExtend.h
//  TYGJV2
//
//  Created by Eric  on 1/9/20.
//  Copyright © 2020 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableSet (ZFTExtend)
- (void(^)(id obj))add;
@end

NS_ASSUME_NONNULL_END
