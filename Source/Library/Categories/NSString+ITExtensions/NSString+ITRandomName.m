//
//  NSString+ITRandomName.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSString+ITRandomName.h"

#import "NSString+ITExtensions.h"

static const NSUInteger kITDefaultRandomNameLength = 7;

@implementation NSString (ITRandomName)

+ (instancetype)randomName {
    return [[NSString randomStringWithLength:kITDefaultRandomNameLength
                                ofCharacters:[self lowercaseCharacters]] capitalizedString];
}

@end
