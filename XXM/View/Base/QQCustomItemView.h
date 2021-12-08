//
//  QQCustomItemView.h
//  XXM
//
//  Created by QQ on 2021/12/8.
//

#import <UIKit/UIKit.h>
#import "QQCustomButton.h"
@class QQCustomItemView;
NS_ASSUME_NONNULL_BEGIN
typedef void(^didClickBtnBlock)(QQCustomItemView * itemView);

@interface QQCustomItemView : UIView
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIImage *image;
@property (nonatomic,strong) UIImage *selectedImage;
@property (nonatomic,assign) BOOL isSelected;
@property (nonatomic, copy) didClickBtnBlock onclickBtnBlock;

@end

NS_ASSUME_NONNULL_END
