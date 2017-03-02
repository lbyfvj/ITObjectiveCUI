//
//  NSArray+ITArray.h
//  ITSources
//
//  Created by Ivan Tsyganok on 20.01.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ITArray)

+ (instancetype)objectsWithCount:(NSUInteger)count block:(id(^)())block;

@end
