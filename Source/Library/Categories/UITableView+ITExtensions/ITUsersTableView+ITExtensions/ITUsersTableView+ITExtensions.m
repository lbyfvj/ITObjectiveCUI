//
//  ITUsersTableView+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersTableView+ITExtensions.h"

#import "ITModelChange+ITExtensions.h"
#import "UITableView+ITExtensions.h"

@implementation UITableView (ITExtemsions)

- (void)updateTableViewWithModelChange:(ITModelChange *)modelChange {
    [self updateTableViewWithBlock:^{
        [modelChange changeTableView:self withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}

@end
