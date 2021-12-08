//
//  QQBaseTabBar.m
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import "QQBaseTabBar.h"

@implementation QQBaseTabBar
-(instancetype)init{
    if (self = [super init]) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(CGSize)sizeThatFits:(CGSize)size{
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height= kTabbarHeight;
    return sizeThatFits;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
