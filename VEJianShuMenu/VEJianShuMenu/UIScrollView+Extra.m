//
//  UIScrollView+Extra.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/5.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "UIScrollView+Extra.h"
#import "MJRefresh.h"

@implementation UIScrollView (Extra)
-(void)setHeaderRefreshBlock:(void (^)(void))block
{
  MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:[block copy]];
  header.lastUpdatedTimeLabel.hidden = YES;
  header.stateLabel.hidden = YES;
  [header beginRefreshing];
  
}

-(void)setFooterRefreshBlock:(void (^)(void))block
{
  
}
@end
