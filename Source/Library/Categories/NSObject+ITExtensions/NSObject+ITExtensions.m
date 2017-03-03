//
//  NSObject+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSObject+ITExtensions.h"

#import "NSArray+ITExtensions.h"

@implementation NSObject (ITExtensions)

+ (instancetype)object {
    return [[self alloc] init];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray objectsWithCount:count block:^id{
        return [self object];
    }];
}

@end
