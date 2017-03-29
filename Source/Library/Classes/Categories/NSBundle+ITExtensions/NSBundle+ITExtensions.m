//
//  NSBundle+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 15.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSBundle+ITExtensions.h"

@implementation NSBundle (ITExtensions)

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class withOwner:nil];
}

- (id)objectWithClass:(Class)class
            withOwner:(id)owner
{
    return [self objectWithClass:class withOwner:owner withOptions:nil];
}

- (id)objectWithClass:(Class)class
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    NSArray *objects = [self loadNibNamed:NSStringFromClass(class) owner:owner options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

@end
