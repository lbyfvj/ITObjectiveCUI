//
//  ITURLImageModel.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITFileSystemImageModel.h"

@interface ITURLImageModel : ITFileSystemImageModel
@property (nonatomic, readonly)                     NSURL       *fileURL;
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

@end
