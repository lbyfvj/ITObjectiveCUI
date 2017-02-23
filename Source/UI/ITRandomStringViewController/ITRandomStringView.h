//
//  ITRandomStringView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITRandomString.h"

@interface ITRandomStringView : UIView
@property (nonatomic, strong)   ITRandomString    *randomString;

@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;

@end
