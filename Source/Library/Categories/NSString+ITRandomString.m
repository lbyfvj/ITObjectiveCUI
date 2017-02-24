//
//  NSString+ITRandomString.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSString+ITRandomString.h"

#import "NSString+ITExtensions.h"

static const NSUInteger kITDefaultRandomStringLength = 10;

@implementation NSString (ITRandomString)

+ (instancetype)randomString {    
    return [NSString randomStringWithLength:kITDefaultRandomStringLength ofCharacters:[self lowercaseCharacters]];
}

@end
