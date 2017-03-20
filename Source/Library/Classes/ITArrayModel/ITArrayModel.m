//
//  ITArrayModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITArrayModel.h"

@interface ITArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *array;

@end

@implementation ITArrayModel

#pragma mark -
#pragma mark Initializations and Deallocations


- (instancetype)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.array count];
}

- (void)addObject:(id)object {
//    [self.array addObject:object];
    [self insertObject:object atIndex:self.count];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.array insertObject:object atIndex:index];

    [self setState:ITArrayModelUpdated
        withObject:[ITModelChange insertAtIndex:index]];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
    
    [self setState:ITArrayModelUpdated
        withObject:[ITModelChange deleteAtIndex:index]];
}

- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex {
    id object = self.array[index];
    
    [self.array removeObjectAtIndex:index];
    [self.array insertObject:object atIndex:newIndex];
    
//    [self setState:ITArrayModelUpdated
//        withObject:[ITModelChange moveAtIndex:index
//                                      toIndex:newIndex]];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return self.array[index];
}

#pragma mark -
#pragma mark ITObservableObject Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
            
        case ITArrayModelUpdated:
            return @selector(arrayModel:didUpdateWithModelChange:);
            
        case ITArrayModelLoaded:
            return @selector(arrayModelDidLoad:);
            
        case ITArrayModelLoading:
            return @selector(arrayModelWillLoad:);
            
        default:
            [super selectorForState:state];
    }
    
    return NULL;
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)length {
    return [self.array countByEnumeratingWithState:state objects:buffer count:length];
}

@end
