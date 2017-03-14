//
//  ITSquareViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquareViewController.h"

#import "ITSquareView.h"

@interface ITSquareViewController ()
@property (nonatomic, readonly)   ITSquareView    *squareView;

@property (nonatomic, getter=isRunning)   BOOL running;

- (void)moveSquareOnPosition:(ITSquarePosition)squarePosition;

- (ITSquarePosition)nextPosition;

@end

@implementation ITSquareViewController

@dynamic squareView;

#pragma mark -
#pragma mark Accessors

- (void)setSquare:(ITSquare *)square {
    if (_square != square) {
        _square = square;
    }
    
    self.squareView.square = square;
}

- (ITSquareView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ITSquareView class]]) {
        return (ITSquareView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Private

- (void)moveSquareOnPosition:(ITSquarePosition)squarePosition {
    if (self.running) {
        [self.squareView setSquarePosition:squarePosition animated:YES completionHandler:^(void){
            self.square.squarePosition = squarePosition;
            [self moveSquareOnPosition:squarePosition];
        }];
    }
}

- (ITSquarePosition)nextPosition {
    ITSquarePosition squarePosition = (self.square.squarePosition + 1) % 4;
    
    return squarePosition;
}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.squareView.square = self.square;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onNextButtonClicked:(id)sender {
    self.running = YES;
    [self moveSquareOnPosition:[self nextPosition]];
}

- (IBAction)onStopButtonClicked:(id)sender {
    self.running = NO;
}

@end
