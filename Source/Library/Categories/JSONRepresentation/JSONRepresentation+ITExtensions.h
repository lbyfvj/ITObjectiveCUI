//
//  JSONRepresentation+ITExtensions.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 24.04.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSONRepresentation <NSObject>

- (instancetype)JSONRepresentation;

@end

@interface NSDictionary (ITExtensions)<JSONRepresentation>

@end

@interface NSArray (JSONRepresentation)

@end

@interface NSMutableArray (JSONRepresentation)

@end

@interface NSArray (ITExtensions)<JSONRepresentation>

@end

@interface NSNumber (ITExtensions)<JSONRepresentation>

@end

@interface NSNull (ITExtensions)<JSONRepresentation>

@end

@interface NSString (ITExtensions)<JSONRepresentation>

@end
