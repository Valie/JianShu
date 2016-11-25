//
//  ReferenceTopicCell.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VETopicModel.h"

@interface ReferenceTopicCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *articles;
@property (weak, nonatomic) IBOutlet UILabel *fans;

@property (strong, nonatomic) VETopicModel *model;

@end
