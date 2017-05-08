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
#import "ITFBUserFriendsContext.h"
#import "ITFBUserCell.h"
#import "UITableView+ITExtensions.h"
#import "UIViewController+ITExtensions.h"
#import "ITDispatchQueue.h"

#import "ITFBFriendViewController.h"

kITStaticConstWithValue(kITLogoutButtonTitle, @"Logout");

@interface ITFBUsersViewController ()
@property (nonatomic, strong)           ITFBUserFriendsContext          *userFriendsContext;
@property (nonatomic, strong)           ITArrayModel                    *friends;

- (IBAction)onLogOutButtonClicked:(id)sender;

@end

ITViewControllerSynthesizeRootView(ITFBUsersViewController, fbUsersView, ITFBUsersView)

@implementation ITFBUsersViewController

@dynamic friends;

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITDBUser *)user {
    ITPrintDebugLog;
    if (user != _user) {
        [_user removeObserverObject:self];
        
        _user = user;
        
        [_user addObserverObject:self];
        
        if (self.isViewLoaded) {
            self.fbUsersView.model = self.user;
        }
    }
}

- (void)setUserFriendsContext:(ITFBUserFriendsContext *)userFriendsContext {
    ITPrintDebugLog;
    if (userFriendsContext != _userFriendsContext) {
        [_userFriendsContext cancel];
        
        _userFriendsContext = userFriendsContext;
    }
}

- (ITArrayModel *)friends {
    return self.user.friends;
}

#pragma mark -
#pragma mark Private

- (IBAction)onLogOutButtonClicked:(id)sender; {
    [[FBSDKLoginManager new] logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)loadFriends {
    self.userFriendsContext = [ITFBUserFriendsContext contextWithModel:self.user];
    
    [self.userFriendsContext execute];
}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationItem *navigationItem = self.navigationItem;
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:kITLogoutButtonTitle
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(onLogOutButtonClicked:)];
    [navigationItem setLeftBarButtonItem:logoutButton animated:YES];

    self.fbUsersView.model = self.user;
    
    [self loadFriends];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.fbUsersView.model = self.user;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return self.friends.count;
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    ITFBUserCell *cell = [tableView reusableCellWithClass:[ITFBUserCell class]];
    ITDBUser *user = self.friends[indexPath.row];
    [cell fillWithUserModel:user];
    
    return cell;
}

- (void)            tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ITFBFriendViewController *controller = [ITFBFriendViewController viewController];
    controller.user = self.friends[indexPath.row];
    
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark ITDBObjectObserver

- (void)objectDidLoadFriends:(ITDBUser *)user {
    ITPrintDebugLog;
    ITAsyncPerformInMainQueue(^{
        [self.fbUsersView.tableView reloadData];
    });
}

@end
