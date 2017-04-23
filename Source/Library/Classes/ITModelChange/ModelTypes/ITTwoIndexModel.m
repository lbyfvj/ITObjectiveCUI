//
//  ITTwoIndexModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTwoIndexModel.h"

@interface ITTwoIndexModel ()
@property (nonatomic, assign)     NSUInteger     toIndex;

@end

@implementation ITTwoIndexModel

+ (instancetype)model:(id)model
            withIndex:(NSUInteger)index
              toIndex:(NSUInteger)toIndex
{
    
    return [[self alloc] initModel:model withIndex:index toIndex:toIndex];
}

#pragma mark -
#pragma mark Public

- (instancetype)initModel:(id)model
                withIndex:(NSUInteger)index
                  toIndex:(NSUInteger)toIndex
{
    self = [super initModel:model withIndex:index];
    
    self.toIndex = toIndex;
    
    return self;
}

@end
