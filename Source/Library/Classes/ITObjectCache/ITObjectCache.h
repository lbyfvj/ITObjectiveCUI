//
//  ITObjectCache.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITObjectCache : NSObject

+ (instancetype)cache;

- (id)objectForKey:(id)key;

- (void)addObject:(id)object forKey:(id)key;

- (void)removeObjectForKey:(id)key;

@end
