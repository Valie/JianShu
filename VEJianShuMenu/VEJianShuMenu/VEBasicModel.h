//
//  VEBasicModel.h
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "VEUserModel.h"

@interface VEBasicModel : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic)  NSString *category;
@property (strong, nonatomic)  NSString *title;
@property (strong, nonatomic)  NSString *picture;
@property (strong, nonatomic)  NSNumber *scans;
@property (strong, nonatomic)  NSNumber *comments;
@property (strong, nonatomic)  NSNumber *likes;
@property (strong, nonatomic)  NSString   *date;
@property (strong, nonatomic)  VEUserModel *user;

@end
