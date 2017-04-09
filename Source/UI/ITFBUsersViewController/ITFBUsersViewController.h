//
//  ITFBUsersViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUser.h"
#import "ITArrayModel.h"

@interface ITFBUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ITArrayModelObserver>
@property (nonatomic, strong)           ITUser                  *user;

@end
