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
@property (nonatomic, assign)   BOOL    cancel;
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

- (void)setSquarePosition:(ITSquarePosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setRunning:(BOOL)running {
    self.cancel = !running;
    [self moveSequantialy];
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
                             
                             if (block) {
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
    if (!self.running && !self.cancel) {
        _running = YES;
        [self moveToNextPositionWithBlock:^(BOOL finished) {
            _running = NO;
            if (!self.cancel) {
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
    CGPoint origin;
    CGRect bounds = self.bounds;
    CGRect frame = self.label.frame;
    
    CGPoint bottomRight = CGPointMake(CGRectGetWidth(bounds) - CGRectGetWidth(frame),
                                      CGRectGetHeight(bounds) - CGRectGetHeight(frame));
    
    ITClangDiagnosticPushExpression("clang diagnostic ignored \"-Wswitch\"");
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
    ITClangDiagnosticPopExpression;
    
    frame.origin = origin;
    
    CGSize size = self.label.frame.size;
    CGRect rect = {origin, size};
    
    return rect;
}

@end
