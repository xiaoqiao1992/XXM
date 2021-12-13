//
//  QQBannerFooter.h
//  XXM
//
//  Created by QQ on 2021/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, QQBannerFooterState) {
    QQBannerFooterStateIdle = 0,    // 正常状态下的footer提示
    QQBannerFooterStateTrigger,     // 被拖至触发点的footer提示
};
@interface QQBannerFooter : UICollectionReusableView
@property (nonatomic, assign) QQBannerFooterState state;

@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, copy) NSString *idleTitle;
@property (nonatomic, copy) NSString *triggerTitle;


@end

NS_ASSUME_NONNULL_END
