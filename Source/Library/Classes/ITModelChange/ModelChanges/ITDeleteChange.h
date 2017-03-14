//
//  ITDeleteChange.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 14.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel.h"

@interface ITDeleteChange : ITOneIndexModel

- (void)changeTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation;

@end
