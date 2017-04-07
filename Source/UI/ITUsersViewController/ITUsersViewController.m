//
//  ITUsersViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUsersViewController.h"

#import "ITUsersView.h"
#import "ITUser.h"
#import "ITUserCell.h"
#import "ITAddRowCell.h"
#import "ITMacro.h"
#import "UITableView+ITExtensions.h"
#import "ITModelChange.h"
#import "ITDispatchQueue.h"

static NSString * const kITAddRowTitle = @"Add new user";
static NSString * const kITNavigationBarTitle = @"Users";

ITViewControllerSynthesizeRootView(ITUsersViewController, usersView, ITUsersView)

@interface ITUsersViewController ()

- (void)addRowAnimationInEditing:(BOOL)editing;
- (BOOL)shouldDisplayAddRowWithIndexPath:(NSIndexPath *)indexPath;

@end

@implementation ITUsersViewController

@synthesize usersModel = _usersModel;

#pragma mark -
#pragma mark - Initializations and Deallocations

#pragma mark -
#pragma mark Accessors

- (void)setUsersModel:(ITUsers *)usersModel {
    if (_usersModel != usersModel) {
        [_usersModel removeObserver:self];
        
        _usersModel = usersModel;
        
        [_usersModel addObserver:self];

        if (self.isViewLoaded) {
            [_usersModel load];
        }
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {    
    self.usersView.editing = !self.usersView.editing;
    
    [self addRowAnimationInEditing:editing];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

    self.usersView.model = self.usersModel;    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = kITNavigationBarTitle;
    
    ITUsers *usersModel = self.usersModel;
    ITUsersView *usersView = self.usersView;
    
    [usersModel addObserver:usersView];
    
    [usersModel load];
    
    [usersView.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark Private

- (void)addRowAnimationInEditing:(BOOL)editing {
    UITableView *tableView = self.usersView.tableView;
    
    [tableView updateWithBlock:^{
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.usersModel.count
                                               inSection:0];
        if (editing) {
            [tableView insertRowsAtIndexPaths:@[path]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        } else {
            [tableView deleteRowsAtIndexPaths:@[path]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    }];
}

- (BOOL)shouldDisplayAddRowWithIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row >= self.usersModel.count && self.usersView.editing;
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
    return self.usersModel.count + (self.usersView.editing ? 1 : 0);
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self shouldDisplayAddRowWithIndexPath:indexPath]) {
        return [tableView reusableCellWithClass:[ITAddRowCell class]];;
    }
    
    ITUserCell *cell = [tableView reusableCellWithClass:[ITUserCell class]];    
    cell.user = self.usersModel[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITUsers *users = self.usersModel;
    
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [users removeObjectAtIndex:indexPath.row];
            break;
            
        case UITableViewCellEditingStyleInsert:
            [users insertObject:[ITUser new] atIndex:users.count];
            break;
        
        default:
            break;
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)indexPath
          toIndexPath:(NSIndexPath *)newIndexPath
{

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL isInsert = [self shouldDisplayAddRowWithIndexPath:indexPath];
    
    return  isInsert ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark ITArrayModelObserver

- (void)arrayModel:(ITUsers *)model didUpdateWithModelChange:(ITModelChange *)modelChange {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongifyAndReturnIfNil(self);
        [self.usersView updateUsersViewWithModelChange:modelChange];
    });
}

- (void)modelDidLoad:(ITArrayModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [self.usersView.tableView reloadData];
}

@end
