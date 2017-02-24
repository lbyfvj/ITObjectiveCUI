//
//  ITRandomDataView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITRandomData.h"

@interface ITRandomDataView : UIView
@property (nonatomic, strong)   ITRandomData    *randomData;

@property (nonatomic, strong)   IBOutlet    UITableView     *tableView;

@end
