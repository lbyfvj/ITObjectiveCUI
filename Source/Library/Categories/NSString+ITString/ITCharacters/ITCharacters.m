//
//  ITCharacters.m
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCharacters.h"

#import "math.h"

#import "ITRangeCharacters.h"
#import "ITStringsCharacters.h"
#import "ITClusterCharacters.h"

#import "NSString+ITString.h"

NSRange ITMakeCharactersRange(unichar value1, unichar value2) {
    unichar minValue = MIN(value1, value2);
    unichar maxValue = MAX(value1, value2);
    
    return NSMakeRange(minValue, maxValue - minValue +1);
}

@implementation ITCharacters

#pragma mark -
#pragma mark Class methods

+ (id)numericCharacters {
    return [self charactersWithRange:ITMakeCharactersRange('0', '9')];
}

+ (id)symbolCharacters {
    return [self charactersWithRange:ITMakeCharactersRange(33, 47)];
}

+ (id)capitalizedCharacters {
    return [self charactersWithRange:ITMakeCharactersRange('A', 'Z')];
}

+ (id)lowercaseCharacters {
    return [self charactersWithRange:ITMakeCharactersRange('a', 'z')];
}

+ (id)alphanumericCharacters {
    return [self charactersWithCharacters:@[[self numericCharacters],
                                            [self capitalizedCharacters],
                                            [self lowercaseCharacters]]];
}

+ (id)characters {
    return [self charactersWithCharacters:@[[self alphanumericCharacters],
                                            [self symbolCharacters]]];
}

+ (id)charactersWithRange:(NSRange)range {
    return [[ITRangeCharacters alloc] initWithRange:range];
}

+ (id)charactersWithStrings:(NSArray *)strings {
    return [[ITStringsCharacters alloc] initWithStrings:strings];
}

+ (id)charactersWithSymbols:(NSString *)string {
    return [self charactersWithStrings:[string symbols]];
}

+ (id)charactersWithCharacters:(NSArray *)characters {
    return [[ITClusterCharacters alloc] initWithCharacters:characters];
}

#pragma mark -
#pragma mark Initialization and Deallocations

- (id)initWithRange:(NSRange)range {
    
    return [[ITRangeCharacters alloc] initWithRange:range];
}

- (id)initWithStrings:(NSArray *)strings {
    
    return [[ITStringsCharacters alloc] initWithStrings:strings];
}

- (id)initWithSymbols:(NSString *)string {
    return [self initWithStrings:[string symbols]];
}

- (id)initWithCharacters:(NSArray *)characters {
    
    return [self initWithCharacters:characters];
}

#pragma mark -
#pragma mark Public methods

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];
    
    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSString *)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [string copy];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained *)buffer
                                    count:(NSUInteger)resultLength
{
    state->mutationsPtr = &state->extra[0];
    
    NSUInteger length = MIN(state->state + resultLength, [self count]);
    resultLength = length - state->state;
    
    for (NSUInteger index = 0; index < resultLength; index++) {
        buffer[index] = self[index + state->state];
    }
    
    state->itemsPtr = buffer;
    
    state->state += resultLength;
    
    return resultLength;
}

@end
