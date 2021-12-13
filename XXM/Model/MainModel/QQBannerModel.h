//
//  QQBannerModel.h
//  XXM
//
//  Created by QQ on 2021/12/13.
//

#import "QQBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQBannerModel : QQBaseModel

@property (nonatomic, strong) NSString * desc;
@property (nonatomic, assign) int _ID;
@property (nonatomic, strong) NSString * imagePath;
@property (nonatomic, assign) BOOL isVisible;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSString * url;

@end

NS_ASSUME_NONNULL_END
