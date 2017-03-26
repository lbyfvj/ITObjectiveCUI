//
//  ITInsertChange+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITInsertChange+ITExtensions.h"

@implementation ITInsertChange (ITExtensions)

- (void)changeTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

@end
