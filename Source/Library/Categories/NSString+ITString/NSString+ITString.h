//
//  NSString+ITString.h
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITCharacters.h"

@interface NSString (ITString)

+ (id)randomString;
+ (id)randomStringWithLenght:(NSUInteger)lenght;
+ (id)randomStringWithLenght:(NSUInteger)lenght ofCharacters:(ITCharacters *)characters;

- (NSArray *)symbols;

@end
