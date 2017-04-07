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

+ (instancetype)modelWithIndex:(NSUInteger)index
                       toIndex:(NSUInteger)toIndex
{
    
    return [[self alloc] initWithIndex:index];
}

#pragma mark -
#pragma mark Public

- (instancetype)initWithIndex:(NSUInteger)index
                       toIndex:(NSUInteger)toIndex
{
    self = [super initWithIndex:index];
    
    self.toIndex = toIndex;
    
    return self;
}

@end
