//
//  ITJSONRepresentation+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITJSONRepresentation+ITExtensions.h"

@implementation NSDictionary (ITExtensions)

- (instancetype)ITJSONRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSMutableArray *keysToRemove = [NSMutableArray array];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id<ITJSONRepresentation> obj, BOOL *stop) {
        id value = [obj ITJSONRepresentation];
        if(value == [NSNull null]) {
            [keysToRemove addObject:key];
        }
        dictionary[key] = value;
    }];
    
    [dictionary removeObjectsForKeys:keysToRemove];
    
    return [[self class] dictionaryWithDictionary:dictionary];
}

@end

@implementation NSArray (ITExtensions)

- (instancetype)ITJSONRepresentation {
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *objectsToRemove = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id<ITJSONRepresentation> obj, NSUInteger idx, BOOL *stop) {
        id value = [obj ITJSONRepresentation];
        if(value == [NSNull null]) {
            [objectsToRemove addObject:value];
        }
        [array addObject:value];
    }];
    
    [array removeObjectsInArray:objectsToRemove];
    
    return [[self class] arrayWithArray:array];
}

@end

@implementation NSNumber (ITExtensions)

- (instancetype)ITJSONRepresentation {
    return self;
}

@end

@implementation NSNull (ITExtensions)

- (instancetype)ITJSONRepresentation {
    return nil;
}

@end

@implementation NSString (ITExtensions)

- (instancetype)ITJSONRepresentation {
    return self;
}

@end
