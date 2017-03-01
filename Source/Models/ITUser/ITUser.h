//
//  ITUser.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 23.02.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ITUser : NSObject
@property (nonatomic, strong)       NSString    *name;
@property (nonatomic, readonly)     UIImage     *userImage;

@end
