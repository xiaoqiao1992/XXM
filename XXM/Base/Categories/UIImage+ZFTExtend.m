//
//  UIImage+ZFTExtend.m
//  TYGJ
//
//  Created by zft on 2018/4/28.
//  Copyright © 2018 ZFT. All rights reserved.
//

#import "UIImage+ZFTExtend.h"
#import <objc/message.h>


@implementation UIImage (ZFTExtend)
static float curScale;
static NSString *bundleName;
+ (void)load{

    curScale  = 3;// [UIScreen mainScreen].scale;//改政策，默认3
    bundleName = [[NSBundle mainBundle] pathForResource:@"Resource" ofType:@"bundle"];
    Method imageWithName = class_getClassMethod(self, @selector(imageZFTOriginalWithImageName:));
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    method_exchangeImplementations(imageWithName, imageName);
}

+ (id)imageZFTOriginalWithImageName:(NSString *)name{
    float otherScale = 2;// curScale==2?3:2;//改政策，默认用3,没有在用2
    NSString *picImageName = [NSString stringWithFormat:@"%@@%.fx",name,curScale];
    NSString *pic2ImageName = [NSString stringWithFormat:@"%@@%.fx",name,otherScale];
    NSString *imagePath = [[NSBundle bundleWithPath:bundleName] pathForResource:picImageName ofType:@"png" inDirectory:@"images"];
    NSString *image2Path = [[NSBundle bundleWithPath:bundleName] pathForResource:pic2ImageName ofType:@"png" inDirectory:@"images"];
    UIImage *image = [[self imageZFTOriginalWithImageName:imagePath] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (image==nil) {
        image = [[self imageZFTOriginalWithImageName:image2Path] imageWithRenderingMode:UIImageRenderingModeAutomatic];
    }

    if (image == nil) {
        image = [self imageZFTOriginalWithImageName:name];
    }
    
    if (image == nil) {
        NSLog(@"image: %@ is null",name);
        
//        if (!kIsAppRelease) {
//            if (!IS_EMPTY_STRING(name)) {
//                ZFTThirdNeedUserAcessTools.recordEventID(@"This Image File Not Exist",@{@"file":name,@"version":[NSString stringWithFormat:@"%@-%@",kAPP_VERSION,kAPP_BUILD]});
//            }
//        }
    }
    return image;
}


@end
