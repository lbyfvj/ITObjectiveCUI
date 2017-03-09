//
//  ITImageModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageModel.h"

#import "ITImageModelDispatcher.h"
#import "ITMacro.h"

@interface ITImageModel ()
@property (nonatomic, strong)     UIImage       *image;
@property (nonatomic, strong)     NSURL         *url;
@property (nonatomic, strong)     NSOperation   *operation;

- (NSOperation *)imageLoadingOperation;

@end

@implementation ITImageModel

#pragma mark - 
#pragma marl Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark - 
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.operation = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOperation:(NSOperation *)operation {
    if (_operation != operation) {
        [_operation cancel];
        
        _operation = operation;
        
        if (operation) {
            ITImageModelDispatcher *dispatcher = [ITImageModelDispatcher sharedDispatcher];
            [[dispatcher queue] addOperation:operation];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    
    @synchronized (self) {
        if (ITImageModelLoading == self.state) {
            return;
        }
        
        if (ITImageModelLoaded == self.state) {
            [self notifyOfState:ITImageModelLoaded];
            return;
        }
        
        self.state = ITImageModelLoading;
    }

    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = ITImageModelUnloaded;
}

#pragma mark -
#pragma mark Private

- (NSOperation *)imageLoadingOperation {
    ITWeakify(self);
    //__weak ITImageModel *weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        //__strong ITImageModel *strongSelf = weakSelf;
        ITStrongify(self);
        self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
    }];
    
    operation.completionBlock = ^{
        //__strong ITImageModel *strongSelf = weakSelf;
        ITStrongify(self);
        @synchronized (self) {
            self.state = self.image ? ITImageModelLoaded : ITImageModelFailedLoading;
        }
    };
    
    return operation;
}


@end
