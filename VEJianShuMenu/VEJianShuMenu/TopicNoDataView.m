//
//  TopicNoDataView.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/6.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "TopicNoDataView.h"

@interface TopicNoDataView ()
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@end

@implementation TopicNoDataView

-(void)awakeFromNib
{
  self.titleBtn.layer.borderWidth = 0.5;
  self.titleBtn.layer.borderColor = [UIColor colorWithHexString:@"#E78170"].CGColor;
}

- (IBAction)handleClick:(id)sender {
  if (self.handleClick) {
    self.handleClick();
  }
}

@end
