//
//  ITOneIndexModel+ITIndexPath.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel+ITIndexPath.h"

@implementation ITOneIndexModel (ITIndexPath)

@dynamic indexPath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath {
    return [self modelWithIndex:indexPath.row];
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index inSection:0];
}
@end
