//
//  VENoteModel.h
//  VEJianShuMenu
//
//  Created by WL on 16/7/7.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VENoteModel : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic)  NSString *title;
@property (strong, nonatomic)  NSString *createAt;

@end
