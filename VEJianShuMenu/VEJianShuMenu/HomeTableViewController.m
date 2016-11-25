//
//  HomeTableViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/6.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "HomeTableViewController.h"

@interface HomeTableViewController ()
@property (strong, nonatomic) NSArray *models;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
  [super viewDidLoad];
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return CellHeight;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.models.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommonCell class])];
  if (!cell) {
    cell = [CommonCell loadClass:[CommonCell class] from:@"BasicCell"];
  }
  
  VEBasicModel *model = self.models[indexPath.row];
  
  cell.likes.text     = model.likes.stringValue;
  cell.title.text     = model.title;
  cell.scans.text     = model.scans.stringValue;
  cell.comments.text  = model.comments.stringValue;
  cell.nickname.text  = model.user.nickName;
  cell.date.text = model.date;
  [cell.avatar sd_setImageWithURL:[NSURL URLWithString:model.user.avatar]];
  model.picture ? [cell.picture sd_setImageWithURL:[NSURL URLWithString:model.picture]] : (cell.picture.hidden = YES);
  
  model.category ? [cell.category setTitle:model.category forState:UIControlStateNormal] : ({
    cell.categorybg.hidden = YES;
    cell.category.hidden = YES;
    NSLayoutConstraint *contraint =  [NSLayoutConstraint constraintWithItem:cell.readLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:cell.title attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [cell.contentView addConstraint:contraint];
  });
  
  return cell;
}


-(void)loadDataFromFile:(NSString *)fileName
{
  NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:@"json"];
  NSData   *data = [NSData dataWithContentsOfFile:path];
  NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  self.models = [MTLJSONAdapter modelsOfClass:[VEBasicModel class] fromJSONArray:array error:NULL];
}


@end
