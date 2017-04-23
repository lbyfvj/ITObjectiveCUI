//
//  ITObservableObject.m
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

#import "ITMacro.h"

@interface ITObservableObject ()
@property (nonatomic, retain)   NSHashTable                         *observersHashTable;
@property (nonatomic, assign)   BOOL                                shouldNotify;
@property (nonatomic, retain)   id<ITObservableObject>              target;

- (void)notifyOfStateWithSelector:(SEL)selector;
- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object;

@end

@implementation ITObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Class methods

+ (instancetype)observableObjectWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithTarget:nil];
}

- (instancetype)initWithTarget:(id)target {
    self = [super init];
    
    if (self) {
        self.observersHashTable = [NSHashTable weakObjectsHashTable];
        self.shouldNotify = YES;
        self.target = target ? target : self;
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
        _state = state;
        [self notifyOfState:_state object:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserverObject:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable addObject:observer];
    }
}

- (void)addObserverObjects:(NSArray *)observers {
    id observersHashTable = self.observersHashTable;
    @synchronized(observersHashTable) {
        for (id observer in observers) {
            [self addObserverObject:observer];
        }
    }
}

- (void)removeObserverObject:(id)observer {
    id observersHashTable = self.observersHashTable;
    @synchronized (observersHashTable) {
        [observersHashTable removeObject:observer];
    }
}

- (void)removeObserverObjects:(NSArray *)observers {
    for (id observer in observers) {
        [self removeObserverObject:observer];
    }
}

- (BOOL)containsObserverObject:(id)observer {
    NSHashTable *observers = self.observersHashTable;
    @synchronized (observers) {
        return [observers containsObject:observer];
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    return [self.target selectorForState:state];
}

- (SEL)selectorForState:(NSUInteger)state withObject:(id)object {
    return [self.target selectorForState:state withObject:object];
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
    if (!self.shouldNotify) {
        return;
    }
    
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

- (void)performBlockWithNotifications:(void(^)(void))block {
    [self performBlock:block withNotificationOption:YES];
}

- (void)performBlockWithoutNotifications:(void(^)(void))block {
    [self performBlock:block withNotificationOption:NO];
}

#pragma mark -
#pragma mark Private

- (void)performBlock:(void(^)(void))block withNotificationOption:(BOOL)notificationOption {
    @synchronized(self) {
        BOOL shouldNotify = self.shouldNotify;
        self.shouldNotify = notificationOption;        
        ITDispatchBlock(block);
        self.shouldNotify = shouldNotify;
    }
}

@end
