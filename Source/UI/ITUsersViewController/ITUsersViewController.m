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

static const NSUInteger kITNumberOfSections = 1;

ITBaseViewController(ITUsersViewController, usersView, ITUsersView)

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ITUsers *)users {
    if (_users != users) {
        _users = users;
    }
    
    self.usersView.users = users;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    UITableView *tableView = self.usersView.tableView;
    NSUInteger usersCount = [self.users count];
    
    if (editing) {
        [tableView beginUpdates];
        
        for (NSUInteger i = 0; i < usersCount; i++) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:usersCount
                                                   inSection:i];
            [self.usersView.tableView insertRowsAtIndexPaths:@[path]
                                            withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
        [tableView endUpdates];
    }
    
    [tableView beginUpdates];
    
    for (NSUInteger i = 0; i < kITNumberOfSections; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:usersCount
                                               inSection:i];
        [self.usersView.tableView deleteRowsAtIndexPaths:@[path]
                                        withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    [tableView endUpdates];
    
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

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

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

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
    id user = self.users[indexPath.row];
    [self.users removeUserAtIndex:indexPath.row];
    [self.users addUser:user atIndex:newIndexPath.row];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= [self.users count]) {
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
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
