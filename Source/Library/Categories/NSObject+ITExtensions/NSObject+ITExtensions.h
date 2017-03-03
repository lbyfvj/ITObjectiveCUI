//
//  NSObject+ITObject.h
//  ITSources
//
//  Created by Ivan Tsyganok on 18.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ITObject)

+ (instancetype)object;

+ (NSArray *)objectsWithCount:(NSUInteger)count;

@end
