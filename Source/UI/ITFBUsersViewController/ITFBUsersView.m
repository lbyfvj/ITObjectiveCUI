//
//  ITFBUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUsersView.h"

#import "ITDispatchQueue.h"

@implementation ITFBUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setModel:(id)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (_model != model) {
        [_model removeObserverObject:self];
        _model = model;        
        [_model addObserverObject:self];
    }
}

#pragma mark -
#pragma mark - ITModelObserver

- (void)modelDidLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = NO;
    });
}

- (void)modelWillLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        self.loadingViewVisible = YES;
    });
}

@end
