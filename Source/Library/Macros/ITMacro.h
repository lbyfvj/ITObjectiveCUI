//
//  ITMacro.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITBlockVariablesMacro.h"

#define ITRootViewProperty(propertyName, viewClass)\
    @property (nonatomic, readonly) viewClass *propertyName;

#define ITRootViewGetterSynthesize(selector, viewClass)\
    - (viewClass *)selector { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define ITViewControllerSynthesizeRootView(viewController, propertyName, rootViewClass) \
    @interface viewController (__##viewController##rootViewClass##propertyName) \
    ITRootViewProperty(propertyName, rootViewClass) \
    \
    @end \
    \
    @implementation viewController (__##viewController##rootViewClass##propertyName)\
    \
    @dynamic propertyName; \
    \
    ITRootViewGetterSynthesize(propertyName, rootViewClass); \
    \
@end

#define ITDispatchBlock(block, ...) \
    if (block) { \
        block (__VA_ARGS__); \
    }
