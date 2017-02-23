//
//  ITRangeCharacters.h
//  ITSources
//
//  Created by Ivan Tsyganok on 20.12.16.
//  Copyright © 2016 Ivan Tsyganok. All rights reserved.
//

#import "ITCharacters.h"

@interface ITRangeCharacters : ITCharacters
@property (nonatomic, readonly) NSRange range;

- (id) initWithRange:(NSRange)range;

@end
