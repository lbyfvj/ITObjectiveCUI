//
//  ITSquareView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquareView.h"

static const NSTimeInterval ITAnimationDuration = 0.5;
static const NSTimeInterval ITDelay = 0.0;

@interface ITSquareView ()

- (ITSquarePosition)nextPosition;

- (CGRect)squarePositionRect:(ITSquarePosition)squarePosition;

@end

@implementation ITSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquarePosition:(ITSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setRunning:(BOOL)running {
    if (_running != running) {
        _running = running;
    }
    
    if (running) {
        [self moveSequantialy];
    }
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
        completionHandler:(void (^)(BOOL finished))block
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
                             if (block) {
                                 _squarePosition = squarePosition;
                                 block(finished);
                             }
                         }];
    }
}

- (void)moveToNextPositionWithBlock:(void (^)(BOOL finished))block {
    [self setSquarePosition:[self nextPosition]
                   animated:YES
          completionHandler:block];
    NSLog(@"New Position: %lu", self.squarePosition);
}

- (void)moveSequantialy {
    [self moveToNextPositionWithBlock:^(BOOL finished) {
        if (self.running && finished) {
            [self moveSequantialy];
        }
    }];
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
        
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wswitch"
    switch (squarePosition) {
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
    #pragma clang diagnostic pop
    
    frame.origin = origin;
    
    CGSize size = self.label.frame.size;
    CGRect rect = {origin, size};
    
    return rect;
}

@end
