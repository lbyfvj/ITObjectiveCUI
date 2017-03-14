//
//  UINib+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (ITExtensions)

+ (UINib *)nibWithClass:(Class)class;

+ (UINib *)nibWithClass:(Class)class bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)class;

+ (id)objectWithClass:(Class)class bundle:(NSBundle *)bundle;

@end
