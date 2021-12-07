//
//  NSDate+ZFTExtend.h
//  TYGJ
//
//  Created by zft on 2018/8/13.
//  Copyright © 2018 ZFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#define ELAPSETIME2YEAR 60*60*24*365*2
#define ELAPSETIME24  60*60*24
#define ELAPSETIME1  60*60
#define ELAPSETIME1MIN 60
#define kNowDate NSDate.getDateStringFromDate([NSDate new],kTimeNormalFormat) //获取当前日期 例如 2018-05-30


@interface NSDate (ZFTExtend)

extern NSString * const kTimeCommonFormat;//全日期格式(带毫秒)
extern NSString * const kTimeCommonsFormat;//全日期格式
extern NSString * const kTimeNormalFormat;//默认日期格式
extern NSString * const kTimeNormalYMFormat;//默认年月
extern NSString * const kTimeNormalMdFormat;
extern NSString * const kTimeNormalHmFormat;//默认时间格式
extern NSString * const kTimeNormalhmFormat;
extern NSString * const kTimeNormalDotFormat;//默认日期格式
extern NSString * const kTimeyyyyMMddHHmmFormat;//年月日时分
extern NSString * const kDefaultDate; //默认日期
extern NSString * const kBeginTimeStr;//一天开始
extern NSString * const kEndTimeStr;//一天结束

#pragma mark - 时间类
/**
 分别单独获取年月日时分秒
 */
+(NSDateComponents *)getYMDHMS:(NSString *)timeStr dateFormatStr:(NSString *)dateFormatStr;
/**
 按制定格式输出时间
 */
+ (NSString *(^)(NSDate *destDate, NSString *dateFormatStr))getDateStringFromDate;
/**
 文字转时间戳
 */
+(NSTimeInterval(^)(NSString * timeText,NSString *dateFormatStr))getTimestampFromTime;
/**
 * 时间戳转时间文字
 */
+(NSString *(^)(NSTimeInterval,NSString *dateFormatStr))getXDay;

// 获取几天之后的时间
+ (NSDate *)dateByAddingDays:(NSInteger)dDays withDate:(NSDate *)date;




/**
 文字转时间
 */
+ (NSDate *(^)(NSString *dateStr,NSString *dateFormatStr))getDateFromDateString;
//+ (NSDate *(^)(NSString *dateStr,NSString *dateFormatStr))getDateFromDateStringWithZero;
/**
 获取年龄
 */
+(NSInteger)getAge:(NSDate *)birthDay;
/**
 通过给定的HHmm获取今日的HHmm
 */
+(NSDate *(^)(NSString *HHmm))getTodayHHmmNew;
+ (NSString *)friendlyChatTime:(NSTimeInterval)timeInterval;
//+ (NSDate *(^)(NSString *dateStr,NSString *dateFormatStr))getDateFromDateStringNotTZ;
/**
 获取今日HH:mm后的秒数
 */
+(NSTimeInterval)getSecondByDate:(NSDate *)date;



-(NSString *)ZeroMonth;

- (BOOL(^)(NSDate *date))before;
- (BOOL(^)(NSDate *date))after;

- (NSTimeInterval(^)(void))getTime;

- (int(^)(NSDate * anotherDate))compareTo;

/// 获取时间 type 1:使用:分割 2:使用分秒分割
+(NSString *(^)(NSTimeInterval seconds,int type))getShowTime;

/// 获取剩余时间描述
+(NSString *(^)(long time))getLeftTime;
@end
