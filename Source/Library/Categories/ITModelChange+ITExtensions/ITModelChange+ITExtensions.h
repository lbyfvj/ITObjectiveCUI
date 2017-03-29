//
//  ITModelChange+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"

@interface ITModelChange (ITExtensions)

- (void)applyToTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation)animation;

@end
