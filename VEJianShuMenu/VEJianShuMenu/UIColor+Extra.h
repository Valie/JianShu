//
//  UIColor+Extra.h
//  VEMenuDemo
//
//  Created by Valie on 16/6/19.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r, g, b) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define HEXCOLOR(c) [UIColor colorWithRed:((c >> 16) & 0xFF) / 255.0 green:((c >> 8) & 0xFF) / 255.0 blue:(c & 0xFF) / 255.0 alpha:1.0]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]

@interface UIColor (Extra)

+ (UIColor *)colorWithHex:(NSInteger)rgb;
+ (UIColor *)colorWithHexString:(NSString *)rgb;

@end
