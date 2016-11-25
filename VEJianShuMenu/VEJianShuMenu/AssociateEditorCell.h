//
//  AssociateEditorCell.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VETopicModel.h"

@interface AssociateEditorCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *titles;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *dates;

@property (strong, nonatomic) VETopicModel *model;

@end
