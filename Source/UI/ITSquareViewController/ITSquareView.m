//
//  ITSquareView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquareView.h"

static const NSTimeInterval ITAnimationDuration = 1.0;
static const NSTimeInterval ITDelay = 0.0;

@interface ITSquareView ()
@property (nonatomic, assign, getter=isRunning)   BOOL running;

- (ITSquarePosition)nextPosition;

- (CGRect)squarePositionRect:(ITSquarePosition)squarePosition;

@end

@implementation ITSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(ITSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

#pragma mark -
#pragma mark Public

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(void))block
{
    if (self.squarePosition != squarePosition) {
        CGRect rect = [self squarePositionRect:squarePosition];
        [UIView animateWithDuration: (animated) ? ITAnimationDuration : 0
                              delay:ITDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.label.frame = rect;
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _squarePosition = squarePosition;
                                 //block();
                             }
                         }];
    }
}

- (void)moveToNextPosition {
    ITSquarePosition nextPosition = [self nextPosition];
    [self setSquarePosition:nextPosition animated:YES completionHandler:nil];
}

#pragma mark -
#pragma mark Private

- (ITSquarePosition)nextPosition {
    ITSquarePosition squarePosition = (self.squarePosition + 1) % 4;
    
    return squarePosition;
}

- (CGRect)squarePositionRect:(ITSquarePosition)squarePosition {
    CGPoint origin;
    CGRect bounds = self.bounds;
    CGRect frame = self.label.frame;
    
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(bounds) - CGRectGetWidth(frame),
                                      CGRectGetHeight(bounds) - CGRectGetHeight(frame));
        
    switch (squarePosition) {
        case ITTopLeftCorner:
            origin = CGPointZero;
            break;
            
        case ITTopRightCorner:
            origin.x = bottomRight.x;
            break;
        
        case ITBottomRightCorner:
            origin = bottomRight;
            break;
        
        case ITBottomLeftCorner:
            origin.y = bottomRight.y;
            break;
    }
    
    frame.origin = origin;
    
    CGSize size = self.label.frame.size;
    CGRect rect = {origin, size};
    
    return rect;
}

@end
