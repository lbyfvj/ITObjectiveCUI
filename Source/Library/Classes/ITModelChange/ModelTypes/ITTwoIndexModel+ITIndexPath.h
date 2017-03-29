//
//  ITTwoIndexModel+ITIndexPath.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 29.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITTwoIndexModel.h"

@interface ITTwoIndexModel (ITIndexPath)
@property (nonatomic, readonly) NSIndexPath *indexPath;
@property (nonatomic, readonly) NSIndexPath *toIndexPath;

+ (instancetype)modelWithIndexPath:(NSIndexPath *)indexPath
                    toIndexPath:(NSIndexPath *)toIndexPath;
@end
