//
//  NSFileManager+ITExtensions.m
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 25.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "NSFileManager+ITExtensions.h"

#import "ITMacro.h"

@implementation NSFileManager (ITExtensions)

+ (NSURL *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [[[NSFileManager defaultManager] URLsForDirectory:type
                                                   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)documentsDirectoryURL {
    NSURL *directoryPath = [self directoryPathWithType:NSDocumentDirectory];
    
    ITReturnSharedInstance(directoryPath);
}

+ (NSURL *)libraryDirectoryURL {
    NSURL *directoryPath = [self directoryPathWithType:NSLibraryDirectory];
    
    ITReturnSharedInstance(directoryPath);
}

+ (NSURL *)applicationDirectoryURL {
    NSURL *directoryPath = [self directoryPathWithType:NSApplicationDirectory];
    
    ITReturnSharedInstance(directoryPath);
}

+ (NSURL *)cacheDirectoryURL {
    NSURL *directoryPath = [self directoryPathWithType:NSCachesDirectory];
    
    ITReturnSharedInstance(directoryPath);
}

@end
