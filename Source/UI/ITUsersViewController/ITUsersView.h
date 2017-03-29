//
//  ITUsersView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUsers.h"

#import "ITModelChange.h"
#import "ITView.h"

static const NSUInteger kITNumberOfSections = 1;

@interface ITUsersView : ITView <ITModelObserver>
@property (nonatomic, strong)   ITModel     *model;
@property (nonatomic, strong)   IBOutlet    UITableView         *tableView;
@property (nonatomic, strong)   IBOutlet    UIBarButtonItem     *editButton;

@property (nonatomic, assign, getter=isEditing) BOOL    editing;

- (void)updateUsersViewWithModelChange:(ITModelChange *)modelChange;

@end
