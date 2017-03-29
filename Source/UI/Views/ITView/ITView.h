//
//  ITView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITModel.h"
#import "ITLoadingView.h"

@interface ITView : UIView
@property (nonatomic, strong)                               ITLoadingView       *loadingView;
@property (nonatomic, assign, getter=isLoadingViewVisible)  BOOL                loadingViewVisible;

@end
