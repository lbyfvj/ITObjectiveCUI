//
//  ITTwoIndexModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel.h"

@interface ITTwoIndexModel : ITOneIndexModel
@property (nonatomic, readonly)     NSUInteger     toIndex;

+ (instancetype)model:(id)model
            withIndex:(NSUInteger)index
              toIndex:(NSUInteger)toIndex;

- (instancetype)initModel:(id)model
                withIndex:(NSUInteger)index
                  toIndex:(NSUInteger)toIndex;

@end
