//
//  NSFileManager+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 25.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ITExtensions)

+ (NSURL *)documentsDirectoryURL;

+ (NSURL *)libraryDirectoryURL;

+ (NSURL *)applicationDirectoryURL;

+ (NSURL *)cacheDirectoryURL;

@end
