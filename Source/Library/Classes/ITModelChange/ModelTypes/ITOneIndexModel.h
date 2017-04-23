//
//  ITOneIndexModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ITArrayModel.h"

@interface ITOneIndexModel : NSObject
@property (nonatomic, readonly)     NSUInteger     index;
@property (nonatomic, readonly)     ITArrayModel   *model;

+ (instancetype)model:(id)model withIndex:(NSUInteger)index;

- (instancetype)initModel:(id)model withIndex:(NSUInteger)index;

@end
