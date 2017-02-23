//
//  ITRandomString.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITRandomString.h"

#import "NSString+ITString.h"

@interface ITRandomString ()
@property (nonatomic, assign)     NSString    *randomString;

@end

@implementation ITRandomString

- (instancetype)init {
    self = [super init];
    if (self) {
        self.randomString = [NSString randomString];
    }
    return self;
}

@end
