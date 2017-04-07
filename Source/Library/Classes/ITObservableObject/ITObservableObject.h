//
//  ITObservableObject.h
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)addObservers:(NSArray *)observers;

- (void)removeObserver:(id)observer;
- (void)removeObservers:(NSArray *)observers;

- (BOOL)containsObserver:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;
- (SEL)selectorForState:(NSUInteger)state withObject:(id)object;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state object:(id)object;

- (void)performBlockWithNotifications:(void(^)(void))block;
- (void)performBlockWithoutNotifications:(void(^)(void))block;

@end
