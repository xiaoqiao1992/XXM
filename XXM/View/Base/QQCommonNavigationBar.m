//
//  QQCommonNavigationBar.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "QQCommonNavigationBar.h"


@implementation QQCommonNavigationBar


-(instancetype)initWithTitle:(NSString *)title controller:(UIViewController *)controller{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.controller = controller;
        [self.controller.view addSubview:self];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(kSCREEN_WIDTH));
            make.height.equalTo(@(kStatusBarHeight + kFitSize(44)));
            make.top.equalTo(self.controller.view);
            make.left.equalTo(self.controller.view);
        }];
        
        UILabel *titleLb = [[UILabel alloc] init];
        [titleLb setBackgroundColor:[UIColor clearColor]];
        titleLb.textAlignment = NSTextAlignmentCenter;
        titleLb.font = kL36 ;// kL34;
        titleLb.adjustsFontSizeToFitWidth = YES;
        titleLb.textColor = kFont_Normal_Color;
        titleLb.text = title;
        [self addSubview:titleLb];
        self.titleLabel = titleLb;
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(kFitSize(44));
            make.top.mas_equalTo(self).mas_offset(kStatusBarHeight);
            make.left.right.mas_equalTo(self);
        }];
    }
    return self;
}
- (void)addBackItemWithBlock:(void (^)(QQCommonNavigationBar *cusBar,UIButton *btn,UIViewController *viewC))block{
    [self addItemWithLeft:YES isImg:YES content:@"navigationBar_backV2" block:block];
}

- (void)addItemWithLeft:(BOOL)isLeft isImg:(BOOL)isImg content:(NSString *)contenStr block:(void (^)(QQCommonNavigationBar *cusBar,UIButton *btn,UIViewController *viewC))block
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageView.contentMode=UIViewContentModeCenter;
    
    UIImage *img;
    if (isImg) {
        btn.titleLabel.font= kL36;
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        img = [UIImage imageNamed:contenStr];
        [btn setImage:img forState:UIControlStateNormal];
    }else{
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn setTitle:contenStr forState:UIControlStateNormal];
    }
    if ([contenStr isEqualToString:@"扫一扫"]) {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:contenStr forState:UIControlStateNormal];
    }
    [self addSubview:btn];
    SEL sel;
    if (isLeft)//左边按钮
    {
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kFitSize(20));
            make.height.equalTo(@(kFitSize(30)));
            make.width.equalTo(@(kFitSize(30)));
            make.bottom.equalTo(self.mas_bottom).offset(kFitSize(-7));
        }];

        self.leftButton = btn;
        sel = @selector(leftClick);
        self.onLeftTap = block;
    }else{//右边按钮
        if (isImg) {
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.mas_right).offset(kFitSize(-20));
                make.height.width.equalTo(@(kFitSize(30)));
                make.bottom.equalTo(self.mas_bottom).offset(kFitSize(-7));
            }];
        } else {
            double curWidth = IS_IPHONE_X_Series?kFitSize(80):kFitSize(90);
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.mas_right).offset(kFitSize(-20));
                make.height.equalTo(@(kFitSize(30)));
                make.width.equalTo(@(curWidth));
                make.bottom.equalTo(self.mas_bottom).offset(kFitSize(-7));
            }];
        }
        self.rightButton = btn;
        sel = @selector(rightClick);
        self.onRightTap = block;
    }
    
    [btn addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(kFitSize(44));
        make.top.mas_equalTo(self).mas_offset(kStatusBarHeight);
        make.left.mas_equalTo(self).mas_offset(kFitSize(70.0f));
        make.right.mas_equalTo(self).mas_offset(kFitSize(-70.0f));
    }];
}
- (void)leftClick{
    self.onLeftTap(self,self.leftButton,self.controller);
}

-(void)rightClick{
    self.onRightTap(self, self.rightButton, self.controller);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
