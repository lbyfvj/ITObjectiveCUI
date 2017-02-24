//
//  NSString+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSString+ITExtensions.h"

static const NSUInteger kDefaultRandomStringLength = 30;

@implementation NSString (ITExtensions)

+ (instancetype)charactersWithUnicodeRange:(NSRange)range {
    NSMutableString *result = [NSMutableString string];
    for (unichar character = range.location; character < NSMaxRange(range); character++) {
        [result appendFormat:@"%c",character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)capitalizedCharacters {
    NSRange range = {'A', 26};
    
    return [self charactersWithUnicodeRange:range];
}

+ (instancetype)lowercaseCharacters {
    NSRange range = {'a', 26};
    
    return [self charactersWithUnicodeRange:range];
}

+ (instancetype)numericCharacters {
    NSRange range = {'0', 10};
    
    return [self charactersWithUnicodeRange:range];
}

+ (instancetype)characters {
    NSMutableString *result = [NSMutableString stringWithString:[self lowercaseCharacters]];
    [result appendString:[self capitalizedCharacters]];
    
    return [self stringWithString:result];
    
}

+ (instancetype)randomStringWithLength:(NSUInteger)length ofCharacters:(NSString *)characters {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger charactersLength = [characters length];
    for (NSUInteger i = 0; i < length; i++) {
        unichar character = [characters characterAtIndex:arc4random_uniform((u_int32_t)charactersLength)];
        [result appendFormat:@"%c", character];
    }
    
    return [self stringWithString:result];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length ofCharacters:[self characters]];
}

+ (instancetype)randomString {
    return [self randomStringWithLength:kDefaultRandomStringLength];
}

@end
