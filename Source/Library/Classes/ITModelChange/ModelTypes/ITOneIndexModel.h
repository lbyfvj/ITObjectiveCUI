//
//  ITOneIndexModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITOneIndexModel : NSObject
@property (nonatomic, readonly)     NSUInteger     index;

+ (instancetype)modelWithIndex:(NSUInteger)index;

- (instancetype)initWithIndex:(NSUInteger)index;

@end
