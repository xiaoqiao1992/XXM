//
//  QQNetwork.m
//  TYGJ
//
//  Created by QQ on 2018/3/8.
//  Copyright © 2018年 QQ. All rights reserved.
//

#import "QQNetwork.h"
#define kTimeoutInterval 15.0f //默认超时时间
#import "QQBaseModel.h"
#import <MJExtension.h>
#import "QQCommonTools.h"
#import "NSString+ZFTExtend.h"




static QQNetworkAvaliableType hasNetWork = QQNetworkAvaliableTypeUnknown;
static AFNetworkReachabilityStatus curReachabilityStatus = AFNetworkReachabilityStatusUnknown;

@interface QQNetwork()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation QQNetwork

-(bool)curHasNetWork{
    return hasNetWork;
}

-(AFNetworkReachabilityStatus)netStatus{
    return curReachabilityStatus;
}



+(QQNetwork *)Network{
    static QQNetwork *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[self alloc] init];
        [instance cheakNetworkStatus];
    });
    
    return instance;
}
- (id)init{
    if (self = [super init]){
        [self initializeNetwork];
    }
    return self;
}

#pragma mark 请求

/**
 post/get host为空使用默认的
 */
- (void)dataWithUrl:(NSString *)url Host:(NSString *)host param:(NSDictionary *)param method:(QQHTTPRequestMethod)method modelClassName:(Class)className onProgress:(void (^)(NSProgress * _Nonnull))onProgress onComplete:(void (^)(id data))onComplete onFault:(void (^)(id error))onFault{
    [self dataWithUrl:url Host:host param:param method:method modelClassName:className onProgress:onProgress onCompleteIsEnd:^(id inData, BOOL isEnd) {
        if (onComplete) {
            onComplete(inData);
        }
    } onFault:onFault];
}
- (void)dataWithUrl:(NSString *)url Host:(NSString *)host param:(NSDictionary *)param method:(QQHTTPRequestMethod)method modelClassName:(Class)className onProgress:(void (^)(NSProgress * _Nonnull))onProgress onCompleteIsEnd:(void (^)(id data,BOOL isEnd))onComplete onFault:(void (^)(id error))onFault{
    if (url == nil){
        if (onComplete) {
            onComplete(nil,YES);
        }
        if (onFault) {
            onFault(nil);
        }
        return;
    }
    if (!onComplete) {
        return;
    }
    if (hasNetWork==QQNetworkAvaliableTypeUnAvabile) {
        NSError *retError = QQCommonTools.getErrorInfo(-23,nil);
        if (onFault) {
            onFault(retError);
            NSLog(@"%@",retError);
        }
        return;
    }
    
    if(className==nil){
        className=QQBaseModel.self;
    }
    
    NSDictionary *headersDic;
    if (method==QQHttpRequestMethodWebPost||method==QQHttpRequestMethodWebGet) {
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [headersDic setValue:@"1" forKey:@"Upgrade-Insecure-Requests"];
    }else{
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer =  [AFJSONResponseSerializer serializer];
        [headersDic setValue:@"0" forKey:@"Upgrade-Insecure-Requests"];
    }
    _manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"Keep-Alive",@"connection", nil];
    url=host==nil?[QQAppURL stringByAppendingPathComponent:url]:[host stringByAppendingPathComponent:url];
    
    //处理传递的参数 begin
    param==nil?(param=[NSDictionary dictionary]):nil;
    NSMutableDictionary *paramOP = [NSMutableDictionary dictionaryWithDictionary:param];
    
    if(![[paramOP allKeys] containsObject:@"token"] && (method==QQHttpRequestMethodPost||method==QQHttpRequestMethodWebPost)) {
        [paramOP setObject:[QQAccountManager share].accountModel.token forKey:@"token"];
    }
    
    
    //结果处理
    if (method==QQHttpRequestMethodGet||method==QQHttpRequestMethodWebGet) {
        [_manager GET:url parameters:paramOP headers:headersDic progress:^(NSProgress * _Nonnull downloadProgress) {
            if(onProgress){
                onProgress(downloadProgress);
            }
//            QQLog(@"onProgress:%@",downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

            if (method==QQHttpRequestMethodWebGet) {
                onComplete(responseObject,YES);
            }else{
                [self resultOP:responseObject modelClassName:className onComplete:^(id outData, BOOL isEnd) {
                    if (onComplete) {
                        onComplete(outData,isEnd);
                    }
                } onFault:onFault];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
            if (onFault) {
                onFault(error);
                NSLog(@"%@",error);
            }
        }];
    }else if (method==QQHttpRequestMethodPost||method==QQHttpRequestMethodWebPost){//post
        
        [_manager POST:url parameters:paramOP headers:headersDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (method==QQHttpRequestMethodWebPost) {
                onComplete(responseObject,YES);
            }else {
                [self resultOP:responseObject modelClassName:className onComplete:^(id outData, BOOL isEnd) {
                    if (onComplete) {
                        onComplete(outData,isEnd);
                    }
                } onFault:onFault];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (onFault) {
                onFault(error);
            }
        }];
    }
}

