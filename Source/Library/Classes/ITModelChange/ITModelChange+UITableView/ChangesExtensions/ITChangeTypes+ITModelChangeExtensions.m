//
//  ITDeleteChange+ITChangeTypesExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 28.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITChangeTypes+ITModelChangeExtensions.h"

#import "UITableView+ITExtensions.h"
#import "ITOneIndexModel+UITableView.h"
#import "ITTwoIndexModel+UITableView.h"

#import "ITArrayModel.h"

@implementation ITDeleteChange (UITableView)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView updateWithBlock:^{
        [tableView deleteRowsAtIndexPaths:@[self.indexPath] withRowAnimation:animation];
    }];
}

@end

@implementation ITInsertChange (UITableView)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView updateWithBlock:^{
        [tableView insertRowsAtIndexPaths:@[self.indexPath] withRowAnimation:animation];
    }];
}

@end

@implementation ITMoveChange (UITableView)

- (void)applyToTableView:(UITableView *)tableView
      withRowAnimation:(UITableViewRowAnimation) animation
{
    [tableView updateWithBlock:^{
        [tableView moveRowAtIndexPath:self.indexPath toIndexPath:self.toIndexPath];
    }];
}

@end
