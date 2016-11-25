//
//  VEGifRefreshHeader.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/5.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VEGifRefreshHeader.h"

@implementation VEGifRefreshHeader

-(void)idleAnimation
{
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  animation.duration = 1.f;
  animation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
  [self.gifView.layer addAnimation:animation forKey:nil];
}

-(void)pullAnimation
{
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
  animation.duration = 1.f;
  animation.toValue  = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
  [self.gifView.layer addAnimation:animation forKey:nil];
}

-(void)setState:(MJRefreshState)state
{
  [super setState:state];
  
  [self.gifView stopAnimating];
  if (state == MJRefreshStateIdle) {
    [self performSelector:@selector(idleAnimation) withObject:self afterDelay:0.f];
  }
  
  if (state == MJRefreshStatePulling) {
    [self performSelector:@selector(pullAnimation) withObject:self afterDelay:0.f];
  }
}

-(void)prepare
{
  [super prepare];
  self.lastUpdatedTimeLabel.hidden = YES;
  // 初始化文字
  self.stateLabel.font = [UIFont systemFontOfSize:10];
  self.stateLabel.textColor = [UIColor colorWithHexString:@"d2d2d2"];
  [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
  [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
  [self setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
}

-(void)placeSubviews
{
  [super placeSubviews];
  if (self.gifView.constraints.count) return;
  
  UIImage *image = [UIImage imageNamed:@"icon_load_arrow"];
  [self setImages:@[image] forState:MJRefreshStateIdle];
  
  self.gifView.frame = self.bounds;

  if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
    self.gifView.contentMode = UIViewContentModeCenter;
  } else {
    self.gifView.contentMode = UIViewContentModeRight;
    self.gifView.mj_w = 16;
    self.gifView.mj_h = 16;
  }
}



@end
