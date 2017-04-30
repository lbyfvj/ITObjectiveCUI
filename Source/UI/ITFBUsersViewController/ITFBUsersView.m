//
//  ITFBUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUsersView.h"

#import "ITDispatchQueue.h"
#import "ITMacro.h"

@implementation ITFBUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    ITPrintDebugLog;
    if (_model != model) {
        [_model removeObserverObject:self];
        _model = model;        
        [_model addObserverObject:self];
    }
}

#pragma mark -
#pragma mark - ITModelObserver

- (void)modelDidLoad:(ITModel *)model {
    ITPrintDebugLog;
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = NO;
    });
}

- (void)modelWillLoad:(ITModel *)model {
    ITPrintDebugLog;
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = YES;
    });
}

@end
