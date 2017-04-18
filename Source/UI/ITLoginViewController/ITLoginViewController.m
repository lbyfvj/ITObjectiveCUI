//
//  ITLoginViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITLoginViewController.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ITFBLoginContext.h"
#import "ITFBUsersViewController.h"
#import "ITDispatchQueue.h"

#import "ActiveRecordKit.h"

@interface ITLoginViewController ()
@property (nonatomic, strong)   ITFBLoginContext   *loginContext;

- (void)pushViewControllerWithUser:(ITDBUser *)user withAnimation:(BOOL)animation;

@end

@implementation ITLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [IDPCoreDataManager sharedManagerWithMomName:@"ITObjCUI"];
        self.user = [ITDBUser managedObject];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

//- (void)setUser:(ITDBUser *)user {
//    if (_user != user) {
//        [_user removeObserver:self];
//        
//        _user = user;
//        
//        [_user addObserver:self];
//    }
//}

#pragma mark -
#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ITDBUser *user = [ITFBLoginContext user];
    
    if (user) {
        [self pushViewControllerWithUser:user withAnimation:NO];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark -
#pragma mark Private

- (void)pushViewControllerWithUser:(ITUser *)user withAnimation:(BOOL)animation {
    ITFBUsersViewController *controller = [ITFBUsersViewController new];
    controller.user = user;
    
    [self.navigationController pushViewController:controller animated:animation];
}

#pragma mark -
#pragma mark Public

- (IBAction)onLoginButtonClicked:(id)sender {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITDBUser *user  = [ITDBUser new];
    ITFBLoginContext *loginContext = [[ITFBLoginContext alloc] initWithUser:user];
    
    self.user = user;
    self.loginContext = loginContext;
    
    [loginContext execute];
}

#pragma mark -
#pragma mark ITObservableObjectMixin

- (void)objectDidLoadID:(ITDBUser *)user {
    NSLog(@"%@ - %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    ITAsyncPerformInMainQueue(^{
        [self pushViewControllerWithUser:user withAnimation:YES];
    });
}

@end
