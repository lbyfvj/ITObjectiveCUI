//
//  ITUserViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUserViewController.h"

#import "ITUserView.h"

#import "ITUserCell.h"

#import "ITMacro.h"

#import "UITableView+ITExtensions.h"

ITBaseViewController(ITUserViewController, userView, ITUserView)

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)users {
    if (_users != users) {
        _users = users;
    }
    
    self.userView.users = users;
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
    cell.user = self.user;
    
    return cell;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
