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

- (CGRect)calculateSquareCoordinates:(ITSquarePosition)squarePosition;

@end

@implementation ITSquareView

#pragma mark -
#pragma mark Accessors

- (void)setSquare:(ITSquare *)square {    
    if (_square != square) {
        _square = square;
    }
    
    self.label.frame = [self calculateSquareCoordinates:square.squarePosition];
}

#pragma mark -
#pragma mark Public

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
        completionHandler:(BOOL)completionHandler
{
    if (self.square.squarePosition != squarePosition) {
        UILabel *label = self.label;
        CGRect rect = [self calculateSquareCoordinates:squarePosition];
        [UIView animateWithDuration: (animated) ? ITAnimationDuration : 0
                              delay:ITDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             label.frame = rect;
                         }
                         completion:^(BOOL finished) {
                             if (completionHandler) {
                                 self.square.squarePosition = squarePosition;
                                 CGPoint coordinates = self.label.frame.origin;
                                 NSLog(@"Square Position: %lu", self.square.squarePosition);
                                 NSLog(@"Square coordinates: x: %f, y: %f", coordinates.x, coordinates.y);
                             };
                         }];
    }
}

#pragma mark -
#pragma mark Private

- (CGRect)calculateSquareCoordinates:(ITSquarePosition)squarePosition {
    CGPoint origin = CGPointZero;
    CGFloat width = self.bounds.size.width - self.label.frame.size.width;;
    CGFloat height = self.bounds.size.height - self.label.frame.size.height;
        
    switch (squarePosition) {
        case ITTopLeftCorner:
            origin.x = 0;
            origin.y = 0;
            break;
        
        case ITTopRightCorner:
            origin.x = width;
            origin.y = 0;
            break;
        
        case ITBottomRightCorner:
            origin.x = height;
            origin.y = width;
            break;
        
        case ITBottonLeftCorner:
            origin.x = height;
            origin.y = 0;
            break;
    }
    
    CGSize size = self.label.frame.size;
    CGRect rect = {origin, size};
    
    return rect;
}

@end
