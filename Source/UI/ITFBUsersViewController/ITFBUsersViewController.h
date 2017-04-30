//
//  ITFBUsersViewController.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITDBUser.h"
#import "ITArrayModel.h"

@interface ITFBUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ITDBObjectObserver>
@property (nonatomic, strong)           ITDBUser                  *user;

@end
