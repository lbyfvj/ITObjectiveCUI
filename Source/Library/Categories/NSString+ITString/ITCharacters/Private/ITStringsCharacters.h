//
//  ITStringsCharacters.h
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCharacters.h"

@interface ITStringsCharacters : ITCharacters
@property (nonatomic, readonly) NSArray *strings;

- (id)initWithStrings:(NSArray *)strings;

@end
