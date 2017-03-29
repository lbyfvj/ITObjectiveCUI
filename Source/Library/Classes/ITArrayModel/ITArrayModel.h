//
//  ITArrayModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"
#import "ITModel.h"

typedef NS_ENUM(NSUInteger, ITArrayModelState) {
    ITArrayModelUpdated = ITModelStateCount,
    ITArrayModelStateCount
};

@class ITArrayModel;

@protocol ITArrayModelObserver <NSObject, ITModelObserver>

@optional
- (void)arrayModel:(ITArrayModel *)model didUpdateWithModelChange:(ITModelChange *)modelChange;

@end

@interface ITArrayModel : ITModel <NSFastEnumeration, ITArrayModelObserver>
@property (nonatomic, readonly)         NSUInteger      count;

- (void)addObject:(id)object;
- (void)addObjects:(NSArray *)objects;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjects:(NSArray *)objects;
- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)moveObjectAtIndex:(NSUInteger)index toIndex:(NSUInteger)newIndex;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (NSUInteger)indexOfObject:(id)object;

@end
