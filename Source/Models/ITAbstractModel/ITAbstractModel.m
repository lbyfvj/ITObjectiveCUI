//
//  ITAbstractModel.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITAbstractModel.h"

#import "ITDispatchQueue.h"

#import "NSFileManager+ITExtensions.h"

@implementation ITAbstractModel

#pragma mark -
#pragma mark Public

- (NSString *)path {
    NSString *fileName = [NSString stringWithFormat:@"%@.plist", NSStringFromClass([self class])];
    NSURL *appDirectory = [NSFileManager applicationDocumentsDirectory];
    
    return [[appDirectory path] stringByAppendingString:fileName];
}

- (void)save {
    
}

- (void)load {
    @synchronized(self) {
        NSUInteger state = self.state;
        if (ITAbstractModelLoaded == state || ITAbstractModelLoading == state) {
            [self notifyOfState:state];
            return;
        }
        
        self.state = ITAbstractModelLoading;
    }
    
    ITAsyncPerformInBackgroundQueue(^{
        [self performLoading];
    });
}

- (void)performLoading {
    
}

#pragma mark -
#pragma mark ITObservableObject

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ITAbstractModelUnloaded:
            return @selector(abstractModelDidUnload:);
            
        case ITAbstractModelLoaded:
            return @selector(abstractModelDidLoad:);
            
        case ITAbstractModelLoading:
            return @selector(abstractModelWillLoad:);
            
        case ITAbstractModelFailedLoading:
            return @selector(abstractModelDidFailLoading:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
