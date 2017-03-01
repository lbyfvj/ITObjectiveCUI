//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "NSString+ITRandomString.h"

@implementation ITUser

@dynamic userImage;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomString];
    }
    return self;
}

- (UIImage *)userImage {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
