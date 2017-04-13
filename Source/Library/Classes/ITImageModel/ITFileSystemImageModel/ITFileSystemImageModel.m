//
//  ITFileSystemImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFileSystemImageModel.h"

#import "NSFileManager+ITExtensions.h"
#import "NSString+ITExtensions.h"

@interface ITFileSystemImageModel ()

- (void)deleteFile;

@end

@implementation ITFileSystemImageModel

@dynamic fileURL;
@dynamic filePath;

#pragma mark -
#pragma mark Accessors

- (NSURL *)fileURL {
    NSURL *url = self.url;
    
    if (url.isFileURL) {
        return url;
    }
    NSString *fileName = [self.url.relativePath stringByAddingPercentEncodingWithalphanumericCharacterSet];
    NSString *path = [self.filePath stringByAppendingPathComponent:fileName];
    
    return [NSURL fileURLWithPath:path isDirectory:NO];
}


- (NSString *)filePath {
    NSString *cachePath = [[NSFileManager documentsDirectoryURL] path];
    NSString *host = [self.url.host stringByAddingPercentEncodingWithalphanumericCharacterSet];
    
    return [cachePath stringByAppendingPathComponent:host];
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {
    NSData *data = [NSData dataWithContentsOfURL:self.url
                                         options:NSDataReadingMappedIfSafe
                                           error:nil];
    
    UIImage *image = [UIImage imageWithData:data];
    
    if (!image) {
        [self deleteFile];
    }
    
    ITDispatchBlock(block, image, nil);
}

#pragma mark -
#pragma mark Private

- (void)deleteFile {
    NSError *error = nil;
    
    [[NSFileManager defaultManager] removeItemAtURL:self.fileURL error:&error];
}

@end
