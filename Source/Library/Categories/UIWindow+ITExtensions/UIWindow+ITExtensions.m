//
//  UIWindow+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UIWindow+ITExtensions.h"

@implementation UIWindow (ITExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
