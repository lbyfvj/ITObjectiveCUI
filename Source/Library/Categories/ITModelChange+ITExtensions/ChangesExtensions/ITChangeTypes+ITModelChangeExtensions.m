//
//  ITDeleteChange+ITChangeTypesExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 28.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITChangeTypes+ITModelChangeExtensions.h"

@implementation ITDeleteChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

@end

@implementation ITInsertChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

@end

@implementation ITMoveChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    NSIndexPath *toIndexPath = [NSIndexPath indexPathForItem:self.toIndex inSection:0];
    [tableView moveRowAtIndexPath:indexPath toIndexPath:toIndexPath];
}

@end
