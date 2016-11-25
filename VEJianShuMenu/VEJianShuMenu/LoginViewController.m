//
//  LoginViewController.m
//  VEJianShuMenu
//
//  Created by WL on 16/6/27.
//  Copyright © 2016年 Valie. All rights reserved.
//

#import "LoginViewController.h"
#import <IQKeyboardManager.h>

@interface LoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *midline;
@property (weak, nonatomic) IBOutlet UIView *overseas;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

@end
