//
//  VETableViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VETableViewController.h"

@interface VETableViewController ()

@end

@implementation VETableViewController

+ (NSString *)storyboardId
{
  return @"";
}

+ (id)loadInitialControllerFromStoryBoard
{
  id viewcontroller = [[UIStoryboard storyboardWithName:[self.class storyboardId]
                                                 bundle:nil] instantiateInitialViewController];
  return viewcontroller;
}

+ (id)loadViewControllerFromStoryBoard
{
  id viewcontroller = [[UIStoryboard storyboardWithName:[self.class storyboardId]
                                                 bundle:nil]
                       instantiateViewControllerWithIdentifier:NSStringFromClass(self.class)];
  return viewcontroller;
}

+ (id)loadInitialControllerFromStoryBoardWithIdentifier:(NSString *)identifier
{
  id viewcontroller = [[UIStoryboard storyboardWithName:[self.class storyboardId]
                                                 bundle:nil]
                       instantiateViewControllerWithIdentifier:identifier];
  return viewcontroller;
}


- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationController.navigationBar.hidden = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
