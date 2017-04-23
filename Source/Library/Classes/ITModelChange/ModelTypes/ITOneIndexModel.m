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
@property (nonatomic, strong)     ITArrayModel   *model;;

@end

@implementation ITOneIndexModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model:(ITArrayModel *)model withIndex:(NSUInteger)index {
    return [[self alloc] initModel:model withIndex:index];
}

#pragma mark -
#pragma mark Public Methods

- (instancetype)initModel:(ITArrayModel *)model withIndex:(NSUInteger)index {
    self = [super init];
    
    self.index = index;
    self.model = model;
    
    return self;
}

@end
