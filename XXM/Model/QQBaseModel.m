//
//  QQBaseModel.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQBaseModel.h"
#import <objc/runtime.h>
@implementation QQBaseModel
-(void)encodeWithCoder:(NSCoder *)coder{
    unsigned int count;
    Ivar * ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar var = ivars[i];
        //NSLog(@"%s %s",ivar_getName(var),ivar_getTypeEncoding(var));
        NSString * name = [NSString stringWithUTF8String:ivar_getName(var)];
        [coder encodeObject:[self valueForKey:name] forKey:name];
    }
    free(ivars);
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    self = [super init];

    if (self) {
        unsigned int count;
        Ivar * ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar var = ivars[i];
            //NSLog(@"%s %s",ivar_getName(var),ivar_getTypeEncoding(var));
            NSString * name = [NSString stringWithUTF8String:ivar_getName(var)];
            id value = [coder decodeObjectForKey:name];
            [self setValue:value forKey:name];
        }
        free(ivars);
    }
    return self;
}
@end
