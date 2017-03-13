//
//  ITSquareViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITSquareViewController.h"

#import "ITSquareView.h"

#import "ITMacro.h"

ITViewControllerSynthesizeRootView(ITSquareViewController, squareView, ITSquareView)

@implementation ITSquareViewController

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onNextButtonClicked:(id)sender {
    [self.squareView moveToNextPosition];
}

- (IBAction)onStopButtonClicked:(id)sender {
    self.squareView.running = NO;
}

- (IBAction)onStartButtonClicked:(id)sender {
    self.squareView.running = YES;    
}

@end
