//
//  AIXMLParser.h
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIXMLParser : NSObject

+(NSDictionary *)parseXMLTreeFromString:(NSString *)string;

@end
