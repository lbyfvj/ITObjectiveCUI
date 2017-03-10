//
//  ITUsers.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITObservableObject.h"

typedef NS_ENUM(NSUInteger, ITUsersState) {
    ITUsersAdded,
    ITUsersDeleted,
    ITUsersReordered,
};


@class ITUser;

@interface ITUsers : ITObservableObject <NSFastEnumeration>

- (NSUInteger)count;

- (void)addUser;

- (void)insertUser:(ITUser*)user atIndex:(NSUInteger)index;

- (void)removeUserAtIndex:(NSUInteger)index;

- (void)moveUserAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@protocol ITUsersObserver <NSObject>

@optional

- (void)users:(ITUsers *)users didAddedWithPath:(id)path;
- (void)users:(ITUsers *)users didDeletedWithPath:(id)path;
- (void)users:(ITUsers *)users didReorderedWithPaths:(id)path;

@end
