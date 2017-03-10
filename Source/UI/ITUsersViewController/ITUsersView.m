//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

static NSString * const kITDoneButtonTitle = @"Done";
static NSString * const kITEditButtonTitle = @"Edit";

@implementation ITUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    
    if (_editing != editing) {
        _editing = editing;
        
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        [self.editButton setTitle:editing ? kITDoneButtonTitle : kITEditButtonTitle
                         forState:UIControlStateNormal];
    }
}

#pragma mark -
#pragma mark Public

- (void)updateTableViewWithUserAction:(ITUserAction)userAction
                    forRowAtIndexPath:(NSArray *)indexPaths
{
    UITableView *tableView = self.tableView;
    [tableView beginUpdates];
    
    switch (userAction) {
        case ITAddRow:
            [tableView insertRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        
        case ITDeleteRow:
            [tableView deleteRowsAtIndexPaths:indexPaths
                             withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        
        case ITReorderRows:
            [tableView moveRowAtIndexPath:indexPaths[0]
                              toIndexPath:indexPaths[1]];
            break;
    }
    
    [tableView endUpdates];
}


@end
