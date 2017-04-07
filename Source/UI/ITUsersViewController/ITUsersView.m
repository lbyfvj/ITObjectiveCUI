//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

#import "ITUsersTableView+ITExtensions.h"
#import "ITDispatchQueue.h"

static NSString * const kITDoneButtonTitle = @"Done";
static NSString * const kITEditButtonTitle = @"Edit";

@implementation ITUsersView

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing != editing) {
        _editing = editing;
        
        [self.tableView setEditing:!self.tableView.editing animated:YES];
        [self.editButton setTitle:editing ? kITDoneButtonTitle : kITEditButtonTitle];
    }
}

- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
    }
}

#pragma mark -
#pragma mark Public

- (void)updateUsersViewWithModelChange:(ITModelChange *)modelChange {    
    [self.tableView updateTableViewWithModelChange:modelChange];
}

#pragma mark -
#pragma mark - ITModelObserver

- (void)modelDidLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    self.loadingViewVisible = NO;
}

- (void)modelWillLoad:(ITModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    self.loadingViewVisible = YES;
}

@end
