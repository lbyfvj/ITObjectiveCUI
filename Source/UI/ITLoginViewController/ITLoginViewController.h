//
//  ITLoginViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUser.h"

@interface ITLoginViewController : UIViewController <ITUserObserver>
@property (nonatomic, strong)       ITUser      *user;

- (IBAction)onLoginButtonClicked:(id)sender;

@end
