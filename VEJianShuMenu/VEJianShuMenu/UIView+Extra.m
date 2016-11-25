//
//  UIView+Extra.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

+(id)loadClass:(Class)iclass from:(NSString *)nibName
{
  NSArray *views = [[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil];
  for(UIView *view in views)
  {
    if ([view isKindOfClass:iclass]) {
      return view;
    }
  }
  return nil;
}

@end
