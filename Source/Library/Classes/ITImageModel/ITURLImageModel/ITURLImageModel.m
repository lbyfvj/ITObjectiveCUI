//
//  ITURLImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITURLImageModel.h"

#import "NSFileManager+ITExtensions.h"
#import "NSString+ITExtensions.h"

@interface ITURLImageModel ()
@property (nonatomic, readonly)   NSURLSession              *downloadSession;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

- (void)deleteFile;

@end

@implementation ITURLImageModel

@dynamic downloadSession;
@dynamic fileURL;
@dynamic filePath;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self.downloadTask cancel];
}

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)downloadSession {
    ITReturnSharedInstance(^{
        return [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    });
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

- (BOOL)isCached {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    return self.fileURL.isFileURL && [fileManager fileExistsAtPath:self.fileURL.path];
}

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
    id completionBlock = ^(UIImage *image, NSError *error) {
        if (!image || error) {
            
            [self deleteFile];
            
            self.downloadTask = [self.downloadSession downloadTaskWithURL:self.url
                                                        completionHandler:^(NSURL *location,
                                                                            NSURLResponse *response,
                                                                            NSError *error)
                                 {
                                     if (error) {
                                         self.state = ITModelFailedLoading;
                                         
                                         return;
                                     }
                                     
                                     [[NSFileManager defaultManager] copyItemAtURL:location
                                                                             toURL:self.fileURL];
                                     
                                     [super performLoadingWithCompletionBlock:block];
                                 }];
            
            return;
        }
        
        ITDispatchBlock(block, image, error);
    };
    
    [super performLoadingWithCompletionBlock:completionBlock];
}

#pragma mark -
#pragma mark Private

- (void)deleteFile {
    NSError *error = nil;
    
    [[NSFileManager defaultManager] removeItemAtURL:self.fileURL error:&error];
}

@end
