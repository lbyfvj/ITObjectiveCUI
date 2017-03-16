//
//  ITUsers.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITArrayModel.h"

@class ITUser;

@interface ITUsers : ITArrayModel

+ (instancetype)sharedUsers;

- (void)save;

@end
