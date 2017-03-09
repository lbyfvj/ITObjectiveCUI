//
//  ITImageView.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 03.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITImageModel.h"

@interface ITImageView : UIView
@property (nonatomic, strong)       IBOutlet ITImageModel    *imageModel;
@property (nonatomic, strong)       UIImageView              *contentImageView;

- (void)fillWithModel:(ITImageModel *)imageModel;

@end
