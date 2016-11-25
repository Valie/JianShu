//
//  VEBasicModel.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VEBasicModel.h"

@implementation VEBasicModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{
           @"category": @"vip_collection.title",
           @"title"   : @"title",
           @"picture" : @"list_image",
           @"scans"   : @"views_count",
           @"comments": @"comments_count",
           @"likes"   : @"likes_count",
           @"user"    : @"notebook.user",
           @"date"    : @"last_compiled_at"
           
           };
}

+(NSValueTransformer *)userJSONTransformer
{
  return [MTLJSONAdapter dictionaryTransformerWithModelClass:[VEUserModel class]];
}

+(NSValueTransformer *)dateJSONTransformer
{
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
    return [[NSDate dateWithTimeIntervalSince1970:value.floatValue] readable];
  }];
}

@end
