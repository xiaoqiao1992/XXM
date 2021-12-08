//
//  QQBaseModel.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQBaseModel : NSObject
//  "errorCode": 0,
//"errorMsg": ""

@property (nonatomic, strong) NSString * errorMsg;
@property (nonatomic, assign) int errorCode;



@end

NS_ASSUME_NONNULL_END
