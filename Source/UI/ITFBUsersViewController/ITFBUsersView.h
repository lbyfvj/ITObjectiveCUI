//
//  ITFBUsersView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 04.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITView.h"

@interface ITFBUsersView : ITView <ITModelObserver>
@property (nonatomic, strong)               id<ITObservableObject>    model;
@property (nonatomic, strong)   IBOutlet    UITableView                    *tableView;

@end
