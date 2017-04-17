//
//  ITFBContext.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITContext.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ITFBContext : ITContext

- (void)resultHandler:(id)result;

- (NSString *)graphPath;
- (NSDictionary *)requestParameters;
- (FBSDKGraphRequest *)graphRequest;

@end
