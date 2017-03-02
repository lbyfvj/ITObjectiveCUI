//
//  ITUserViewController.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITUserViewController.h"

#import "ITUserView.h"

#import "ITUserCell.h"

#import "ITMacro.h"

#import "UINib+ITExtensions.h"

ITBaseViewController(ITUserViewController, userView, ITUserView)

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ITUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    self.userView.user = user;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}

- (UITableViewCell *)   tableView:(UITableView *)tableView
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellClass = NSStringFromClass([ITUserCell class]);
    
    ITUserCell *cell = [tableView dequeueReusableCellWithIdentifier:cellClass];
    
    if (!cell) {
//        UINib *nib = [UINib nibWithNibName:cellClass bundle:nil];
//        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
//        cell = [cells firstObject];
        
        cell = [UINib objectWithClass:[ITUserCell class]];
    }
    
    cell.user = self.user;
    
    return cell;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.userView.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
