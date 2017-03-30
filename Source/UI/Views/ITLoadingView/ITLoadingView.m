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

static const NSTimeInterval kITLoadingDuration = 1;
static const CGFloat        kITAlpha = 0.5;

@implementation ITLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)viewOnSuperView:(UIView *)superView {
    ITLoadingView *view = [[NSBundle mainBundle] objectWithClass:[self class]];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    view.frame = superView.bounds;
    
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
    [[self superview] bringSubviewToFront:self];
    
    [UIView animateWithDuration:animated ? kITLoadingDuration : 0
                     animations:^{
                         if (!visible) {
                             [self removeFromSuperview];
                         }
                         self.alpha = visible ? kITAlpha : 0.0;
                     }
     
                     completion:^(BOOL finished) {
                         _visible = visible;
                         ITDispatchBlock(block, finished);
                     }];
}

@end
