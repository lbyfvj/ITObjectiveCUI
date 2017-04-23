//
//  ITDBImage.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITDBObject.h"
#import "ITImageModel.h"

@interface ITDBImage : ITDBObject
@property (nonatomic, strong)   NSURL               *url;
@property (nonatomic, strong)   ITImageModel        *imageModel;

@end
