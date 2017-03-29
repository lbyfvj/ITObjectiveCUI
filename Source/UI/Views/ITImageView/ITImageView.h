//
//  ITImageView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITImageModel.h"

#import "ITView.h"

@interface ITImageView : ITView <ITModelObserver>
@property (nonatomic, strong)       ITImageModel            *imageModel;
@property (nonatomic, strong)       IBOutlet UIImageView    *contentImageView;

@end
