//
//  QQLoginModel.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <Foundation/Foundation.h>
#import "QQBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface QQLoginModel : QQBaseModel
@property (nonatomic, assign) BOOL admin;
@property (nonatomic, strong) NSArray * chapterTops;
@property (nonatomic, assign) int coinCount;
@property (nonatomic, strong) NSArray * collectIds;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) int _ID;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * publicName;
@property (nonatomic, strong) NSString * token;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString * username;
@end

NS_ASSUME_NONNULL_END
