//
//  QQCommonNavigationBar.h
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQCommonNavigationBar : UIView

@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIButton * rightButton;

@property (nonatomic, strong) UIViewController * controller;
@property (nonatomic,copy)void(^onLeftTap)(QQCommonNavigationBar *cusBar,UIButton * leftBtn,UIViewController *viewC);
@property (nonatomic,copy)void(^onRightTap)(QQCommonNavigationBar *cusBar,UIButton * rightBtn,UIViewController *viewC);


-(instancetype)initWithTitle:(NSString *)title controller:(UIViewController *)controller;

- (void)addItemWithLeft:(BOOL)isLeft isImg:(BOOL)isImg content:(NSString *)contenStr block:(void (^)(QQCommonNavigationBar *cusBar,UIButton *btn,UIViewController *viewC))block;




@end

NS_ASSUME_NONNULL_END
