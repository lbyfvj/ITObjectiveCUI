//
//  ITUserView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITUser.h"

@interface ITUserView : UIView
@property (nonatomic, strong)   ITUser    *user;

@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;

@end
