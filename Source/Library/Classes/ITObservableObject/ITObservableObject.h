//
//  ITObservableObject.h
//  ITSources
//
//  Created by Ivan Tsyganok on 21.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ITObservableObject <NSObject>
@optional
@property (nonatomic, assign)           NSUInteger  state;


- (void)addObserverObject:(id)observer;
- (void)addObserverObjects:(NSArray *)observers;

- (void)removeObserverObject:(id)observer;
- (void)removeObserverObjects:(NSArray *)observers;

- (BOOL)containsObserverObject:(id)observer;

- (SEL)selectorForState:(NSUInteger)state;

- (void)setState:(NSUInteger)state withObject:(id)object;

- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state object:(id)object;

- (void)performBlockWithNotifications:(void(^)(void))block;
- (void)performBlockWithoutNotifications:(void(^)(void))block;

@end

@interface ITObservableObject : NSObject <ITObservableObject>
@property (nonatomic, assign)                   NSUInteger                      state;
@property (nonatomic, readonly)                 NSSet                           *observersSet;

@property (nonatomic, weak, readonly)           id<ITObservableObject>          target;

+ (id)observableObjectWithTarget:(id)target;

@end
