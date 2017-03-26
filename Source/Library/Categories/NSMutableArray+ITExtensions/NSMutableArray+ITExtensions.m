//
//  NSMutableArray+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 26.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSMutableArray+ITExtensions.h"

@implementation NSMutableArray (ITExtensions)

- (void)moveObjectAtIndex:(NSUInteger)index
                  toIndex:(NSUInteger)newIndex
{
    [self removeObjectAtIndex:index];
    [self insertObject:self[index] atIndex:newIndex];
}

@end
