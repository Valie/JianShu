//
//  WebViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"";
  self.navigationController.navigationBar.hidden = NO;
  
  UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.frame];
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
  [web loadRequest:request];
  [self.view addSubview:web];
}

-(void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}


@end
