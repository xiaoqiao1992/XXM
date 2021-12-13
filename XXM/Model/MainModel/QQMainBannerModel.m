//
//  QQMainBannerModel.m
//  XXM
//
//  Created by QQ on 2021/12/13.
//

#import "QQMainBannerModel.h"

@implementation QQMainBannerModel
-(void)setData:(NSArray<QQBannerModel *> *)data{
    NSMutableArray<QQBannerModel *> * array = [[NSMutableArray alloc] init];
    for (int i = 0; i < data.count; i++) {
        [array addObject:[QQBannerModel mj_objectWithKeyValues:data[i]]];
    }
    _data = array;
}
@end
