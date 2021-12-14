//
//  QQScriptMessage.m
//  XXM
//
//  Created by QQ on 2021/12/14.
//

#import "QQScriptMessage.h"

@implementation QQScriptMessage
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:{method:%@,params:%@,callback:%@}>", NSStringFromClass([self class]),self.method, self.params, self.callback];
}
@end
