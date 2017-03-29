//
//  ITURLImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITURLImageModel.h"

@interface ITURLImageModel ()
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block;

@end

@implementation ITURLImageModel

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)downloadSession {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    ITSharedInstance(session);
}

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *, id))block {
    if (self.cached) {
        [super performLoadingWithCompletionBlock:block];
    } else {
        [self performLoadingFromURLWithBlock:block];
    }
}

- (void)save {
    
}

#pragma mark -
#pragma mark Private

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block {
    
}

@end
