//
//  ITArrayModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"
#import "ITAbstractModel.h"

typedef NS_ENUM(NSUInteger, ITArrayModelState) {
    ITArrayModelUpdated
};

@class ITArrayModel;

@protocol ITArrayModelObserver <NSObject, ITAbstractModelObserver>

@optional
- (void)arrayModel:(ITArrayModel *)model didUpdateWithModelChange:(ITModelChange *)modelChange;

@end

@interface ITArrayModel : ITAbstractModel <NSFastEnumeration, ITArrayModelObserver>

- (NSUInteger)count;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)object;

@end
