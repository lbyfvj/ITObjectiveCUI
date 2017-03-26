//
//  NSFileManager+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 25.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSFileManager+ITExtensions.h"

@implementation NSFileManager (ITExtensions)

+ (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory
                                                   inDomains:NSUserDomainMask] lastObject];
}

@end
