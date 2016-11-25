//
//  VENoteModel.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VENoteModel.h"

@implementation VENoteModel
+(NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{
           
           @"title"   : @"title",
           @"createAt" : @"first_shared_at"
           
           };
}

+(NSValueTransformer *)createAtJSONTransformer
{
  return [MTLValueTransformer transformerUsingForwardBlock:^id(NSNumber *value, BOOL *success, NSError *__autoreleasing *error) {
    return [[NSDate dateWithTimeIntervalSince1970:value.floatValue] stringWithDateFormatString:@"yy.MM.dd"];
  }];
}

@end
