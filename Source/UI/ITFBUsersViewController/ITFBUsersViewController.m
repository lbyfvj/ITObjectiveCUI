//
//  ITFBUsersViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBUsersViewController.h"

#import "ITFBUsersView.h"
#import "ITMacro.h"
#import "ITFBUsersContext.h"
#import "ITFBUserCell.h"
#import "UITableView+ITExtensions.h"
#import "UIViewController+ITExtensions.h"

#import "ITFBFriendViewController.h"

@interface ITFBUsersViewController ()
@property (nonatomic, strong)           ITFBUsersContext        *usersContext;
@property (nonatomic, strong)           ITArrayModel            *users;

- (IBAction)onLogOutButtonClicked:(id)sender;

@end

ITViewControllerSynthesizeRootView(ITFBUsersViewController, fbUsersView, ITFBUsersView)

@implementation ITFBUsersViewController

@dynamic users;

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (user != _user) {
        [_user.friends removeObserver:self];
        
        _user = user;
        
        [_user.friends addObserver:self];
        
        self.usersContext = [ITFBUsersContext new];
    }
}

- (void)setUsersContext:(ITFBUsersContext *)usersContext {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (usersContext != _usersContext) {
        [_usersContext cancel];
        
        _usersContext = usersContext;
        
        _usersContext.model = self.users;
        
        [_usersContext execute];
    }
}

- (ITArrayModel *)users {
    return self.user.friends;
}

#pragma mark -
#pragma mark Private

- (IBAction)onLogOutButtonClicked:(id)sender; {
    [[FBSDKLoginManager new] logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationItem *navigationItem = self.navigationItem;
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(onLogOutButtonClicked:)];
    [navigationItem setRightBarButtonItem:logoutButton animated:YES];

    self.fbUsersView.model = self.users;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    ITFBUserCell *cell = [tableView reusableCellWithClass:[ITFBUserCell class]];
    ITUser *user = self.users[indexPath.row];
    [cell fillWithUserModel:user];
    
    return cell;
}

- (void)            tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITFBFriendViewController *controller = [ITFBFriendViewController new];
    controller.user = self.users[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark ITArrayModelObserver

- (void)modelDidLoad:(ITArrayModel *)model {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [self.fbUsersView.tableView reloadData];
}

@end
