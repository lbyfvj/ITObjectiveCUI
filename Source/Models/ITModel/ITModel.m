//
//  ITModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModel.h"

#import "ITDispatchQueue.h"

#import "NSFileManager+ITExtensions.h"

@implementation ITModel

#pragma mark -
#pragma mark Public

- (NSString *)path {
    NSString *fileName = [NSString stringWithFormat:@"%@.plist", NSStringFromClass([self class])];
    NSURL *appDirectory = [NSFileManager documentsDirectory];
    
    return [[appDirectory path] stringByAppendingString:fileName];
}

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        if (ITModelLoaded == state || ITModelLoading == state) {
            [self notifyOfState:state];
            return;
        }
        
        self.state = ITModelLoading;
    }
    
    ITAsyncPerformInBackgroundQueue(^{
        [self performLoading];
    });
}

- (void)performLoading {
    self.state = ITModelLoaded;
}

#pragma mark -
#pragma mark ITObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITModelUnloaded:
            return @selector(modelDidUnload:);
            
        case ITModelLoaded:
            return @selector(modelDidLoad:);
            
        case ITModelLoading:
            return @selector(modelWillLoad:);
            
        case ITModelFailedLoading:
            return @selector(modelDidFailLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
