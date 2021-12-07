//
//  NSDate+ZFTExtend.m
//  TYGJ
//
//  Created by zft on 2018/8/13.
//  Copyright © 2018 ZFT. All rights reserved.
//

#import "NSDate+ZFTExtend.h"

@implementation NSDate (ZFTExtend)

-(NSString *)ZeroMonth{
    NSInteger monthhh = self.month;// [self componentForDate:self type:DTDateComponentMonth calendar:nil];
    if (monthhh>=10) {
        return [NSString stringWithFormat:@"%ld",(long)monthhh];
    }else{
        return [NSString stringWithFormat:@"0%ld",(long)monthhh];
    }
}




+(NSDate *(^)(NSString *HHmm))getTodayHHmmNew{
    return ^NSDate *(NSString *HHmm){
        NSString *nowDateStr = NSDate.getDateStringFromDate([NSDate new],kTimeNormalFormat);
        
        NSString *timenow = [NSString stringWithFormat:@"%@ %@:00.000",nowDateStr,HHmm];
        NSDate *dateResult = NSDate.getDateFromDateString(timenow,kTimeCommonFormat);

        return dateResult;
        
    };
}



/**
 获取今日HH:mm后的秒数
 */
+(NSTimeInterval)getSecondByDate:(NSDate *)date{
    NSString *HMStr = NSDate.getDateStringFromDate(date,kTimeNormalHmFormat);
    NSString *TodayStr = NSDate.getDateStringFromDate([NSDate new],kTimeNormalFormat);
    NSString *totalStr = [NSString stringWithFormat:@"%@ %@:00.000",TodayStr,HMStr];
//    ZFTLog(@"totalStr = %@",totalStr);
    NSDate *speaicalDate = NSDate.getDateFromDateString(totalStr,kTimeCommonFormat);
    NSTimeInterval nowTimeInterval = [[NSDate new] timeIntervalSince1970];
//    ZFTLog(@"nowTimeInterval = %.f",nowTimeInterval);
    NSTimeInterval speaicalInterval = [speaicalDate timeIntervalSince1970];
//    ZFTLog(@"speaicalInterval = %.f",speaicalInterval);
//    ZFTLog(@"distance = %.f",speaicalInterval-nowTimeInterval);
    return speaicalInterval-nowTimeInterval;
}


+ (NSDate *)dateByAddingDays:(NSInteger)dDays withDate:(NSDate *)date{
    return [date dateByAddingDays:dDays];
}








/**
 按制定格式输出时间
 */
+ (NSString *(^)(NSDate *destDate, NSString *dateFormatStr))getDateStringFromDate{
    return ^NSString *(NSDate *destDate,NSString *dateFormatStr){
        NSDateFormatter *f = [self dateFormatter];
        [f setDateFormat:dateFormatStr];
        return [f stringFromDate:destDate];
    };
}

+(NSDateFormatter *)dateFormatter{
    NSDateFormatter* f = [[NSDateFormatter alloc] init];
    [f setTimeZone:[NSTimeZone localTimeZone]];
    return f;
}

//+ (NSDateFormatter *(^)(NSString *dateFormatStr))dateFormatter {
//    return ^NSDateFormatter *(NSString *dateFormatStr){
//        static NSDateFormatter *f = NSClassFromString([NSString stringWithFormat:@"share_%@",dateFormatStr]);
////        @synchronized(self) {
////            if (!curClass) {
////                curClass = [NSDateFormatter new];
////            }
////        }
////        return curClass;
//
//
////        static NSDateFormatter *f = nil;
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            //这玩意创建很耗资源，保持一个单例也用不了多少内存
//            f = [[NSDateFormatter alloc] init];
//            [f setTimeZone:[NSTimeZone localTimeZone]];
//            [f setDateFormat:dateFormatStr];
//        });
//        return f;
//    };
//}

/**
 文字转时间
 */
+ (NSDate *(^)(NSString *dateStr,NSString *dateFormatStr))getDateFromDateString{
    return ^NSDate *(NSString *dateStr,NSString *dateFormatStr){
        NSDateFormatter *f = [self dateFormatter];
//[NSTimeZone localTimeZone]
        [f setDateFormat:dateFormatStr];
        return [f dateFromString:dateStr];
    };
}


/**
 文字转时间戳
 */
+(NSTimeInterval(^)(NSString * timeText,NSString *dateFormatStr))getTimestampFromTime{
    return ^NSTimeInterval(NSString * timeText,NSString *dateFormatStr){
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setTimeZone:[NSTimeZone localTimeZone]];
        [f setDateFormat:dateFormatStr];
        
        return [[f dateFromString:timeText] timeIntervalSince1970]*1000;
    };
}

/**
 * 时间戳转时间文字
 */
+(NSString *(^)(NSTimeInterval,NSString *dateFormatStr))getXDay{
    return ^NSString *(NSTimeInterval timeInterval,NSString *dateFormatStr){
        if(timeInterval==0){
            return @"";
        }
        
        NSDate *destDate =   [NSDate dateWithTimeIntervalSince1970:timeInterval/1000];
        NSDateFormatter *f = [[NSDateFormatter alloc] init];
        [f setTimeZone:[NSTimeZone localTimeZone]];
        [f setDateFormat:dateFormatStr];
        NSString *timestr = [f stringFromDate:destDate];
        return timestr==nil?nil:[NSString stringWithFormat:@"%@",timestr];
    };
}
//分别单独获取年月日时分秒
+(NSDateComponents *)getYMDHMS:(NSString *)timeStr dateFormatStr:(NSString *)dateFormatStr{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute;
    NSDateComponents *d = [calendar components:unitFlags fromDate:NSDate.getDateFromDateString(timeStr,dateFormatStr)];
    return d;
}

