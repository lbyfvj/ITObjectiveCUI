//
//  ITModelChange+ITArrayModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 30.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange.h"

#import "ITArrayModel.h"

@interface ITModelChange (ITArrayModel)

- (void)applyToModel:(ITArrayModel *)model;

@end
