//
//  ITSquareView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquareView.h"

#import "ITMacro.h"
#import "ITDispatchQueue.h"

static const NSTimeInterval kITAnimationDuration = 1.5;
static const NSTimeInterval kITDelay = 0.0;
static const NSUInteger kITSquarePositionsCount = 4;

@interface ITSquareView ()
@property (nonatomic, assign, getter=isCanceled)   BOOL    canceled;
@property (nonatomic, assign)	NSUInteger	currentCornerIndex;

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated;

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))block;

- (void)moveToNextPositionWithBlock:(void (^)(BOOL finished))block;

- (void)moveSequantialy;

- (ITSquarePosition)nextPosition;

- (CGRect)squarePositionRect:(ITSquarePosition)squarePosition;

@end

@implementation ITSquareView

#pragma mark -
#pragma mart Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setRunning:(BOOL)running {
    self.canceled = !running;
    [self moveSequantialy];
}

- (void)setSquarePosition:(ITSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(ITSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL finished))block
{
    if (_squarePosition != squarePosition) {
        CGRect rect = [self squarePositionRect:squarePosition];
        [UIView animateWithDuration: (animated) ? kITAnimationDuration : 0
                              delay:kITDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.label.frame = rect;
                         }
                         completion:^(BOOL finished) {
                             if (finished) {
                                 _squarePosition = squarePosition;
                             }

                             ITDispatchBlock(block, finished);
                         }];
    }
}

#pragma mark -
#pragma mark Public

- (void)moveToNextPosition {
    if (!self.running) {
        _running = YES;
        [self moveToNextPositionWithBlock:^(BOOL finished) {
            _running = NO;
            if (!self.canceled) {
                return;
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
    if (!self.running && !self.canceled) {
        _running = YES;
        [self moveToNextPositionWithBlock:^(BOOL finished) {
            _running = NO;
            if (!self.canceled) {
                ITAsyncPerformInMainQueue(^{
                    [self moveSequantialy];
                });
            }
        }];
    }
}

#pragma mark -
#pragma mark Private

- (ITSquarePosition)nextPosition {
    ITSquarePosition squarePosition = (self.squarePosition + 1) % kITSquarePositionsCount;
    
    return squarePosition;
}

- (CGRect)squarePositionRect:(ITSquarePosition)squarePosition {
    CGPoint origin = CGPointZero;
    CGRect bounds = self.bounds;
    CGRect frame = self.label.frame;
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(bounds) - CGRectGetWidth(frame),
                                      CGRectGetHeight(bounds) - CGRectGetHeight(frame));
    
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
            
        default:
            break;
    }
    
    frame.origin = origin;
    
    return frame;
}

@end
