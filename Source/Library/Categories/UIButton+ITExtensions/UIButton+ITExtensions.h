//
//  UIButton+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ITExtensions)

- (void)setTitle:(NSString *)title forState:(UIControlState)state withColor:(UIColor *)color;

@end
