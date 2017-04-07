//
//  ITTwoIndexModel+UITableView.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTwoIndexModel+UITableView.h"

@implementation ITTwoIndexModel (UITableView)

@dynamic indexPath;
@dynamic toIndexPath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                    toIndexPath:(NSIndexPath *)toIndexPath
{
    return [self modelWithIndex:indexPath.row
                     toIndex:toIndexPath.row];
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)sourceIndexPath {
    return [NSIndexPath indexPathForRow:self.index inSection:0];
}

- (NSIndexPath *)destinationIndexPath {
    return [NSIndexPath indexPathForRow:self.toIndex inSection:0];
}

@end
