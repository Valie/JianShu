//
//  AssociateEditorCell.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "AssociateEditorCell.h"

@interface AssociateEditorCell ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topline;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomline;

@end

@implementation AssociateEditorCell

- (void)awakeFromNib {
  [super awakeFromNib];
  
  self.topline.constant = 0.5;
  self.bottomline.constant = 0.5;
  self.avatar.layer.borderWidth = 0.5;
  self.avatar.layer.borderColor = [UIColor colorWithHexString:@"#d1d1d1"].CGColor;
  
  self.content.preferredMaxLayoutWidth = self.content.frame.size.width;
}

-(void)setModel:(VETopicModel *)model
{
  _model = model;
  [self.avatar sd_setImageWithURL:[NSURL URLWithString:_model.avatar]];
  self.nickname.text = _model.nickname;
  self.content.text  = _model.content;
  for(int i = 0; i < _model.notes.count; i++)
  {
    VENoteModel *m = _model.notes[i];
    UILabel *title = self.titles[i];
    UILabel *date = self.dates[i];
    title.text = m.title;
    date.text  = m.createAt;
  }
  
  NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:self.content.font, NSFontAttributeName, nil];
  CGFloat height = [_model.content boundingRectWithSize:CGSizeMake(self.content.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size.height;

   height = (height >= 65.f) ? 65.f : height;

  [self layoutIfNeeded];
  
  self.model.cellHeight = (224 - 65) + height;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
}

@end
