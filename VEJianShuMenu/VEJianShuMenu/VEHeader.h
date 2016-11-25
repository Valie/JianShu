//
//  VEHeader.h
//  VEJianShuMenu
//
//  Created by WL on 16/6/20.
//  Copyright © 2016年 Valie. All rights reserved.
//

#ifndef VEHeader_h
#define VEHeader_h

#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define TabBarHeight                        self.tabBarController.tabBar.bounds.size.height

#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height

#define CellHeight   140

/*
 weak strong logic
 */
#define metamacro_concat(A, B) A ## B
#define weakify(VAR) \
autoreleasepool {} \
__weak __typeof__(VAR) metamacro_concat(VAR, _weak_) = (VAR)
#define strongify(VAR) \
autoreleasepool {} \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof__(VAR) VAR = metamacro_concat(VAR, _weak_)\
_Pragma("clang diagnostic pop")

#endif /* VEHeader_h */
