//
//  QQCommonTools.m
//  XXM
//
//  Created by QQ on 2021/12/9.
//

#import "QQCommonTools.h"

@implementation QQCommonTools
+(NSError *(^)(int errorCode,...))getErrorInfo{
    return  ^NSError *(int errorCode,...){
        va_list args;
        va_start(args, errorCode);
        
        NSString *bundleName = [[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"bundle"];
        NSString *path = [[NSBundle bundleWithPath:bundleName] pathForResource:@"ErrorCode" ofType:@"plist" inDirectory:@"other"];
        NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
        NSString *errorValue = [dic valueForKey:[NSString stringWithFormat:@"%d",errorCode]];
        errorValue = errorValue == nil ?@"未知错误，请稍后再试！":errorValue;
        if (errorCode !=nil ) {
            NSString *para;
            int i=0;
            while ((para = va_arg(args, NSString *))){
                NSString *replaceStr = [NSString stringWithFormat:@"%%%d",i];
                errorValue = [errorValue stringByReplacingOccurrencesOfString:replaceStr withString:para];
                i++;
            }
        }
        
        va_end(args);
        errorCode = errorCode == nil?-999:errorCode;
        return [NSError errorWithDomain:@"错误定义" code:errorCode userInfo:@{@"info":errorValue}];
    };
}
@end
