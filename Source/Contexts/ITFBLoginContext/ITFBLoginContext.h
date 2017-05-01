//
//  ITFBLoginContext.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBContext.h"

#import "ITDBUser.h"

@interface ITFBLoginContext : ITFBContext

+ (ITDBUser *)user;

@end
