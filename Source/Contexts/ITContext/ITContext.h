//
//  ITContext.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITContext : NSObject
@property (nonatomic, strong)     id      model;

+ (instancetype)contextWithModel:(id)model;

- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;

@end
