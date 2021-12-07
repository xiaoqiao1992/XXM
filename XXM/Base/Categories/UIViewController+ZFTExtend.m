//
//  UIViewController+ZFTExtend.m
//  TYGJV2
//
//  Created by Eric  on 2019/9/24.
//  Copyright © 2019 ZFT. All rights reserved.
//

#import "UIViewController+ZFTExtend.h"
#import <objc/message.h>


@implementation UIViewController (ZFTExtend)

static char kAssociatedParamsObjectKey;
- (void)setParams:(NSDictionary *)paramsDictionary{
    objc_setAssociatedObject(self, &kAssociatedParamsObjectKey, paramsDictionary,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)params{
    return objc_getAssociatedObject(self, &kAssociatedParamsObjectKey);
}

//+ (void)load{
//    Method presentWithName = class_getClassMethod(self, @selector(zftpresentViewController:animated:completion:));
//    Method presentName = class_getClassMethod(self, @selector(presentViewController:animated:completion:));
//    method_exchangeImplementations(presentWithName, presentName);
//}
//
//-(void)zftpresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
//    UIImage *previousImage = UIImage.viewToImage(self.view.window);
//    previousImage = previousImage==nil?[NSNull null]:previousImage;
//    [viewControllerToPresent.params setValue:previousImage forKey:kPreviousVCImage];
//    [self zftpresentViewController:viewControllerToPresent animated:flag completion:completion];
//}



@end
