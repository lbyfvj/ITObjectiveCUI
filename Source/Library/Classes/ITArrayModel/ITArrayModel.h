//
//  ITArrayModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITObservableObject.h"

#import "ITModelChange.h"

typedef NS_ENUM(NSUInteger, ITArrayModelState) {
    ITArrayModelUpdated
};

@interface ITArrayModel : ITObservableObject <NSFastEnumeration>

- (NSUInteger)count;

- (void)addObject:(id)object;

- (void)insertObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end

@protocol ITArrayModelObserver <NSObject>

@optional
- (void)arrayModel:(ITArrayModel *)model didUpdateWithModelChange:(ITModelChange *)modelChange;

@end
