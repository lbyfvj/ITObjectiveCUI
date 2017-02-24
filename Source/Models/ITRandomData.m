//
//  ITRandomData.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomData.h"

#import "NSString+ITRandomString.h"

@implementation ITRandomData

- (instancetype)init {
    self = [super init];
    if (self) {
        self.string = [NSString randomString];
    }
    return self;
}

@end
