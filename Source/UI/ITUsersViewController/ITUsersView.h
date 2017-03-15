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

//typedef NS_ENUM(NSUInteger, ITUserAction){
//    ITAddRow,
//    ITDeleteRow,
//    ITReorderRows
//};

static const NSUInteger kITNumberOfSections = 1;

@interface ITUsersView : UIView
@property (nonatomic, strong)   IBOutlet    UITableView         *tableView;
@property (nonatomic, strong)   IBOutlet    UIBarButtonItem     *editButton;
@property (strong, nonatomic)   IBOutlet    UINavigationItem    *navigationItem;

@property (nonatomic, assign, getter=isEditing) BOOL    editing;

//- (void)updateTableViewWithUserAction:(ITAction)userAction
//                    forRowAtIndexPath:(NSArray *)indexPaths;

- (void)updateUsersViewWithModelChange:(ITModelChange *)modelChange;

@end
