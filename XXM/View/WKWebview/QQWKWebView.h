//
//  QQWKWebView.h
//  XXM
//
//  Created by QQ on 2021/12/14.
//

#import <WebKit/WebKit.h>
#import "QQScriptMessage.h"
@class QQWKWebView;
NS_ASSUME_NONNULL_BEGIN

@protocol QQWKWebViewMessageHandleDelegate <NSObject>

- (void)qq_webView:(nonnull QQWKWebView *)webView didReceiveScriptMessage:(nonnull QQScriptMessage *)message;


@end


@interface QQWKWebView : WKWebView<WKScriptMessageHandler,QQWKWebViewMessageHandleDelegate>

//webview加载的url地址
@property (nullable, nonatomic, copy) NSString *webViewRequestUrl;
//webview加载的参数
@property (nullable, nonatomic, copy) NSDictionary *webViewRequestParams;

@property (nonatomic, weak) id <QQWKWebViewMessageHandleDelegate> QQWKWebViewDeelegate;


#pragma mark - Load Url

- (void)loadRequestWithRelativeUrl:(nonnull NSString *)relativeUrl;

- (void)loadRequestWithRelativeUrl:(nonnull NSString *)relativeUrl params:(nullable NSDictionary *)params;

/**
 *  加载本地HTML页面
 *
 *  @param htmlName html页面文件名称
 */
- (void)loadLocalHTMLWithFileName:(nonnull NSString *)htmlName;


/**
 定制化内容，底部添加分享和赞的功能

 @param footerJS 底部的功能部分JS代码
 */
- (void)loadLocalHTML:(nonnull NSString *)htmlName withAddingStyleJS:(nullable NSString *)styleJS funcJS:(nullable NSString *)funcJS FooterJS:(nullable NSString *)footerJS;


#pragma mark - View Method

/**
 *  重新加载webview
 */
- (void)reloadWebView;

#pragma mark - JS Method Invoke

/**
 *  调用JS方法（无返回值）
 *
 *  @param jsMethod JS方法名称
 */
- (void)callJS:(nonnull NSString *)jsMethod;

/**
 *  调用JS方法（可处理返回值）
 *
 *  @param jsMethod JS方法名称
 *  @param handler  回调block
 */
- (void)callJS:(nonnull NSString *)jsMethod handler:(nullable void(^)(__nullable id response))handler;




@end

NS_ASSUME_NONNULL_END
