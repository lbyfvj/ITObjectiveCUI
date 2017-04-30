//
//  ITArrayModel+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITArrayModel.h"

#import "ITModelChange.h"
#import "ITModelChange+UITableView.h"

@interface ITArrayModel (ITExtensions)

- (void)updateModelWithModelChange:(ITModelChange *)modelChange;

@end
