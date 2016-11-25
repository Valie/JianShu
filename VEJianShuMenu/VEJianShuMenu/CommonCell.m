//
//  CommonCell.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/21.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "CommonCell.h"

@implementation CommonCell

- (void)awakeFromNib {
  [super awakeFromNib];
  self.categorybg.layer.borderColor = [UIColor colorWithHexString:@"#DD8C82"].CGColor;
  self.avatar.layer.borderColor = [UIColor colorWithHexString:@"#d9d9d9"].CGColor;
  self.avatar.layer.borderWidth = 0.5;
  self.categorybg.layer.borderWidth = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

@end
