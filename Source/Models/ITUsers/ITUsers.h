//
//  ITUsers.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITObservableObject.h"

@class ITUser;

@interface ITUsers : ITObservableObject <NSFastEnumeration>

- (NSUInteger)count;

- (void)addUser;

- (void)addUser:(ITUser*)user atIndex:(NSUInteger)index;

- (void)removeUserAtIndex:(NSUInteger)index;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@protocol ITUsersObserver <NSObject>

@optional

- (void)users:(ITUsers *)users didChangeData:(id)data;

@end
