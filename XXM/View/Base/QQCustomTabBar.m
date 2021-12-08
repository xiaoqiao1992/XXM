//
//  QQCustomTabBar.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQCustomTabBar.h"
#import "QQCustomItemView.h"
@interface QQCustomTabBar()
@property (nonatomic, strong) QQCustomItemView *selectedView;
@end

@implementation QQCustomTabBar{
    NSInteger startTag;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (NSMutableArray *)buttons
{
    if (_buttons == nil) {
        _buttons = [[NSMutableArray alloc] init];
    }
    return _buttons;
}

//重写item的setter方法，接受新的item
-(void)setItem:(UITabBarItem *)item{
    
    _item = item;
    __weak typeof(self) weakSelf = self;
    UIView *addView;
    if (item.image) {
        QQCustomItemView *itemViews = [[QQCustomItemView alloc] init];
        itemViews.tag = 10000 + startTag++;
        [itemViews setTitle:item.title];
        [itemViews setImage:item.image];
        [itemViews setSelectedImage:item.selectedImage];
        
        itemViews.onclickBtnBlock = ^(QQCustomItemView * _Nonnull itemView) {
            [self clickBtnItem:itemView];
        };
        

        [self addSubview:itemViews];
        addView = itemViews;
    }else{
//        if ([item.title isEqualToString:@"+"]) {
//            UIView *view = [[UIView alloc] init];
//            view.bounds = CGRectMake(0, 0, 44, 44);
//            view.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
//            [view.layer setCornerRadius:22.0f];
//            [view.layer setMasksToBounds:YES];
//
//            UIButton *plusBtn = [UIButton new];
//            [plusBtn setImage:[UIImage imageNamed:@"dock_plus"] forState:UIControlStateNormal];
//            [plusBtn setBackgroundColor:kBlue_Color];
//            [plusBtn setBounds:CGRectMake(0, 0, 32, 32)];
//            [plusBtn setCenter:CGPointMake(22, 22)];
//            [plusBtn.layer setCornerRadius:16.0f];
////            [plusBtn.layer setShadowColor:kBlue_ColorAlpha(.35f).CGColor];
////            [plusBtn.layer setShadowRadius:3.0f];
////            [plusBtn.layer setShadowOffset:CGSizeMake(0.0f, 3.0f)];
////            [plusBtn.layer setShadowOpacity:1.0f];
//            [[plusBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//                @strongify(self);
//                [self.clickSubject sendNext:nil];
//            }];
//            [view addSubview:plusBtn];
//            [self addSubview:view];
//            addView = view;
//        }
        
    }
    [self.buttons addObject:addView];
}
/**
 *  自定义TabBar的按钮点击事件
 */
- (void)clickBtnItem:(QQCustomItemView *)view {
    if (view==self.selectedView) {
        return;
    }
    //1.通过代理传递按钮tag
    if ([self.delegate respondsToSelector:@selector(tabBar:selectedFrom:to:)]) {
        [self.delegate tabBar:self selectedFrom:(self.selectedView.tag -10000) to:(view.tag - 10000)];
    }
    
//    ZFTLog(@"点击");
    
    //2.先将之前选中的按钮设置为未选中
    self.selectedView.isSelected = NO;
    
    //3.再将当前按钮设置为选中
    view.isSelected = YES;
    
    //4.最后把当前按钮赋值为之前选中的按钮
    self.selectedView = view;
    
}

//布局子视图

-(void)layoutSubviews{
    [super layoutSubviews];
    //设置frame属性
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
//    CGFloat buttonH = kFitSize(5.0f + 32.0f + 20.0f);// self.frame.size.height;
    
    //获取到视图中的所有子视图
    for (int index = 0; index < self.subviews.count; index++) {
        CGFloat buttonX = buttonW * index;
        UIView *itemView =self.subviews[index];
        if ([itemView isKindOfClass:QQCustomItemView.self]) {
            QQCustomItemView *curItemView = (QQCustomItemView *)itemView;
            itemView.frame =  CGRectMake(buttonX, buttonY, buttonW, kTabbarHeight);
        }else{
            itemView.center = CGPointMake(self.frame.size.width*.5, self.frame.size.height*.5);
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
