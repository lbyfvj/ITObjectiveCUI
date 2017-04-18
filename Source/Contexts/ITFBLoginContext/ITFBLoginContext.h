//
//  ITFBLoginContext.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITContext.h"

#import "ITDBUser.h"

@interface ITFBLoginContext : ITContext

+ (ITDBUser *)user;

- (instancetype)initWithUser:(ITDBUser *)user;

@end
