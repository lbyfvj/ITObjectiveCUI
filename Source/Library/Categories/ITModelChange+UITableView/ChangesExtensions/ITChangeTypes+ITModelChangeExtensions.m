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

- (void)applyToModel:(ITArrayModel *)model {
    for (id object in model.objects) {
        NSArray *objects = self.model.objects;
        if ([objects containsObject:object]) {
            [model removeObject:object];
        }
    }
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

- (void)applyToModel:(ITArrayModel *)model {
    NSUInteger index = self.index;
    [model insertObject:self.model[index] atIndex:index];
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

- (void)applyToModel:(ITArrayModel *)model {
    NSUInteger index = self.index;
    NSUInteger toIndex = self.toIndex;
    
    [model moveObjectAtIndex:index toIndex:toIndex];
}

@end
