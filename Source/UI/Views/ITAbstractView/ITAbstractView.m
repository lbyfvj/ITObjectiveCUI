//
//  ITAbstractView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITAbstractView.h"

@implementation ITAbstractView

#pragma mark -
#pragma mark Class Methods

+ (ITAbstractView *)viewWithFrame:(CGRect)frame {
    ITAbstractView *view = [[self alloc] initWithFrame:frame];
    
    return view;
}

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

#pragma mark -
#pragma mark - Public

- (void)showLoadingView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.loadingView setVisible:YES animated:YES];
}

- (void)hideLoadingView {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.loadingView setVisible:NO animated:YES];
}


@end
