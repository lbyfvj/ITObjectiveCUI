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

static NSString * const kITAddRowTitle = @"Add new user";

ITBaseViewController(ITUsersViewController, usersView, ITUsersView)

#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.users = nil;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ITUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        _users = users;
        [_users addObserver:self];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    self.usersView.editing = !self.usersView.editing;
    UITableView *tableView = self.usersView.tableView;
    
    [tableView beginUpdates];
    for (NSUInteger i =0; i < kITNumberOfSections; i++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:[self.users count]
                                               inSection:i];
        if (editing) {
            [tableView insertRowsAtIndexPaths:@[path]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [tableView deleteRowsAtIndexPaths:@[path]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }
    
    [tableView endUpdates];
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

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onEditButtonClicked:(id)sender {
    [self setEditing:!self.usersView.editing animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    NSUInteger addRow = self.usersView.editing ? 1 : 0;
    
    return [self.users count] + addRow;
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITUserCell *cell = [tableView reusableCellWithClass:[ITUserCell class]];

    if (indexPath.row >= [self.users count] && self.usersView.editing) {
        cell.textLabel.text = kITAddRowTitle;
    } else {
        cell.user = self.users[indexPath.row];
    }
    
    return cell;
}

//- (BOOL)        tableView:(UITableView *)tableView
//    canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

//- (BOOL)        tableView:(UITableView *)tableView
//    canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row >= [self.users count] && self.usersView.editing) {
//        return NO;
//    }
//    
//    return YES;
//}

- (void)    tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITUsers *users = self.users;
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wswitch"    
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [users removeUserAtIndex:indexPath.row];
            //[tableView deleteRowsAtIndexPaths:@[indexPath]
            //                 withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        case UITableViewCellEditingStyleInsert:
            [users addUser];
            //[tableView insertRowsAtIndexPaths:@[indexPath]
            //                 withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
    #pragma clang diagnostic pop
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)indexPath
          toIndexPath:(NSIndexPath *)newIndexPath
{
    [self.users moveUserAtIndex:indexPath.row toIndex:newIndexPath.row];
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
#pragma mark ITUsersObservers

- (void)users:(ITUsers *)users didAddedWithPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.usersView.tableView;
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

- (void)users:(ITUsers *)users didDeletedWithPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.usersView.tableView;
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

- (void)users:(ITUsers *)users didReorderWithPath:(NSMutableArray *)reorderedPath {
    UITableView *tableView = self.usersView.tableView;
    [tableView beginUpdates];
    [tableView moveRowAtIndexPath:reorderedPath[0]
                      toIndexPath:reorderedPath[1]];
    [tableView endUpdates];
}

@end
