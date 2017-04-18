//
//  ITDBImage.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 18.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ITDBUser;

@interface ITDBImage : NSManagedObject
@property (nonatomic, strong)   NSString        *path;
@property (nonatomic, strong)   ITDBUser        *user;

@end
