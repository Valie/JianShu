//
//  ArticleViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "ArticleViewController.h"
#import "HotArticleViewController.h"
#import "NewArticleViewController.h"
#import "NewspaperViewController.h"
#import "SevenDayHotViewController.h"
#import "MonthHotViewController.h"
#import "MarketViewController.h"
#import "AwardActivityViewController.h"
#import "JianShuPublishViewController.h"

@interface ArticleViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *titleButtons;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)hanleTitleClick:(UIButton *)button {
  
  [self switchAnimation:button.tag];
  
  self.contentScrollView.contentSize = CGSizeMake(8 * ScreenWidth, CGRectGetHeight(self.contentScrollView.frame));
  
  [self.contentScrollView scrollRectToVisible:CGRectMake(ScreenWidth * button.tag, 0, ScreenWidth, CGRectGetHeight(self.contentScrollView.frame)) animated:NO];
}

-(void)switchAnimation:(NSInteger)index
{
  
  for(UIButton *button in self.titleButtons)
  {
    [button setTitleColor:[UIColor colorWithHexString:@"#7C7C7C"] forState:UIControlStateNormal];
  }
  
  [UIView animateWithDuration:0.2 animations:^{
    
    UIButton *button = [self.titleButtons objectAtIndex:index];
    [button setTitleColor:[UIColor colorWithHexString:@"#C65948"] forState:UIControlStateNormal];
  }];
}



@end
