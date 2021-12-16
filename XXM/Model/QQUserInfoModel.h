//
//  QQUserInfoModel.h
//  XXM
//
//  Created by QQ on 2021/12/15.
//

#import "QQBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQCoinInfo : QQBaseModel
@property (nonatomic, assign) int coinCount;
@property (nonatomic, assign) int level;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * rank;
@property (nonatomic, assign) int userId;
@property (nonatomic, strong) NSString * username;
@end


@interface QQUserModel : QQBaseModel
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


@interface QQTotalUserInfoModel : QQBaseModel
@property (nonatomic, strong) QQCoinInfo * coinInfo;
@property (nonatomic, strong) QQUserModel * userInfo;


@end



@interface QQUserInfoModel : QQBaseModel

@property (nonatomic, strong) QQTotalUserInfoModel * data;
@end

NS_ASSUME_NONNULL_END
