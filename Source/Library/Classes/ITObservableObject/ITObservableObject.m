//
//  ITObservableObject.m
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

@interface ITObservableObject ()
@property (nonatomic, retain) NSHashTable   *observersHashTable;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object;

@end

@implementation ITObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.observersHashTable = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        
        return [observersHashTable setRepresentation];
    }
}

- (void)setState:(NSUInteger)state {
    [self setState:state withObject:nil];
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized(self) {
        //if (state != _state) {
            _state = state;
            [self notifyOfState:_state object:object];
        //}
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable addObject:observer];
    }
}

- (void)addObservers:(NSArray *)observers {
    
}

- (void)removeObserver:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable removeObject:observer];
    }
}

- (void)removeObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self removeObserver:observer];
    }
}

- (BOOL)containsObserver:(id)observer {
    NSHashTable *observers = self.observersHashTable;
    @synchronized (observers) {
        
        return [observers containsObject:observer];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    return nil;
}

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    return nil;
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state object:nil];
}

- (void)notifyOfState:(NSUInteger)state object:(id)object {
    [self notifyOfStateWithSelector:[self selectorForState:state] object:object];
}

- (void)notifyOfStateWithSelector:(SEL)selector {
    [self notifyOfStateWithSelector:selector object:nil];
}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object {
    NSHashTable *observers = self.observersHashTable;
    @synchronized(observers) {
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }
}

#pragma clang diagnostic pop

@end
