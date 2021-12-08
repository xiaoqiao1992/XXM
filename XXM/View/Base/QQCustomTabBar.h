//
//  QQCustomTabBar.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <UIKit/UIKit.h>
@class QQCustomTabBar;
NS_ASSUME_NONNULL_BEGIN

@protocol QQCustomTabBarDelegate <NSObject>
//选中按钮,切换视图,从当前选中的按钮到新的要选中的按钮
- (void)tabBar:(QQCustomTabBar *)tabBar selectedFrom:(NSInteger)from  to:(NSInteger)to;


@end

@interface QQCustomTabBar : UIView
@property (strong,nonatomic) UITabBarItem *item;
@property (assign,nonatomic) id<QQCustomTabBarDelegate> delegate;
@property (nonatomic, strong) NSMutableArray * buttons;

- (void)clickBtnItem:(UIButton *) button;

@end

NS_ASSUME_NONNULL_END
