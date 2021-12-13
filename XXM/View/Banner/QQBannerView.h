//
//  QQBannerView.h
//  XXM
//
//  Created by QQ on 2021/12/13.
//

#import <UIKit/UIKit.h>
#import "QQBannerFooter.h"
NS_ASSUME_NONNULL_BEGIN




@protocol QQBannerViewDataSource, QQBannerViewDelegate;


@interface QQBannerView : UIView
/** 是否需要循环滚动, 默认为 NO */
@property (nonatomic, assign) BOOL shouldLoop;
/** 是否显示 footer, 默认为 NO (此属性为 YES 时, shouldLoop 会被置为 NO) */
@property (nonatomic, assign) BOOL showFooter;

/** 是否自动滑动, 默认为 NO */
@property (nonatomic, assign) BOOL autoScroll;

/** 自动滑动间隔时间(s), 默认为 3.0 */
@property (nonatomic, assign) CGFloat scrollInterval;

/** pageControl, 可自由配置其属性 */
@property (nonatomic, strong, readonly) UIPageControl *pageControl;
@property (nonatomic, assign, readwrite)  CGRect pageControlFrame;

/** 当前 item 的 index */
@property (nonatomic, assign) NSInteger currentIndex;
- (void)setCurrentIndex:(NSInteger)currentIndex animated:(BOOL)animated;

@property (nonatomic, weak) id<QQBannerViewDataSource> dataSource;
@property (nonatomic, weak) id<QQBannerViewDelegate> delegate;

- (void)reloadData;

- (void)startTimer;
- (void)stopTimer;

@end
@protocol QQBannerViewDataSource <NSObject>
@required

- (NSInteger)numberOfItemsInBanner:(QQBannerView *)banner;
- (UIView *)banner:(QQBannerView *)banner viewForItemAtIndex:(NSInteger)index;

//@optional
- (NSString *)banner:(QQBannerView *)banner titleForFooterWithState:(QQBannerFooterState)footerState;

@end

@protocol QQBannerViewDelegate <NSObject>
@optional

- (void)banner:(QQBannerView *)banner didSelectItemAtIndex:(NSInteger)index;
- (void)banner:(QQBannerView *)banner didScrollToItemAtIndex:(NSInteger)index;
- (void)bannerFooterDidTrigger:(QQBannerView *)banner;
@end

NS_ASSUME_NONNULL_END
