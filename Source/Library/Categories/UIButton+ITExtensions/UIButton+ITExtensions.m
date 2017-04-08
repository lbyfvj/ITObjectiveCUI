//
//  UIButton+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UIButton+ITExtensions.h"

@implementation UIButton (ITExtensions)

- (void)setTitle:(NSString *)title forState:(UIControlState)state withColor:(UIColor *)color {
    [self setTitle: title forState: state];
    self.tintColor = color;
}

@end
