//
//  UITableView+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITModelChange.h"

@interface UITableView (ITExtensions)

- (id)dequeueReusableCellWithClass:(Class)class;

- (id)reusableCellWithClass:(Class)class;

- (void)updateTableViewWithModelChange:(ITModelChange *)change;

@end
