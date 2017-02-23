//
//  ITRandomStringView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomStringView.h"

@implementation ITRandomStringView

#pragma mark -
#pragma mark Accessors

- (void)setRandomString:(ITRandomString *)randomString {
    if (_randomString != randomString) {
        _randomString = randomString;
    }
}

@end
