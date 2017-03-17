//
//  ITUser.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ITImageModel.h"

@interface ITUser : NSObject <NSCoding>
@property (nonatomic, strong)       NSString        *name;
@property (nonatomic, readonly)     ITImageModel    *image;
@property (nonatomic, copy)         NSURL           *imageURL;

@end
