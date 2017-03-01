//
//  ITMacro.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 01.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

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
