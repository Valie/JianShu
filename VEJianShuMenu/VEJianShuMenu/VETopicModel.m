//
//  VETopicModel.m
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "VETopicModel.h"

@implementation VETopicModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
  return @{
           @"type"    : @"source_type",
           @"avatar"  : @"source.avatar",
           @"nickname": @"source.nickname",
           @"content" : @"source.intro_compiled",
           @"notes"   : @"source.recent_notes",
           
           @"title"   : @"source.title",
           @"image"   : @"source.image",
           @"articles": @"source.notes_count",
           @"fans"    : @"source.subscribers_count",
           @"desc"    : @"source.description",
           
           };
}

+(NSValueTransformer *)typeJSONTransformer
{
  return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
       @"User"       : @(VENoteType_User),
       @"Collection" : @(VENoteType_Collection),
                                                                         
  }];
}

+(NSValueTransformer *)notesJSONTransformer
{
  return [MTLJSONAdapter arrayTransformerWithModelClass:[VENoteModel class]];
}

@end