-(void)resultOP:(id  _Nullable)responseObject modelClassName:(Class)className onComplete:(void (^)(id data,BOOL isEnd))onComplete onFault:(void (^)(id error))onFault{
//    if ([className isEqual:NSDictionary.self] || [className isEqual:QQBaseModel.self] || [className isEqual:QQAccountModel.self]) {
    NSDictionary *returnDic = (NSDictionary *)responseObject;
    if (![returnDic isKindOfClass:NSDictionary.self]) {
        if (onFault) {
            NSError *dicError = QQCommonTools.getErrorInfo(-81,nil);
            onFault(dicError);
        }
        return;
    }
    
    NSArray<NSString *> *checkArr = [returnDic allKeys];
    NSMutableArray * checkStrArray = [NSMutableArray array];
    for (int i = 0; i < checkArr.count; i++) {
        NSString * value = checkArr[i];
        if ([value isEqualToString:@"errorCode"]) {
            [checkStrArray addObject:@YES];
        }
    }
    
    BOOL curIsEnd = YES;
    NSString *isEndStr = [returnDic objectForKey:@"isEnd"];
    if (!IS_EMPTY_STRING(isEndStr) && isEndStr !=nil && ![[isEndStr zft_trim] isEqualToString:@""]) {
        curIsEnd = [isEndStr isEqualToString:@"Y"]?YES:NO;
    }
    
    if (checkStrArray!=nil && checkStrArray.count>0) {//如果包含了code字段
         if([[responseObject objectForKey:@"errorCode"] intValue]==0){//当获取成功后服务端返回0；//当失败时服务端返回2
             if ([className isEqual:NSDictionary.self]) {
                 onComplete(responseObject,curIsEnd);
             }else{
                 onComplete([className mj_objectWithKeyValues:responseObject],curIsEnd);
             }
         }else{
             if (onFault) {
                 NSString *errorStr = [responseObject objectForKey:@"errorMsg"];
//                 errorStr = (errorStr == nil || [[errorStr QQ_trim] isEqualToString:@""])?@"网络故障，请稍候再试":errorStr;
                 
                 int errorCode = [[responseObject objectForKey:@"errorCode"] intValue];
                 if (errorCode == 2) {//token错误
                     
                     NSString *userInfo = [NSString stringWithFormat:@"ID:%.f --- token:%@ 被踢出 --- class:%@",[QQAccountManager share].accountModel.userid,[QQAccountManager share].accountModel.token,[self class]];
                     //[[NSNotificationCenter defaultCenter] postNotificationName:kUserLogoutForOtherReasonNotificationCenter object:nil];
                 }
                 NSError *retError = [NSError errorWithDomain:@"错误" code:errorCode userInfo:@{@"info":errorStr}];
//                 [QQProgressHUD showMessage:errorStr];
                 onFault(retError);
             }
         }
    }else{
        if ([className isEqual:NSDictionary.self]) {
            onComplete(responseObject,curIsEnd);
        }else{
            onComplete([className mj_objectWithKeyValues:responseObject],curIsEnd);
        }
    }
//    }else{
//        onComplete([className mj_objectWithKeyValues:responseObject]);
//    }
}

#pragma mark 初始化网络
- (void)initializeNetwork{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = kTimeoutInterval;
    self.manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    [self.manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    self.manager.requestSerializer.timeoutInterval = kTimeoutInterval;
    [self.manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    self.manager.securityPolicy.allowInvalidCertificates = YES;;
    self.manager.securityPolicy.validatesDomainName = NO;
}


#pragma mark 网络状态
static QQNetworkAvaliableType curNetStatus = QQNetworkAvaliableTypeUnAvabile;
- (void)cheakNetworkStatus{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        curReachabilityStatus = status;
        if (status<AFNetworkReachabilityStatusReachableViaWWAN) {//无网
            hasNetWork=QQNetworkAvaliableTypeUnAvabile;
        }else{
            hasNetWork=QQNetworkAvaliableTypeAvablie;
        }
        if (curNetStatus!=hasNetWork) {
            curNetStatus = hasNetWork;
            //[[NSNotificationCenter defaultCenter] postNotificationName:kNetStatusChangedNotificationCenter object:nil userInfo:@{@"status":@(curNetStatus)}];
        }
    }] ;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

#pragma mark - other function

@end
