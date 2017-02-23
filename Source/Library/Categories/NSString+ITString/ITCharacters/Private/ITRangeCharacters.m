//
//  ITRangeCharacters.m
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITRangeCharacters.h"

@interface ITRangeCharacters ()
@property (nonatomic, assign) NSRange range;

@end

@implementation ITRangeCharacters

#pragma mark -
#pragma mark Initialization and Deallocations

- (id)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    NSAssert(index < range.length, NSRangeException);
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
