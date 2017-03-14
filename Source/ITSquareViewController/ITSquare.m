//
//  ITSquare.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquare.h"

@implementation ITSquare

#pragma mark -
#pragma Initializations and Deallocations

- (instancetype)initWithSquarePosition:(ITSquarePosition)squarePosition {
    self = [super init];
    if (self) {
        self.squarePosition = squarePosition;
    }
    
    return self;
}

@end
