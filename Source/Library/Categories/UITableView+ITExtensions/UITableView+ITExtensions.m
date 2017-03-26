//
//  UITableView+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UITableView+ITExtensions.h"

#import "UINib+ITExtensions.h"

#import "ITMacro.h"

@implementation UITableView (ITExtensions)

- (id)dequeueReusableCellWithClass:(Class)cls {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
}

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithClass:cls];
    
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateTableViewWithBlock:(ITTableViewUpdateBlock)block {
    [self beginUpdates];
    ITDispatchBlock(block);    
    [self endUpdates];
}

@end
