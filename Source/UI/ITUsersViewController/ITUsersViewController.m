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
#pragma mark Interface Handling

- (IBAction)onEditButtonClicked:(id)sender {
    UITableView *tableView = self.usersView.tableView;
    BOOL isEditing = tableView.isEditing;
    
    [sender setTitle:isEditing ? @"Edit" : @"Done"
            forState:UIControlStateNormal];
    
    [tableView setEditing:!isEditing animated:YES];
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
    
    if (indexPath.row >= [self.users count] && self.isEditing) {
        cell.textLabel.text = @"Add";
    }
    
    cell.user = self.users[indexPath.row];

    
    return cell;
}

- (BOOL)        tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)    tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wswitch"    
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [self.users removeUserAtIndex:indexPath.row];
            [self.usersView.tableView reloadData];
            break;
            
        case UITableViewCellEditingStyleInsert:
            [self.users addUser];
            [self.usersView.tableView insertRowsAtIndexPaths:@[indexPath]
                                            withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.usersView.tableView reloadData];
            break;
    }
    #pragma clang diagnostic pop
}

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath
               toIndexPath:(NSIndexPath *)newIndexPath
{
    id user = self.users[indexPath.row];
    [self.users removeUserAtIndex:indexPath.row];
    [self.users addUser:user atIndex:newIndexPath.row];
}

- (BOOL)        tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= [self.users count]) {
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.usersView.tableView.allowsSelectionDuringEditing = YES;
    
    [self.usersView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
