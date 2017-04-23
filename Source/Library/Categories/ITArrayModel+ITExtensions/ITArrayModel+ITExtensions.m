//
//  ITArrayModel+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITArrayModel+ITExtensions.h"

@implementation ITArrayModel (ITExtensions)

- (void)updateModelWithModelChange:(ITModelChange *)modelChange {
    [modelChange applyToModel:self];
}

@end
