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

+ (id)insertAtIndex:(NSUInteger)index {
    return [ITInsertChange modelWithIndex:index];
}

+ (id)deleteAtIndex:(NSUInteger)index {
    return [ITDeleteChange modelWithIndex:index];
}

+ (id)moveAtIndex:(NSUInteger)index toIndex:(NSUInteger)toIndex {
    return [ITMoveChange modelWithIndex:index
                                toIndex:toIndex];
}

@end
