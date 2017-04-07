//
//  ITFileSystemImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFileSystemImageModel.h"

#import "NSFileManager+ITExtensions.h"

@implementation ITFileSystemImageModel

@dynamic filePath;

#pragma mark -
#pragma mark Accessors

- (NSString *)filePath {
    return self.url.path;
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {
    block([UIImage imageWithContentsOfFile:self.filePath], nil);
}

@end
