//
//  ITImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageModel.h"

#import "ITDispatchQueue.h"
#import "ITImageCache.h"

#import "ITFileSystemImageModel.h"
#import "ITURLImageModel.h"

@implementation ITImageModel

#pragma mark - 
#pragma marl Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {    
    Class cls = [url.scheme isEqualToString:@"file"] ? [ITFileSystemImageModel class] : [ITURLImageModel class];
    
    return [[cls alloc] initWithURL:url];
}

#pragma mark - 
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    id imageCache = [[ITImageCache cache] objectForKey:url];
    if (imageCache) {
        return imageCache;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        [[ITImageCache cache] addObject:self forKey:url];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)dump {
    self.image = nil;
    self.state = ITModelUnloaded;
}

- (void)performLoadingWithCompletionBlock:(void(^)(UIImage *image, id error))block {
    
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        self.state = self.image ? ITModelLoaded : ITModelFailedLoading;
    });
}

- (void)performLoading {
    sleep(1);
    ITWeakify(self);
    [self performLoadingWithCompletionBlock:^(UIImage *image, id error) {
        ITStrongifyAndReturnIfNil(self);
        [self finalizeLoadingWithImage:image error:error];
        [self notifyOfLoadingStateWithImage:image error:error];
    }];
}

@end
