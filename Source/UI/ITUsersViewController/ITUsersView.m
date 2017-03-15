//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

#import "UITableView+ITExtensions.h"

static NSString * const kITDoneButtonTitle = @"Done";
static NSString * const kITEditButtonTitle = @"Edit";
static NSString * const kITNavigationBarTitle = @"Users";

@implementation ITUsersView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.navigationItem setTitle:kITNavigationBarTitle];
}

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    
    if (_editing != editing) {
        _editing = editing;
        
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        [self.editButton setTitle:editing ? kITDoneButtonTitle : kITEditButtonTitle];
    }
}

#pragma mark -
#pragma mark Public

- (void)updateUsersViewWithModelChange:(ITModelChange *)modelChange {
    
    [self.tableView updateTableViewWithModelChange:modelChange];
    
}

@end
