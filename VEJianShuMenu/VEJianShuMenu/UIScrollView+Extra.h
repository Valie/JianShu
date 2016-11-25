//
//  UIScrollView+Extra.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/5.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Extra)

- (void)setHeaderRefreshBlock:(void (^)(void))block;
- (void)setFooterRefreshBlock:(void (^)(void))block;

@end
