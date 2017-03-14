//
//  ITUser.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUser.h"

#import "NSString+ITRandomName.h"

static NSString * const kITImageName = @"image";
static NSString * const kITImageType = @"jpg";

@implementation ITUser

@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
    }
    return self;
}

- (UIImage *)image {
//    NSURL *url = [[NSBundle mainBundle] URLForResource:[NSString stringWithFormat:@"%@", kITImageName]
//                                         withExtension:[NSString stringWithFormat:@"%@", kITImageType]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:kITImageName
                                                     ofType:kITImageType];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
