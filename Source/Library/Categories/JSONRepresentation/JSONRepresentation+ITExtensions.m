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
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id<JSONRepresentation> obj, BOOL *stop) {
        id value = [obj JSONRepresentation];
        if(value) {
            dictionary[key] = value;
        }
    }];
    
    return [[self class] dictionaryWithDictionary:dictionary];
}

@end

@implementation NSArray (JSONRepresentation)

+ (instancetype)jsonArrayWithArray:(NSArray *)array {
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSMutableArray (JSONRepresentation)

+ (instancetype)jsonArrayWithArray:(NSMutableArray *)array {
    return [NSMutableArray arrayWithArray:array];
}

@end

@implementation NSArray (ITExtensions)

- (instancetype)JSONRepresentation {
    NSMutableArray *array = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id<JSONRepresentation> obj, NSUInteger idx, BOOL *stop) {
        id value = [obj JSONRepresentation];
        if(value) {
            [array addObject:value];
        }
    }];

    return [[self class] jsonArrayWithArray:array];
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
