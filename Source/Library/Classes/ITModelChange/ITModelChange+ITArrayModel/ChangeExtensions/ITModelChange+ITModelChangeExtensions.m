//
//  ITModelChange+ITModelChangeExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 30.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITModelChange+ITModelChangeExtensions.h"

#import "ITArrayModel.h"

@implementation ITDeleteChange (ITArrayModel)

- (void)applyToModel:(ITArrayModel *)model {
    for (id object in model.objects) {
        NSArray *objects = self.model.objects;
        if ([objects containsObject:object]) {
            [model removeObject:object];
        }
    }
}

@end

@implementation ITInsertChange (ITArrayModel)

- (void)applyToModel:(ITArrayModel *)model {
    NSUInteger index = self.index;
    [model insertObject:self.model[index] atIndex:index];
}

@end

@implementation ITMoveChange (ITArrayModel)

- (void)applyToModel:(ITArrayModel *)model {
    NSUInteger index = self.index;
    NSUInteger toIndex = self.toIndex;
    
    [model moveObjectAtIndex:index toIndex:toIndex];
}

@end
