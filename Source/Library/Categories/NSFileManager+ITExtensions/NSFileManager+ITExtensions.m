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

+ (NSURL *)documentsDirectory {
    NSURL *directoryPath = [NSFileManager directoryPathWithType:NSDocumentDirectory];
    
    ITSharedInstance(directoryPath);
}

+ (NSURL *)libraryDirectory {
    NSURL *directoryPath = [NSFileManager directoryPathWithType:NSLibraryDirectory];
    
    ITSharedInstance(directoryPath);
}

+ (NSURL *)applicationDirectory {
    NSURL *directoryPath = [NSFileManager directoryPathWithType:NSApplicationDirectory];
    
    ITSharedInstance(directoryPath);
}

@end
