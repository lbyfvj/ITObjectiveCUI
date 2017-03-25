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
static const NSTimeInterval kITDelay = 0.3;
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
                          delay:kITDelay
                        options:UIViewAnimationOptionLayoutSubviews
                     animations:^{
                         if (!visible) {
                             [self.spinner stopAnimating];
                             [self removeFromSuperview];
                         }
                         
                         self.alpha = visible ? kITAlpha : 0.0;
                         [self.spinner startAnimating];
                     }
                     completion:^(BOOL finished) {
                         _visible = visible;                         
                         ITDispatchBlock(block, finished);
                     }];
}

//#pragma mark -
//#pragma mark ITArrayModelObserver
//
//- (void)arrayModelDidLoad:(ITArrayModel *)model {
//    [self setVisible:NO animated:YES completionHandler:nil];
//}
//
//- (void)arrayModelWillLoad:(ITArrayModel *)model {
//    [self setVisible:YES animated:YES completionHandler:nil];
//}

@end
