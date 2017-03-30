//
//  ITURLImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITURLImageModel.h"

@interface ITURLImageModel ()
@property (nonatomic, strong)   NSURLSession                *downloadSession;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block;

@end

@implementation ITURLImageModel

@dynamic downloadSession;

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)downloadSession {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    ITSharedInstance(session);
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *, id))block {    
    if (self.cached) {
        [super performLoadingWithCompletionBlock:block];
    } else {
        [self performLoadingFromURLWithBlock:block];
    }
}

#pragma mark -
#pragma mark Private

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block {
    ITWeakify(self);
    self.downloadTask = [self.downloadSession downloadTaskWithURL:self.url
                                                completionHandler:^(NSURL *location,
                                                                    NSURLResponse *response,
                                                                    NSError *error)
    {
        ITStrongifyAndReturnIfNil(self);
        if (!error) {
            [[NSFileManager defaultManager] copyItemAtURL:location
                                                    toURL:[NSURL fileURLWithPath:self.filePath]
                                                    error:nil];
            [super performLoadingWithCompletionBlock:block];
        }
    }];
}

@end
