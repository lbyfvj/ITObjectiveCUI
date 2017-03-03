//
//  ITUsersViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersViewController.h"

#import "ITUsersView.h"

#import "ITUserCell.h"

#import "ITMacro.h"

#import "UITableView+ITExtensions.h"

ITBaseViewController(ITUsersViewController, usersView, ITUsersView)

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ITUsers *)users {
    if (_users != users) {
        _users = users;
    }
    
    self.usersView.users = users;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    
    return [self.users count];
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITUserCell *cell = [tableView reusableCellWithClass:[ITUserCell class]];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
