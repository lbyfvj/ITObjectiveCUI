//
//  NSString+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ITExtensions)

+ (instancetype)charactersWithUnicodeRange:(NSRange)range;

+ (instancetype)capitalizedCharacters;

+ (instancetype)lowercaseCharacters;

+ (instancetype)numericCharacters;

+ (instancetype)characters;

+ (instancetype)randomStringWithLength:(NSUInteger)length ofCharacters:(NSString *)characters;

+ (instancetype)randomStringWithLength:(NSUInteger)length;

+ (instancetype)randomString;

- (instancetype)stringByAddingPercentEncodingWithalphanumericCharacterSet;

@end
