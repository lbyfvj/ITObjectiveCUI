//
//  ITUsersViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUsers.h"

@interface ITUsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ITUsersObserver>
@property (nonatomic, strong)   ITUsers    *users;

- (IBAction)onEditButtonClicked:(id)sender;

@end
