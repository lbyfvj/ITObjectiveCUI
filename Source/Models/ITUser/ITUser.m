//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "NSString+ITRandomName.h"

static NSString const *kITImageName = @"image";
static NSString const *kITImageType = @"jpg";

@implementation ITUser

@dynamic userImage;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
    }
    return self;
}

- (UIImage *)userImage {
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@", kITImageName]
                                                     ofType:[NSString stringWithFormat:@"%@", kITImageType]];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
