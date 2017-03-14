//
//  UITableView+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UITableView+ITExtensions.h"

#import "UINib+ITExtensions.h"

#import "ITInsertChange.h"
#import "ITDeleteChange.h"
#import "ITMoveChange.h"

@implementation UITableView (ITExtensions)

- (id)dequeueReusableCellWithClass:(Class)class {   
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
}

- (id)reusableCellWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithClass:class];
    
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateTableViewWithModelChange:(ITModelChange *)modelChange {
    [self beginUpdates];
    
    [modelChange changeTableView:self withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self endUpdates];
    
}

@end
