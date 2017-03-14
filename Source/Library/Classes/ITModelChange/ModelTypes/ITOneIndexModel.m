//
//  ITOneIndexModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel.h"

@interface ITOneIndexModel ()
@property (nonatomic, assign)     NSUInteger     index;

@end

@implementation ITOneIndexModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithIndex:(NSUInteger)index {
    return [[self alloc] initWithIndex:index];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    
    self.index = index;
    
    return self;
}

@end
