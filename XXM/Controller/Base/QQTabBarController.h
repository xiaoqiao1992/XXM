//
//  QQTabBarController.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <UIKit/UIKit.h>
#import "QQCustomTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@interface QQTabBarController : UITabBarController
@property (strong,nonatomic) QQCustomTabBar *customTabbar;
- (void)setSelectButton:(NSUInteger)selectedIndex;
@end

NS_ASSUME_NONNULL_END