/**
 获取年龄
 */
+(NSInteger)getAge:(NSDate *)birthDay{
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

    if (birthDay) {
        NSDateComponents *date = [calendar components:unitFlags fromDate:birthDay toDate:currentDate options:0];
        return (long)[date year];
    }else
        return 0;

}

+(int)isSameDay:(NSDate*)nowDate lastDate:(NSDate*)lastDate{
    double timezoneFix = [NSTimeZone localTimeZone].secondsFromGMT;
    int differenceDay  =  (int)(([nowDate timeIntervalSince1970] + timezoneFix)/(24*3600)) -
    (int)(([lastDate timeIntervalSince1970] + timezoneFix)/(24*3600));
    return differenceDay;
}

+ (NSString *)friendlyChatTime:(NSTimeInterval)timeInterval{
    if(timeInterval==0){
        return @"";
    }
    
    NSDate *destDate =   [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *f = [self dateFormatter];
    
    NSTimeInterval elapse_seconds = [currentDate timeIntervalSinceDate:destDate];
    if ([self isSameDay:currentDate lastDate:destDate] == 0) {
        if (elapse_seconds < ELAPSETIME1) {//1小时内
            int minute = (int)(elapse_seconds/60);
            if (minute <= 0) {
                minute = 1;
            }
            
            NSString *outStr=[NSString stringWithFormat:@"%@分钟前",[@(minute) stringValue]];
            
            return  outStr;
        }else{//%@小时前
            [f setDateFormat:@"HH:mm"];
            NSString *timestr = [f stringFromDate:destDate];
            return [NSString stringWithFormat:@"%@",timestr];
        }
    }else if([self isSameDay:currentDate lastDate:destDate] == 1){
        
        [f setDateFormat:@"HH:mm" ];
        
        NSString *timestr = [f stringFromDate:destDate];
        return [NSString stringWithFormat:@"%@ %@",@"昨天",timestr];
    }else if([self isSameDay:currentDate lastDate:destDate] == 2){
        
        [f setDateFormat:@"MM-dd HH:mm"];
        
        NSString *timestr = [f stringFromDate:destDate];
        return [NSString stringWithFormat:@"%@",timestr];
    }else{
        [f setDateFormat:@"yyyy-MM-dd"];
        NSString *timestr = [f stringFromDate:destDate];
        return [NSString stringWithFormat:@"%@",timestr];
        
    }
    
    return @"";
}

- (BOOL(^)(NSDate *date))before
{
    return ^BOOL(NSDate *date){
        return [self isEarlierThan:date];
    };
}

- (BOOL(^)(NSDate *date))after
{
    return ^BOOL(NSDate *date){
        return [self isLaterThan:date];
    };
}

- (NSTimeInterval(^)(void))getTime
{
    return ^NSTimeInterval(void){
        return self.timeIntervalSince1970;
    };
}

- (int(^)(NSDate * anotherDate))compareTo
{
    return ^int(NSDate * anotherDate){
        long thisTime = self.timeIntervalSince1970;
        long anotherTime = anotherDate.timeIntervalSince1970;
        return (thisTime<anotherTime ? -1 : (thisTime==anotherTime ? 0 : 1));
    };
}

/// 获取时间 type 1:使用:分割 2:使用分秒分割
+(NSString *(^)(NSTimeInterval seconds,int type))getShowTime{
    return ^NSString *(NSTimeInterval seconds,int type){
        int mins = seconds / 60.0f;
        int secs = (int)seconds % 60;
        return type == 1 ?[NSString stringWithFormat:@"%02d:%02d",mins,secs] : [NSString stringWithFormat:@"%02d分%02d秒",mins,secs];
    };
}


/// 获取剩余时间描述
+(NSString *(^)(long time))getLeftTime{
    return ^NSString *(long time){
        int hour = round(time / 60);
        int minute = round(time %60);
        if (time>0) {
            return [NSString stringWithFormat:@"%02d小时%02d分后过期",hour,minute];
        }else{
            return @"已关闭";
        }
    };
}


#pragma mark - 时间
NSString * const kTimeCommonFormat = @"yyyy-MM-dd HH:mm:ss.SSS";//全日期格式(带毫秒)
NSString * const kTimeCommonsFormat = @"yyyy-MM-dd HH:mm:ss";//全日期格式

NSString * const kTimeNormalFormat = @"yyyy-MM-dd";//默认日期格式
NSString * const kTimeNormalDotFormat = @"yyyy.MM.dd";//默认日期格式
NSString * const kTimeNormalYMFormat = @"yyyy-MM";//默认日期格式
NSString * const kTimeNormalMdFormat = @"MM.dd";
NSString * const kTimeNormalHmFormat = @"HH:mm";//默认时间格式
NSString * const kTimeNormalhmFormat = @"hh:mm";
NSString * const kTimeyyyyMMddHHmmFormat = @"yyyy-MM-dd HH:mm";//年月日时分
NSString * const kDefaultDate  = @"1900-01-01 00:00:00.000"; //默认日期
NSString * const kBeginTimeStr = @"00:00:00.000";//一天开始
NSString * const kEndTimeStr = @"23:59:59.999";//一天结束
@end
