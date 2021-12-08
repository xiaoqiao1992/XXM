//
//  QQCustomItemView.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQCustomItemView.h"

@interface QQCustomItemView()
@property (nonatomic, strong) QQCustomButton * button;

@end

@implementation QQCustomItemView

-(instancetype)init{
    self = [super init];
    if (self) {
        //tab 图标
        QQCustomButton *button = [[QQCustomButton alloc] init];
        button.contentMode = UIViewContentModeScaleAspectFit;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:kFont_Normal_Color forState:UIControlStateSelected];
        [button addTarget:self action:@selector(didClickButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.button=button;
    }
    return self;
}

-(void)didClickButton{
    self.onclickBtnBlock(self);
}


-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.button.frame=CGRectMake(0, 0, frame.size.width, frame.size.height);
}

-(void)setTitle:(NSString *)title{
    [self.button setTitle:title forState:UIControlStateNormal];
}

-(void)setImage:(UIImage *)image{
    [self.button setImage:image forState:UIControlStateNormal];
}

-(void)setSelectedImage:(UIImage *)selectedImage{
    [self.button setImage:selectedImage forState:UIControlStateSelected];
}

-(void)setIsSelected:(BOOL)isSelected{
    [self.button setSelected:isSelected];
//    self.bgView.hidden=!isSelected;
    
    if (isSelected){
        [self.button.titleLabel setFont:kR24];
        /*
        CAKeyframeAnimation *animation =[CAKeyframeAnimation animation];
        [animation setValues:@[@(ImageHeightRadio),@(1.4),@(ImageHeightRadio)]];
        [animation setKeyPath:@"transform.scale"];
        animation.repeatCount=1;
        animation.duration=0.1f;
        animation.removedOnCompletion=NO;
        [self.layer addAnimation:animation forKey:NULL];
//        [self.bgView.layer addAnimation:animation forKey:NULL];
         */
    }else{
        [self.button.titleLabel setFont:kL22];
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
