//
//  ITOneIndexModel+ITIndexPath.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel.h"

@interface ITOneIndexModel (ITIndexPath)
@property (nonatomic, readonly) NSIndexPath *indexPath;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath;

@end
