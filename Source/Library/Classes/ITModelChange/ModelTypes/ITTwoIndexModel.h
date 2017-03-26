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

+ (instancetype)modelWithIndex:(NSUInteger)index
                       toIndex:(NSUInteger)toIndex;

@end
