//
//  JSONRepresentation+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "JSONRepresentation+ITExtensions.h"

@implementation NSDictionary (ITExtensions)

- (instancetype)JSONRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    NSMutableArray *keysToRemove = [NSMutableArray array];
    
    for(id<JSONRepresentation> key in [dictionary allKeys]){
        id value = [dictionary[key] JSONRepresentation];
        if(value == [NSNull null]) {
            [keysToRemove addObject:key];
        }
    }
    
    [dictionary removeObjectsForKeys:keysToRemove];
    
    return [[self class] dictionaryWithDictionary:dictionary];
}

@end

@implementation NSArray (ITExtensions)

- (instancetype)JSONRepresentation {
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *objectsToRemove = [NSMutableArray array];
    
    for(id<JSONRepresentation> object in array){
        id value = [object JSONRepresentation];
        
        if(value == [NSNull null]) {
            [objectsToRemove addObject:value];
        }
    }
    
    [array removeObjectsInArray:objectsToRemove];
    
    return [[self class] arrayWithArray:array];
}

@end

@implementation NSNumber (ITExtensions)

- (instancetype)JSONRepresentation {
    return self;
}

@end

@implementation NSNull (ITExtensions)

- (instancetype)JSONRepresentation {
    return nil;
}

@end

@implementation NSString (ITExtensions)

- (instancetype)JSONRepresentation {
    return self;
}

@end
