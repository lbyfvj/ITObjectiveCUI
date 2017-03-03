//
//  ITUsersView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUsers.h"

@interface ITUsersView : UIView
@property (nonatomic, strong)   ITUsers    *users;

@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;

@end
