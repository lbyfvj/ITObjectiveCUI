//
//  ITImageCache.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageCache.h"

#import "ITMacro.h"

@interface ITImageCache ()
@property (nonatomic, strong)   NSMapTable  *imageCache;

@end

@implementation ITImageCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
    ITSharedInstance([self new]);
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageCache = [NSMapTable strongToWeakObjectsMapTable];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.imageCache objectForKey:key];
    }
}

- (void)addObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.imageCache setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.imageCache removeObjectForKey:key];
    }
}

- (BOOL)containsObjectForKey:(id)key {
    return nil != [self objectForKey:key];
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.imageCache count];
    }
}

@end
