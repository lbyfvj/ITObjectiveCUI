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
    NSString *fileName = self.url.lastPathComponent;
    NSString *appDirectory = [[NSFileManager documentsDirectory] path];
    
    return [appDirectory stringByAppendingPathComponent:fileName];
}

- (BOOL)isCached {    
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {
    NSString *path = self.cached ? self.filePath : self.url.path;
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    block(image, nil);
}

@end
