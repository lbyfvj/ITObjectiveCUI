//
//  ITClusterCharacters.m
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITClusterCharacters.h"

@interface ITClusterCharacters ()
@property (nonatomic, retain)   NSArray     *characters;
@property (nonatomic, assign)   NSUInteger  count;

- (NSUInteger)countWithCharacters:(NSArray *)characters;

@end

@implementation ITClusterCharacters

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.characters = nil;
}

- (id)initWithCharacters:(NSArray *)characters {
    self = [super init];
    if (self) {
        self.characters = characters;
        self.count = [self countWithCharacters:characters];
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    NSUInteger iteratedIndex = index;
    
    NSAssert(index < count, NSRangeException);
    
    for (ITCharacters *charactersSet in self.characters) {
        count = [charactersSet count];
        
        if (iteratedIndex < count) {
            return charactersSet[iteratedIndex];
        }
        
        iteratedIndex -= count;
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (ITCharacters *charactersSet in self.characters) {
        [string appendString:[charactersSet string]];
    }
    
    return [string copy];
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithCharacters:(NSArray *)characters {
    NSUInteger count = 0;
    
    for (ITCharacters *charactersSet in characters) {
        count += [charactersSet count];
    }
    
    return count;
}

@end
