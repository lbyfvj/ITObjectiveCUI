//
//  ITMacro.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITCompilerMacro.h"

#define ITBaseViewProperty(propertyName, viewClass)\
@property (nonatomic, readonly) viewClass *propertyName;

#define ITBaseViewGetterSynthesize(selector, viewClass)\
- (viewClass *)selector { \
if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
return (viewClass *)self.view; \
} \
\
return nil; \
}

#define ITBaseViewController(baseViewController, propertyName, baseViewClass) \
@interface baseViewController () \
ITBaseViewProperty(propertyName, baseViewClass) \
\
@end \
\
@implementation baseViewController \
\
@dynamic propertyName; \
\
ITBaseViewGetterSynthesize(propertyName, baseViewClass); \
\

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

