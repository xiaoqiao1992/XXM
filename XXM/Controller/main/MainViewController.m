//
//  MainViewController.m
//  XXM
//
//  Created by QQ on 2021/12/7.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "QQMainBannerModel.h"
#import "SDWebImage.h"
#import "MainWKWebviewViewController.h"
@interface MainViewController ()<QQBannerViewDelegate,QQBannerViewDataSource>
@property (nonatomic, strong) QQBannerView *banner;
@property (nonatomic, strong) NSArray<QQBannerModel *> * dataArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置banner
    [self setUpBanner];
    __weak typeof(MainViewController *) weakSelf = self;
    [QQDataManager netWorkMainBannerWithParam:@{} onComplete:^(QQMainBannerModel * _Nonnull data) {
        weakSelf.dataArray = data.data;
        [weakSelf.banner reloadData];
    } onFault:^(id  _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

-(void)setUpBanner{
    self.banner = [[QQBannerView alloc] init];
    self.banner.dataSource = self;
    self.banner.delegate = self;
    self.banner.showFooter = YES;
//    self.banner.shouldLoop = YES;
    self.banner.autoScroll = YES;
    [self.view addSubview:self.banner];
    
    // 设置frame
    self.banner.frame = CGRectMake(0,
                                   kNavigationHeight,
                                   kSCREEN_WIDTH,
                                   kFitSize(192));
}

#pragma mark - ZYBannerViewDataSource

// 返回 Banner 需要显示 Item(View) 的个数
- (NSInteger)numberOfItemsInBanner:(QQBannerView *)banner
{
    return self.dataArray.count;
}

// 返回 Banner 在不同的 index 所要显示的 View (可以是完全自定义的v iew, 且无需设置 frame)
- (UIView *)banner:(QQBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    // 取出数据
    QQBannerModel * model = self.dataArray[index];
    // 创建将要显示控件
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.imagePath] placeholderImage:[UIImage imageNamed:@""]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return imageView;
}

// 返回 Footer 在不同状态时要显示的文字
- (NSString *)banner:(QQBannerView *)banner titleForFooterWithState:(QQBannerFooterState)footerState
{
    if (footerState == QQBannerFooterStateIdle) {
        return @"拖动进入下一页";
    } else if (footerState == QQBannerFooterStateTrigger) {
        return @"释放进入下一页";
    }
    return nil;
}

#pragma mark - ZYBannerViewDelegate

// 在这里实现点击事件的处理
- (void)banner:(QQBannerView *)banner didSelectItemAtIndex:(NSInteger)index
{
    QQBannerModel * model = self.dataArray[index];
    MainWKWebviewViewController * vc = [MainWKWebviewViewController new];
    vc.url = model.url;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"点击了第%ld个项目", (long)index);
}

- (void)banner:(QQBannerView *)banner didScrollToItemAtIndex:(NSInteger)index
{
    NSLog(@"滚动到第%ld个项目", (long)index);
}

// 在这里实现拖动 Footer 后的事件处理
- (void)bannerFooterDidTrigger:(QQBannerView *)banner
{
    NSLog(@"触发了footer");
    ViewController * vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
