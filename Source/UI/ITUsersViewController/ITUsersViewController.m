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
#import "ITArrayModel.h"
#import "ITModelChange.h"
#import "ITDispatchQueue.h"
#import "ITLoadingView.h"

static NSString * const kITAddRowTitle = @"Add new user";

ITViewControllerSynthesizeRootView(ITUsersViewController, usersView, ITUsersView)

@interface ITUsersViewController ()
@property (nonatomic, strong)   ITLoadingView  *loadingView;

@end

@implementation ITUsersViewController

#pragma mark -
#pragma mark - Initializations and Deallocations

- (void)dealloc {
    self.users = nil;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    self.loadingView = [ITLoadingView new];
    
    return self;
}

- (id)initWithNibName:(NSString *)nibName
               bundle:(NSBundle *)bundle
{
    self = [super initWithNibName:nibName bundle:bundle];
    
    self.loadingView = [ITLoadingView new];
    
    [self.usersView addSubview:self.loadingView];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(ITUsers *)users {
    if (_users != users) {
        [_users removeObserver:self];
        
        _users = users;
        
        [_users addObservers:@[self, self.loadingView]];
        
        if (self.isViewLoaded) {
            [self.users load];
        }
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
    
    UITableView *tableView = self.usersView.tableView;
    tableView.allowsSelectionDuringEditing = YES;
    
    [tableView reloadData];
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
    ITAddRowCell *addCell = [tableView reusableCellWithClass:[ITAddRowCell class]];
    
    if (indexPath.row >= [self.users count] && self.usersView.editing) {
        addCell.textLabel.text = kITAddRowTitle;
        
        return addCell;
    }
    
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (void)    tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITUsers *users = self.users;
    
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [users removeObjectAtIndex:indexPath.row];
            break;
            
        case UITableViewCellEditingStyleInsert:
            [users addObject:[ITUser new]];
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
    if (indexPath.row >= [self.users count]) {
       return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
}

#pragma mark -
#pragma mark ITArrayModelObserver

- (void)arrayModel:(ITArrayModel *)model didUpdateWithModelChange:(ITModelChange *)modelChange {
    [self.usersView updateUsersViewWithModelChange:modelChange];
}

- (void)arrayModelDidLoad:(ITArrayModel *)model {
    ITWeakify(self);
    ITAsyncPerformInMainQueue(^{
        ITStrongify(self);
        [self.usersView.tableView reloadData];
    });
}

@end
