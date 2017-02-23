//
//  ITStringsCharacters.m
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITStringsCharacters.h"

@interface ITStringsCharacters ()
@property (nonatomic, retain) NSArray *strings;

@end

@implementation ITStringsCharacters

#pragma mark -
#pragma mark Initialization and Deallocations

- (void)dealloc {
    self.strings = nil;
}

- (id)initWithStrings:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings = strings;
    }
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.strings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained *)buffer
                                    count:(NSUInteger)resultLength
{
    
    
    return [self.strings countByEnumeratingWithState:state
                                             objects:buffer
                                               count:resultLength];
}

@end
