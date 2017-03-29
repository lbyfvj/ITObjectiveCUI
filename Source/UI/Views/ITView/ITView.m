//
//  ITView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITView.h"

@implementation ITView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.loadingView = [ITLoadingView viewOnSuperView:self];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [ITLoadingView viewOnSuperView:self];
    }
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(ITLoadingView *)loadingView {
    if (_loadingView != loadingView) {
        [_loadingView removeFromSuperview];

        _loadingView = loadingView;
        
        [self addSubview:loadingView];
    }
}

- (void)setLoadingViewVisible:(BOOL)loadingViewVisible {
    self.loadingView.visible = loadingViewVisible;
}

- (BOOL)isLoadingViewVisible {
    return self.loadingView.isVisible;
}

@end
