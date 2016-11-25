//
//  HomeViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "HomeViewController.h"
#import "ArticleViewController.h"
#import "TopicViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtons;
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *titleUnderlines;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UIImage *image = [UIImage imageNamed:@"button_write"];
  UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((ScreenWidth - image.size.width) / 2, (TabBarHeight - image.size.height) / 2, image.size.width, image.size.height)];
  [button setBackgroundImage:image forState:UIControlStateNormal];
  [self.tabBarController.tabBar addSubview:button];
  
}

-(void)viewWillAppear:(BOOL)animated
{
  self.navigationController.navigationBar.hidden = YES;
}

-(IBAction)handleClickTitle:(UIButton *)button
{
  [self switchAnimation:button.tag];
  
  self.scrollView.contentSize = CGSizeMake(2 * ScreenWidth, CGRectGetHeight(self.scrollView.frame));
  
  [self.scrollView scrollRectToVisible:CGRectMake(ScreenWidth * button.tag, 0, ScreenWidth, CGRectGetHeight(self.scrollView.frame)) animated:NO];
}

-(void)switchAnimation:(NSInteger)index
{
  for(UIView *view in self.titleUnderlines)
  {
    view.alpha = 0.0;
  }
  
  for(UIButton *button in self.titleButtons)
  {
    [button setTitleColor:[UIColor colorWithHexString:@"#313131"] forState:UIControlStateNormal];
  }
  
  [UIView animateWithDuration:0.2 animations:^{
    
    UIView *view = [self.titleUnderlines objectAtIndex:index];
    view.alpha = 1.0;
    
    UIButton *button = [self.titleButtons objectAtIndex:index];
    [button setTitleColor:[UIColor colorWithHexString:@"#C65948"] forState:UIControlStateNormal];
  }];
}


@end
