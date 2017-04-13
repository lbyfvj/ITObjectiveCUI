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

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block;

@end

@implementation ITURLImageModel

@dynamic downloadSession;

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)downloadSession {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    ITReturnSharedInstance(session);
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

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {    
    if (self.cached) {
        [super performLoadingWithCompletionBlock:block];
    } else {
        [self performLoadingFromURLWithBlock:block];
    }
}

#pragma mark -
#pragma mark Private

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *image, id error))block {
    ITWeakify(self);
    id completionBlock = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        ITStrongifyAndReturnIfNil(self);
        if (error) {
            self.state = ITModelFailedLoading;
            
            return;
        }
        
        [[NSFileManager defaultManager] copyItemAtURL:location
                                                toURL:self.fileURL];
        [super performLoadingWithCompletionBlock:block];
    };
    
    self.downloadTask = [self.downloadSession downloadTaskWithURL:self.url
                                                completionHandler:completionBlock];
}

@end
