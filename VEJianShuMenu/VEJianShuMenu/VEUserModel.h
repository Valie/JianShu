//
//  VEUserModel.h
//  VEJianShuMenu
//
//  Created by WL on 16/6/30.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface VEUserModel : MTLModel<MTLJSONSerializing>

@property (strong, nonatomic)  NSString *avatar;
@property (strong, nonatomic)  NSString *nickName;

@end
