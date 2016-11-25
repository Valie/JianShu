//
//  NSDate+Extra.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/1.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)
- (NSString *)stringWithDateFormatString:(NSString *)formateString
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  
  NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
  [formatter setLocale:locale];
  [formatter setTimeZone:[NSTimeZone localTimeZone]];
  
  [formatter setDateFormat:formateString];
  return [formatter stringFromDate:self];
}

+ (NSDate *)dateWithString:(NSString *)string
           formatterString:(NSString *)formatterString
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  
  NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
  [formatter setLocale:locale];
  [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
  
  [formatter setDateFormat:formatterString];
  return [formatter dateFromString:string];
}

- (NSString *)humanReadable
{
  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
  
  NSDateComponents *me = [calendar components:unitFlags fromDate:self];
  NSDateComponents *today = [calendar components:unitFlags fromDate:[NSDate date]];
  if (today.year == me.year)
  {
      if (today.weekday - me.weekday == 1) return [self ma_componentsStr:self desc:@"昨天"];
      if (today.weekday - me.weekday == 2) return [self ma_componentsStr:self desc:@"前天"];
      if(today.weekday - me.weekday == 0) return [self ma_componentsStr:self desc:@"今天"]
        ;
      if (today.weekday - me.weekday == -1) return [self ma_componentsStr:self desc:@"明天"];
      if (today.weekday - me.weekday == -2) return [self ma_componentsStr:self desc:@"后天"];
    
    [self ma_componentsStr:self desc:[NSString stringWithFormat:@"%ld月%ld日", (long)me.month, (long)me.day]];
  }
  
  return [self stringWithDateFormatString:@"yyyy年MM月dd日 HH:mm"];
}

- (NSString *)readable
{
  NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
  
  NSDateComponents *me = [calendar components:unitFlags fromDate:self];
  NSDateComponents *today = [calendar components:unitFlags fromDate:[NSDate date]];
  if (today.year == me.year)
  {
    if (today.weekday - me.weekday == 1) return @"昨天";
    if (today.weekday - me.weekday == 2) return @"前天";
    if (today.weekday - me.weekday == 0) return @"今天";
  }
  
  return [self stringWithDateFormatString:@"MM.dd"];
}

- (NSString *)ma_componentsStr:(NSDate *)date desc:(NSString *)desc
{
  return [NSString stringWithFormat:@"%@ %@", desc, [date stringWithDateFormatString:@"HH:mm"]];
}

- (NSString *)humanReadable:(NSTimeInterval)timeinterval
{
  NSDateComponentsFormatter *formatter = [[NSDateComponentsFormatter alloc]init];
  formatter.unitsStyle = NSDateComponentsFormatterUnitsStyleFull;
  formatter.includesApproximationPhrase = NO;
  formatter.includesTimeRemainingPhrase = NO;
  formatter.maximumUnitCount = 4;
  return [formatter stringFromTimeInterval:timeinterval];
}

@end
