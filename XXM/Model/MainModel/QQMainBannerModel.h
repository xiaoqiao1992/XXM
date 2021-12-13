//
//  QQMainBannerModel.h
//  XXM
//
//  Created by QQ on 2021/12/13.
//

#import "QQBaseModel.h"
#import "QQBannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQMainBannerModel : QQBaseModel
@property (nonatomic, strong) NSArray<QQBannerModel *> * data;

@end

NS_ASSUME_NONNULL_END
