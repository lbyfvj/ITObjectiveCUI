//
//  UINib+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "UINib+ITExtensions.h"

@implementation UINib (ITExtensions)

+ (UINib *)nibWithClass:(Class)class {
    return [self nibWithClass:class bundle:nil];
}

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:NSStringFromClass(class) bundle:bundle];
}

+ (id)objectWithClass:(Class)class {
    return [self objectWithClass:class bundle:nil];
}

+ (id)objectWithClass:(Class)class bundle:(NSBundle *)bundle {
    NSArray *objects = [[self nibWithClass:class bundle:bundle] instantiateWithOwner:nil options:nil];
    
    for (id object in objects) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

@end
