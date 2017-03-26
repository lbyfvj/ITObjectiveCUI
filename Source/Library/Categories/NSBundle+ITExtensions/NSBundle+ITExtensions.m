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

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls withOwner:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
{
    return [self objectWithClass:cls withOwner:owner withOptions:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    NSArray *objects = [self loadNibNamed:NSStringFromClass(cls) owner:owner options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

@end
