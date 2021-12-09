//
//  QQNetwork.h
//  TYGJ
//
//  Created by zft on 2018/3/8.
//  Copyright © 2018年 zft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

typedef  enum{
    QQHttpRequestMethodPost=1,
    QQHttpRequestMethodGet=2,
    QQHttpRequestMethodWebPost=3,
    QQHttpRequestMethodWebGet=4
}QQHTTPRequestMethod;

typedef enum{
    QQNetworkAvaliableTypeUnknown=0,//未知
    QQNetworkAvaliableTypeAvablie,
    QQNetworkAvaliableTypeUnAvabile
}QQNetworkAvaliableType;

@interface QQNetwork : NSObject

+ (QQNetwork *_Nullable)Network;

@property (nonatomic,assign,readonly) bool curHasNetWork;
@property (nonatomic,assign,readonly) AFNetworkReachabilityStatus netStatus;
/**
 post/get host为空使用默认的
 */
- (void)dataWithUrl:(NSString *)url Host:(NSString *)host param:(NSDictionary *)param method:(QQHTTPRequestMethod)method modelClassName:(Class)className onProgress:(void (^)(NSProgress * _Nonnull))onProgress  onComplete:(void (^)(id data))onComplete onFault:(void (^)(id error))onFault;

- (void)dataWithUrl:(NSString *)url Host:(NSString *)host param:(NSDictionary *)param method:(QQHTTPRequestMethod)method modelClassName:(Class)className onProgress:(void (^)(NSProgress * _Nonnull))onProgress onCompleteIsEnd:(void (^)(id data,BOOL isEnd))onComplete onFault:(void (^)(id error))onFault;

@end
