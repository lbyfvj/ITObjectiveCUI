//
//  ITModelChange+UITableView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"

#import "ITArrayModel.h"

@interface ITModelChange (UITableView)

- (void)applyToTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation)animation;

- (void)applyToModel:(ITArrayModel *)model;

@end
