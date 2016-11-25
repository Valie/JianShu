//
//  VEViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VEViewController.h"

@interface VEViewController ()

@end

@implementation VEViewController

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


@end
