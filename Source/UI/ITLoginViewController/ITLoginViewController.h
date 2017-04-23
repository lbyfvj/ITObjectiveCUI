//
//  ITLoginViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITDBUser.h"

@interface ITLoginViewController : UIViewController <ITDBObjectObserver>
@property (nonatomic, strong)       ITDBUser      *user;

- (IBAction)onLoginButtonClicked:(id)sender;

@end
