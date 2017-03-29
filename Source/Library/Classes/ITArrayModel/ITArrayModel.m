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

- (void)notifyOfModelUpdateWithObject:(ITModelChange *)modelChange;

@end

@implementation ITArrayModel

@dynamic count;

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
    return self.array.count;
}

- (void)addObject:(id)object {
    [self insertObject:object atIndex:self.count];
}

- (void)addObjects:(NSArray *)objects {
    for (id object in objects) {
        [self.array addObject:object];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.array insertObject:object atIndex:index];
    [self notifyOfModelUpdateWithObject:[ITModelChange insertAtIndex:index]];
}

- (void)removeObject:(id)object {
    [self.array removeObjectAtIndex:[self indexOfObject:object]];
}

- (void)removeObjects:(NSArray *)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
    [self notifyOfModelUpdateWithObject:[ITModelChange deleteAtIndex:index]];
}

- (void)moveObjectAtIndex:(NSUInteger)index
                  toIndex:(NSUInteger)newIndex
{
    [self moveObjectAtIndex:index toIndex:newIndex];
    [self notifyOfModelUpdateWithObject:[ITModelChange moveAtIndex:index
                                                           toIndex:newIndex]];
}

- (id)objectAtIndex:(NSUInteger)index {
    return self.array[index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.array indexOfObject:object];
}

- (void)save {
    NSLog(@"%@", [self path]);
    [NSKeyedArchiver archiveRootObject:self.array toFile:[self path]];
}

#pragma mark -
#pragma mark Private

- (void)notifyOfModelUpdateWithObject:(ITModelChange *)modelChange {
    [self setState:ITArrayModelUpdated
        withObject:modelChange];
}

#pragma mark -
#pragma mark ITObservableObject Overload

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
            
        case ITArrayModelUpdated:
            return @selector(arrayModel:didUpdateWithModelChange:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)length
{
    return [self.array countByEnumeratingWithState:state objects:buffer count:length];
}

@end
