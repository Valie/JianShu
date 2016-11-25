//
//  VETopicModel.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "VENoteModel.h"

typedef enum : NSUInteger{
  
  VENoteType_User,
  VENoteType_Collection
  
}VENoteType;

@interface VETopicModel : MTLModel<MTLJSONSerializing>

@property (assign, nonatomic)  VENoteType type;
//简书签约作者
@property (strong, nonatomic)  NSString *avatar;
@property (strong, nonatomic)  NSString *nickname;
@property (strong, nonatomic)  NSString *content;
@property (strong, nonatomic)  NSArray<VENoteModel *>  *notes;

//简书推荐专题
@property (strong, nonatomic)  NSString *title;
@property (strong, nonatomic)  NSString *image;
@property (strong, nonatomic)  NSNumber *articles;
@property (strong, nonatomic)  NSNumber *fans;
@property (strong, nonatomic)  NSString *desc;

@property (assign, nonatomic)  CGFloat cellHeight;

@end
