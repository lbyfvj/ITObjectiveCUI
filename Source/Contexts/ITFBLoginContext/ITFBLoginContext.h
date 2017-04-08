//
//  ITFBLoginContext.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITContext.h"

#import "ITUser.h"

@interface ITFBLoginContext : ITContext

- (instancetype)initWithUser:(ITUser *)user;

@end
