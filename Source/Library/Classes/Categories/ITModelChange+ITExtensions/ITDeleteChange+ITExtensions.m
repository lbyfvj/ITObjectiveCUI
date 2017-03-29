//
//  ITDeleteChange+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDeleteChange+ITExtensions.h"

@implementation ITDeleteChange (ITExtensions)

- (void)changeTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

@end
