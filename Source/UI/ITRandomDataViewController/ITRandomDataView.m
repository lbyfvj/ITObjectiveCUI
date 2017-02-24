//
//  ITRandomDataView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomDataView.h"

@implementation ITRandomDataView

#pragma mark -
#pragma mark Accessors

- (void)setRandomData:(ITRandomData *)randomData {
    if (_randomData != randomData) {
        _randomData = randomData;
    }
}

@end
