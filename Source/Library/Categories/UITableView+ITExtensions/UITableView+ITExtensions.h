//
//  UITableView+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ITTableViewUpdateBlock)(void);

@interface UITableView (ITExtensions)

- (id)dequeueReusableCellWithClass:(Class)cls;

- (id)reusableCellWithClass:(Class)cls;

- (void)updateWithBlock:(ITTableViewUpdateBlock)block;

@end
