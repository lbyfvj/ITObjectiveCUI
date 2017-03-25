//
//  ITUsersView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersView.h"

#import "ITUsersTableView+ITExtensions.h"

static NSString * const kITDoneButtonTitle = @"Done";
static NSString * const kITEditButtonTitle = @"Edit";
static NSString * const kITNavigationBarTitle = @"Users";

@implementation ITUsersView

#pragma mark -
#pragma mark Class Methods

+ (ITUsersView *)viewWithFrame:(CGRect)frame {
    ITUsersView *view = [[self alloc] initWithFrame:frame];
    
    return view;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.navigationItem setTitle:kITNavigationBarTitle];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    return self;
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

- (void)setModel:(ITAbstractModel *)model {
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
#pragma mark - ITAbstractModelObserver

- (void)abstractModelDidLoad:(ITAbstractModel *)model {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [self hideLoadingView];
}

- (void)abstractModelWillLoad:(ITAbstractModel *)model {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    [self showLoadingView];
}

@end
