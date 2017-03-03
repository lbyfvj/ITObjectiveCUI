//
//  NSArray+ITArray.m
//  ITSources
//
//  Created by Ivan Tsyganok on 20.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSArray+ITArray.h"

@implementation NSArray (ITArray)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)objectsWithCount:(NSUInteger)count block:(id(^)())block {
    NSMutableArray *array = [NSMutableArray array];
    
    for (NSUInteger index = 0; index < count; index++) {
        [array addObject:block()];
    }
    
    return [self arrayWithArray:array];
}

@end
