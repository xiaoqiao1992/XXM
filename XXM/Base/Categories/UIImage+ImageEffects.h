

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, ZFTThumbType){
    ZFTThumbTypeDefault = 1,
    ZFTThumbTypeWidthLimit,
    ZFTThumbTypeHeightLimit,
    ZFTThumbTypeScale,
    ZFTThumbTypeScaleBigPicture,
    ZFTThumbTypeDefaultRegulateSize_UP,
    ZFTThumbTypeDefaultRegulateSize_Center,
    
};

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor alpha:(CGFloat)alpha;



#pragma mark - 图片、颜色
+(UIImage*) createImageWithColor: (UIColor*) color;
/**
 UIImage转base64
 */
+(NSString *(^)(UIImage *img))getBase64WithUIImage;
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize scale:(float)scale;
+(UIImage*)scaleToSize:(UIImage*)image  size:(CGSize)size type:(ZFTThumbType)type;
//View to image
+(UIImage *(^)(UIView *view))viewToImage;

@end
