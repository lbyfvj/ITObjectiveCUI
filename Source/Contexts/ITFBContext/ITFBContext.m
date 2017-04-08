//
//  ITFBContext.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 02.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFBContext.h"

#import "ITModel.h"
#import "ITMacro.h"
#import "ITUser.h"
#import "ITUsers.h"

@interface ITFBContext ()
@property (nonatomic, strong)       FBSDKGraphRequestConnection   *graphRequestConnection;

@end

@implementation ITFBContext

#pragma mark -
#pragma mark Accessors


#pragma mark -
#pragma mark Public

- (void)resultHandler:(id)result {

}

- (NSString *)graphPath {
    return nil;
}

- (void)execute {
    ITModel *model = self.model;
    
    NSDictionary *requestParameters = @{@"fields":[NSString stringWithFormat:@"%@, %@, %@, %@",
                                                   @"id",
                                                   @"first_name",
                                                   @"last_name",
                                                   @"picture.type(large)"]};
    
    if ([FBSDKAccessToken currentAccessToken]) {
        model.state = ITModelLoading;
        FBSDKGraphRequest *graphRequest = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                                                            parameters:requestParameters];
        ITWeakify(self);
        self.graphRequestConnection = [graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            ITStrongifyAndReturnIfNil(self);
            if (!error) {
                [self resultHandler:result];
            } else {
                model.state = ITModelFailedLoading;
            }
        }];
    } else {
        model.state = ITModelFailedLoading;
    }
}

- (void)cancel {
    [self.graphRequestConnection cancel];
}
@end
