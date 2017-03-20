//
//  ITLoadingView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 17.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITLoadingView.h"

#import "ITMacro.h"
#import "NSBundle+ITExtensions.h"

static const NSTimeInterval kITLoadingDuration = 3;
static const NSTimeInterval kITDelay = 0.1;

@implementation ITLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewOnSuperView:(UIView *)superView {
    ITLoadingView *view = [[NSBundle mainBundle] objectWithClass:[self class]];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [superView addSubview:view];
    
    return view;
}

#pragma mark -
#pragma mark Accessors

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:NO completionHandler:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated
{
    [self setVisible:visible animated:animated completionHandler:nil];
}

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
 completionHandler:(void (^)(BOOL finished))block;
{
    [UIView animateWithDuration:animated ? kITLoadingDuration : 0
                          delay:kITDelay
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         if (visible) {
                             [[self superview] bringSubviewToFront:self];
                             self.alpha = 0.5;
                         } else {
                             [self removeFromSuperview];
                             self.alpha = 0;
                         }
                     }
                     completion:^(BOOL finished) {
                         _visible = visible;
                         
                         ITDispatchBlock(block, finished);
                     }];
}

#pragma mark -
#pragma mark ITArrayModelObserver

- (void)arrayModelDidLoad:(ITArrayModel *)model {
    [self setVisible:NO animated:YES completionHandler:nil];
}

- (void)arrayModelWillLoad:(ITArrayModel *)model {
    [self setVisible:YES animated:YES completionHandler:nil];
}

@end
