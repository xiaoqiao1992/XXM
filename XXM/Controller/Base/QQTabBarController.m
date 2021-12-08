//
//  QQTabBarController.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQTabBarController.h"
#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "QQBaseTabBar.h"
#import <objc/runtime.h>
#import "UIImage+ImageEffects.h"
#import "QQNavigationController.h"


@interface QQTabBarController ()<QQCustomTabBarDelegate>

@end

@implementation QQTabBarController
//删除系统自动生成的UITabBarButton
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    object_setClass(self.tabBar, [QQBaseTabBar class]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置自定义的Tabbar
    [self setUpCustomTabbar];
    //创建子控制器
    [self setUpChildcontroller];
   
//    [[ZFTAssistantManager share].clickAssistantSubjct subscribeNext:^(id  _Nullable x) {
//        @strongify(self);
//        [self guideView];
//    }];
    
    self.tabBar.backgroundImage = [[UIImage alloc]init];
    self.tabBar.shadowImage = [[UIImage alloc]init];
    [self addAlphaView];
}


//底部Tabbar与上面有一个10像素的渐变过渡
-(void)addAlphaView{
    float bottomHegiht =10;
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(0,  - bottomHegiht, kSCREEN_WIDTH, bottomHegiht)];
    [alphaView setUserInteractionEnabled:NO];
    [self.tabBar addSubview:alphaView];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, kSCREEN_WIDTH, bottomHegiht);
    gradientLayer.colors = @[(id)[UIColor colorWithHexString:@"F8F8F8" alpha:0].CGColor,(id)[UIColor colorWithHexString:@"F8F8F8" alpha:0.5].CGColor];
    //    gradientLayer.locations = @[@0.0, @0.2, @0.5];    // 颜色的起点位置，递增，并且数量跟颜色数量相等
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    [alphaView.layer insertSublayer:gradientLayer atIndex:0 ];//addSublayer:gradientLayer
}


//- (void)guideView{
//    ZFTPutChoiceViewController * VC = [ZFTPutChoiceViewController new];
//    [self.navigationController pushViewController:VC animated:YES];
//}

#pragma mark - 设置自定义的Tabbar
- (void)setUpCustomTabbar{
    CGRect rect = self.tabBar.bounds;// CGRectMake(0, 0, kSCREEN_WIDTH, kTabbarHeight);
    QQCustomTabBar *customTabbar = [[QQCustomTabBar alloc]initWithFrame:rect];//设置为tabbar自身的bounds
    customTabbar.delegate = self;
    
    UIView *effectview = [UIView new];
    [effectview setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar addSubview:effectview];
//    [effectview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.bottom.equalTo(self.tabBar);
//    }];
    
    
    
    [self.tabBar addSubview:customTabbar]; //必须添加到tabbar上，这样自定义的customTabbar才能跟着控制器移动
    self.tabBar.backgroundColor = [UIColor clearColor];
    self.tabBar.backgroundImage = [UIImage createImageWithColor:[UIColor whiteColor]];
    self.tabBar.translucent = YES;
    self.customTabbar = customTabbar;
    
   
}

#pragma mark - 设置子控制器
-(void)setUpChildcontroller{
    [self addChildViewController:[[NSClassFromString(@"MainViewController") alloc]init] andTitle:@"主页面" andImage:@"tab_home2"];
    [self addChildViewController:[[NSClassFromString(@"SecondViewController") alloc]init] andTitle:@"第二页" andImage:@"tab_home2"];
    [self addChildViewController:[[NSClassFromString(@"ThreeViewController") alloc]init] andTitle:@"第三页" andImage:@"tab_home2"];
    [self addChildViewController:[[NSClassFromString(@"FourViewController") alloc]init] andTitle:@"我的" andImage:@"tab_me2"];
    
    [self setSelectButton:0];
}

/**
 *  添加子控制器
 */
-(void)addChildViewController:(UIViewController *)childVc andTitle:(NSString *)title andImage:(NSString *)imageName{
    
    childVc.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //将childVc的item当做模型传递到自定义的CustomTabbar,那么自定义的CustomTabbar中就能拿到对应的数据从而来设置自定义的按钮属性
    self.customTabbar.item = childVc.tabBarItem;
    
    QQNavigationController *nav = [[QQNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

-(void)tabBar:(QQCustomTabBar *)tabBar selectedFrom:(NSInteger)from to:(NSInteger)to{
    //跳转到相应的视图控制器. (注意：通过selectIndex参数来设置选中了那个控制器)
    self.selectedIndex = to;
}


- (void)setSelectButton:(NSUInteger)selectedIndex{
    [self.customTabbar clickBtnItem:self.customTabbar.buttons[selectedIndex]];
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
