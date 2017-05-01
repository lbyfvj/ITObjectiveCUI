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

#import "ITJSONRepresentation+ITExtensions.h"

@interface ITFBContext ()
@property (nonatomic, strong)       FBSDKGraphRequestConnection   *graphRequestConnection;

@end

@implementation ITFBContext

#pragma mark -
#pragma mark Accessors

- (void)setGraphRequestConnection:(FBSDKGraphRequestConnection *)graphRequestConnection {
    if (_graphRequestConnection != graphRequestConnection) {
        [_graphRequestConnection cancel];
        _graphRequestConnection = graphRequestConnection;
    }
}


#pragma mark -
#pragma mark Public

- (void)resultHandler:(id)result {

}

- (NSString *)graphPath {
    return nil;
}

- (NSDictionary *)requestParameters {
    return nil;
}

- (FBSDKGraphRequest *)graphRequest {
    return [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                             parameters:self.requestParameters];
}

- (void)execute {
    ITModel *model = self.model;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        NSUInteger state = model.state;
        if (ITModelLoaded == state || ITModelLoading == state) {
            return;
        }
        
        model.state = ITModelLoading;
        

        ITWeakify(self);
        self.graphRequestConnection = [self.graphRequest startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id<ITJSONRepresentation> result, NSError *error) {
            ITStrongifyAndReturnIfNil(self);
            if (!error) {
                [self resultHandler:[result ITJSONRepresentation]];
            } else {
                [self failedLoadingData];
            }
        }];
    } else {
        model.state = ITModelFailedLoading;
    }
}

- (void)failedLoadingData {
    ITPrintDebugLog;
    ITModel *model = self.model;
    model.state = ITModelFailedLoading;
}

@end
