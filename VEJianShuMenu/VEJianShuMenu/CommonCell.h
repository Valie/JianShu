//
//  CommonCell.h
//  VEJianShuMenu
//
//  Created by WL on 16/6/21.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UIButton *category;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *picture;
@property (weak, nonatomic) IBOutlet UILabel *scans;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UILabel *likes;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIView *categorybg;
@property (weak, nonatomic) IBOutlet UILabel *readLabel;

@end
