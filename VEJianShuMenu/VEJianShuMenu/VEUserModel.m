//
//  VEUserModel.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VEUserModel.h"

@implementation VEUserModel

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{
           
           @"avatar"   : @"avatar",
           @"nickName" : @"nickname"
           
           };
}

@end
