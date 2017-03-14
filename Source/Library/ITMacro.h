//
//  ITMacro.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCompilerMacro.h"

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
    @interface viewController (__##viewController##RootView) \
    ITRootViewProperty(propertyName, rootViewClass) \
    \
    @end \
    \
    @implementation viewController (__##viewController##RootView)\
    \
    @dynamic propertyName; \
    \
    ITRootViewGetterSynthesize(propertyName, rootViewClass); \
    \
@end

#define ITWeakify(variable) \
    __weak __typeof(variable) __ITWeakified_##variable = variable;


// you should only call this method after you called weakify for the same variable
#define ITStrongify(variable) \
    ITClangDiagnosticPushExpression("clang diagnostic ignored \"-Wshadow\""); \
    __strong __typeof(variable) variable = __ITWeakified_##variable; \
    ITClangDiagnosticPopExpression;

#define ITEmptyResult

#define ITStrongifyAndReturnIfNil(variable) \
    ITStrongifyAndReturnResultIfNil(variable, ITEmptyResult) \

#define ITStrongifyAndReturnNilIfNil(variable) \
    ITStrongifyAndReturnResultIfNil(variable, nil)

#define ITStrongifyAndReturnResultIfNil(variable, result) \
    ITStrongify(variable); \
        if (!variable) { \
            return result; \
        }

#define ITDispatchBlock(block, ...) \
    if (block) { \
        block (__VA_ARGS__); \
    }
