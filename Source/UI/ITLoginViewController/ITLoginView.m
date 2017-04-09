//
//  ITLoginView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITLoginView.h"

#import "UIButton+ITExtensions.h"

static NSString * const kITLoginButtonTitle = @"Login with Facebook";
static NSString * const kITLogoutButtonTitle = @"Logout";

@implementation ITLoginView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIButton *loginButton = self.loginButton;

    loginButton.backgroundColor=[UIColor colorWithRed:0.26 green:0.40 blue:0.70 alpha:1.0];
    loginButton.frame=CGRectMake(0,0,180,40);
    loginButton.center = self.center;
    loginButton.layer.cornerRadius = 5.0;
    [loginButton setTitle:kITLoginButtonTitle
                 forState:UIControlStateNormal
                withColor:[UIColor whiteColor]];
    
    [self addSubview:loginButton];
}

@end
