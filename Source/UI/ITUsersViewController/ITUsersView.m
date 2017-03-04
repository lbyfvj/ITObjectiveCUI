//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

static const NSUInteger kITNumberOfSections = 1;

@implementation ITUsersView

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ITUsers *)users {
    if (_users != users) {
        _users = users;
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    [super setEditing:editing animated:animated];
    
    UITableView *tableView = self.tableView;
    NSUInteger usersCount = [self.users count];
    
    if (editing) {
        [tableView beginUpdates];
        
        for (NSUInteger i = 0; i < usersCount; i++) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:usersCount
                                                   inSection:i];
            [self.tableView insertRowsAtIndexPaths:@[path]
                                            withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        [tableView endUpdates];
    }
    
    [tableView beginUpdates];
    
    for (NSUInteger i = 0; i < kITNumberOfSections; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:usersCount
                                               inSection:i];
        [self.tableView deleteRowsAtIndexPaths:@[path]
                                        withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    [tableView endUpdates];
    
}

@end
