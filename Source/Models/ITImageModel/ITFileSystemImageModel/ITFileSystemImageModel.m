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

#pragma mark -
#pragma mark Accessors

- (BOOL)isCached {    
    return [[NSFileManager defaultManager] fileExistsAtPath:self.path];
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletion:(void (^)(UIImage *image, id error))completion {
    NSString *path = self.cached ? self.path : self.url.path;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    completion(image, nil);
}

@end
