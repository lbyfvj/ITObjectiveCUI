//
//  ITFileSystemImageModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITImageModel.h"

@interface ITFileSystemImageModel : ITImageModel
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;
@property (nonatomic, readonly)                     NSString    *filePath;

@end
