//
//  ITUsersTableView+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITModelChange.h"

@interface UITableView (ITExtemsions)

- (void)updateTableViewWithModelChange:(ITModelChange *)change;

@end
