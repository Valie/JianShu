//
//  NSDate+Extra.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/1.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extra)

- (NSString *)stringWithDateFormatString:(NSString *)formateString;
+ (NSDate *)dateWithString:(NSString *)string formatterString:(NSString *)formatterString;

- (NSString *)readable;
- (NSString *)humanReadable;
- (NSString *)humanReadable:(NSTimeInterval)timeinterval;

@end
