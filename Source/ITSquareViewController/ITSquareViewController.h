//
//  ITSquareViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 21.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITSquare.h"

@interface ITSquareViewController : UIViewController
@property (nonatomic, strong)   ITSquare    *square;

- (IBAction)nextButtonClicked:(id)sender;

@end
