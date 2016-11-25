//
//  ReferenceTopicCell.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "ReferenceTopicCell.h"

@interface ReferenceTopicCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *line;

@end

@implementation ReferenceTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
  self.line.constant = 0.5;
  self.avatar.layer.borderWidth = 0.5;
  self.avatar.layer.borderColor = [UIColor colorWithHexString:@"#d1d1d1"].CGColor;
  
  self.content.preferredMaxLayoutWidth = self.content.frame.size.width;
}

-(void)setModel:(VETopicModel *)model
{
  _model = model;
  
  [self.avatar sd_setImageWithURL:[NSURL URLWithString:_model.image]];
  self.nickname.text = _model.title;
  self.content.text  = _model.desc;
  self.articles.text = _model.articles.stringValue;
  self.fans.text     = _model.fans.stringValue;
  

  NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:self.content.font, NSFontAttributeName, nil];
  CGFloat height = [_model.desc boundingRectWithSize:CGSizeMake(self.content.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;
  
  height = (height >= 65.f) ? 65.f : height;
  
  [self layoutIfNeeded];
  
  self.model.cellHeight = (183 - 65) + height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
