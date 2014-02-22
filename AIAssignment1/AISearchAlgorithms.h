//
//  AISearchAlgorithms.h
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AISearchAlgorithms : NSObject

+ (NSString *)findAction:(NSString *)action byBreadthFirstFromNode:(NSDictionary *)node;
    
+ (NSString *)findAction:(NSString *)action byDepthFirstFromNode:(NSDictionary *)node;
    
@end
