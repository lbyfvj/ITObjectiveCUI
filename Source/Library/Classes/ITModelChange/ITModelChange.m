//
//  ITModelChange.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 13.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"

#import "ITModelChangesTypes.h"

@implementation ITModelChange

#pragma mark -
#pragma mark Class Methods

+ (id)insertModelAtIndex:(NSUInteger)index {
    return [ITInsertChange model:self withIndex:index];
}

+ (id)deleteModelAtIndex:(NSUInteger)index {
    return [ITDeleteChange model:self withIndex:index];
}

+ (id)moveModelAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [ITMoveChange model:self withIndex:index toIndex:toIndex];
}

@end
