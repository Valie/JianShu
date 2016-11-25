//
//  UIColor+Extra.m
//  VEMenuDemo
//
//  Created by Valie on 16/6/19.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)

+ (UIColor *)colorWithHex:(NSInteger)rgb
{
  float r = (rgb & 0xFF) / 255.0f;
  float g = ((rgb >> 8) & 0xFF) / 255.0f;
  float b = ((rgb >> 16) & 0xFF) / 255.0f;
  
  return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)rgb
{
  @autoreleasepool
  {
    NSString *plainNumber = [[rgb stringByReplacingOccurrencesOfString:@"#" withString:@""]
                             stringByReplacingOccurrencesOfString:@"0x"
                             withString:@""];
    
    if ([plainNumber length] == 3)
    {
      NSString *r = [plainNumber substringWithRange:NSMakeRange(0, 1)];
      NSString *g = [plainNumber substringWithRange:NSMakeRange(1, 1)];
      NSString *b = [plainNumber substringWithRange:NSMakeRange(2, 1)];
      plainNumber = [NSString stringWithFormat:@"%@%@%@%@%@%@", r, r, g, g, b, b];
    }
    
    if ([plainNumber length] == 6)
    {
      plainNumber = [plainNumber stringByAppendingString:@"ff"];
    }
    
    unsigned int hexValue;
    [[NSScanner scannerWithString:plainNumber] scanHexInt:&hexValue];
    
    float r = ((hexValue >> 24) & 0xFF) / 255.0f;
    float g = ((hexValue >> 16) & 0xFF) / 255.0f;
    float b = ((hexValue >> 8) & 0xFF) / 255.0f;
    float a = ((hexValue >> 0) & 0xFF) / 255.0f;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
  }
}

@end
