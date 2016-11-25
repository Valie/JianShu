//
//  TopicViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicNoDataView.h"
#import "InterestViewController.h"

@interface TopicViewController ()
@property (strong, nonatomic) NSArray * models;
@property (strong, nonatomic) TopicNoDataView *nullDataView;
@end

@implementation TopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  if (!self.models.count) {
    self.view = self.nullDataView;
    
    @weakify(self);
    self.nullDataView.handleClick = ^{
      @strongify(self);
      InterestViewController *controller = [InterestViewController loadViewControllerFromStoryBoard];
      [self.navigationController pushViewController:controller animated:YES];
    };
  }
}



-(UIView *)nullDataView
{
  if (!_nullDataView) {
    
    _nullDataView = [TopicNoDataView loadClass:[TopicNoDataView class] from:@"Views"];
  }
  return _nullDataView;
}



@end
