//
//  ITDeleteChange+ITChangeTypesExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 28.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITChangeTypes+ITModelChangeExtensions.h"

#import "ITOneIndexModel+UITableView.h"
#import "ITTwoIndexModel+UITableView.h"

@implementation ITDeleteChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:animation];
}

@end

@implementation ITInsertChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView insertRowsAtIndexPaths:@[self.indexPath] withRowAnimation:animation];
}

@end

@implementation ITMoveChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView moveRowAtIndexPath:self.indexPath toIndexPath:self.toIndexPath];
}

@end
