//
//  HotArticleViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "HotArticleViewController.h"
#import <SDCycleScrollView.h>

#define BannerH 190
#define CellH   140

@interface HotArticleViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *bannerImgs;
@property (strong, nonatomic) NSMutableArray *bannerUrls;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeightConstraint;
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) NSArray *models;
@end

@implementation HotArticleViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self loadBannerData];
  [self loadData];
  
  self.cycleScrollView.imageURLStringsGroup = self.bannerImgs;
  self.cycleScrollView.delegate = self;
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  self.contentHeightConstraint.constant = BannerH + self.models.count * CellH;
  return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return CellH;
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
  [cell.category setTitle:model.category forState:UIControlStateNormal];
  
  return cell;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;
{
  NSString *url = self.bannerUrls[index];
  WebViewController *viewController = [[WebViewController alloc]init];
  viewController.url = url;
  [self.navigationController pushViewController:viewController animated:YES];
}

-(void)loadBannerData
{
  NSString *path = [[NSBundle mainBundle]pathForResource:@"BannerData" ofType:@"plist"];
  NSArray *banners = [NSArray arrayWithContentsOfFile:path];
  for(NSDictionary *dic in banners)
  {
    [self.bannerImgs addObject:dic[@"app_image"]];
    [self.bannerUrls addObject:dic[@"link"]];
  }
}

-(void)loadData
{
  NSString *path = [[NSBundle mainBundle]pathForResource:@"HotArticle" ofType:@"json"];
  NSData   *data = [NSData dataWithContentsOfFile:path];
  NSArray  *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
  self.models = [MTLJSONAdapter modelsOfClass:[VEBasicModel class] fromJSONArray:array error:NULL];
  
}

-(NSMutableArray *)bannerImgs
{
  if (!_bannerImgs) {
    _bannerImgs = [@[]mutableCopy];
  }
  return _bannerImgs;
}

-(NSMutableArray *)bannerUrls
{
  if (!_bannerUrls) {
    _bannerUrls = [@[]mutableCopy];
  }
  return _bannerUrls;
}

@end
