//
//  ITFBUserInteraction.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ITDBUser.h"

@interface ITFBUserInteraction : NSObject

+ (ITDBUser *)userWithId:(NSString *)userID parseObjectInteraction:(NSDictionary *)object;

- (ITDBUser *)userWithId:(NSString *)userID;

@end
