//
//  InterestViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "InterestViewController.h"
#import "AssociateEditorCell.h"
#import "ReferenceTopicCell.h"
#import "SearchBarCell.h"
#import "VETopicModel.h"

@interface InterestViewController ()
@property (strong, nonatomic)NSArray * models;
@end

@implementation InterestViewController

+ (NSString *)storyboardId
{
  return @"Topic";
}

- (IBAction)popAction:(id)sender {
  
  [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadData];
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.models.count * 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
    return 40;
  }
  if (!(indexPath.row % 2)) {
    return 20;
  }
  VETopicModel *model = self.models[(indexPath.row - 1) / 2];
  return model.cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  if (indexPath.row == 0) {
    SearchBarCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SearchBarCell class]) forIndexPath:indexPath];
    return cell;
  }
  
  if (!(indexPath.row % 2)) {
    UITableViewCell *space = [tableView dequeueReusableCellWithIdentifier:@"space"];
    if (!space) {
      space = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"space"];
      space.backgroundColor = [UIColor colorWithHexString:@"#fcfcfc"];
      [space setLayoutMargins:UIEdgeInsetsZero];
      [space setSeparatorInset:UIEdgeInsetsZero];

    }
    return space;
  }
  
  VETopicModel *model = self.models[(indexPath.row - 1) / 2];
  NSString *identifify = (model.type == VENoteType_User) ? NSStringFromClass([AssociateEditorCell class]) : NSStringFromClass([ReferenceTopicCell class]);
  
  id cell = [tableView dequeueReusableCellWithIdentifier:identifify];
  
  if (model.type == VENoteType_User)
  {
    if (!cell) {
      cell = [AssociateEditorCell loadClass:[AssociateEditorCell class] from:@"BasicCell"];
    }
    
    AssociateEditorCell *aCell = cell;
    aCell.model = model;
  }
  else
  {
    if (!cell) {
      cell = [ReferenceTopicCell loadClass:[ReferenceTopicCell class] from:@"BasicCell"];
    }
    ReferenceTopicCell *rCell = cell;
    rCell.model = model;
  }
  
  return cell;
}

-(void)loadData
{
  NSString *path = [[NSBundle mainBundle]pathForResource:@"topic" ofType:@"json"];
  NSData   *data = [NSData dataWithContentsOfFile:path];
  NSArray  *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  self.models = [MTLJSONAdapter modelsOfClass:[VETopicModel class] fromJSONArray:array error:NULL];
}


@end
