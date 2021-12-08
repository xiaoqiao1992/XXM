//
//  QQCustomButton.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQCustomButton.h"
#define kSplitV 5.0f//垂直间隔
@implementation QQCustomButton

-(instancetype)init{
    self = [super init];
    if (self) {
        //设置文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = kL22;
        //设置图片内容模式居中
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;//UIViewContentModeCenter;
        }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect imageRect = CGRectMake(0, kSplitV, contentRect.size.width, kFitSize(32.0f));
    return imageRect;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0, kFitSize(32.0f+kSplitV), contentRect.size.width, kFitSize(17.0f));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
