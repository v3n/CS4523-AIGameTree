//
//  AISearchAlgorithms.m
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import "AISearchAlgorithms.h"

@implementation AISearchAlgorithms

+ (NSString *)returnActionFromNode:(NSDictionary *)node {
    if ([(NSString *)[node objectForKey:@"response"] length] > 0)
        return (NSString *)[node objectForKey:@"response"];
    else if ([[node objectForKey:@"children"] count] == 0)
        return nil;
    if ([[node objectForKey:@"children"] count] == 1)
        return [[[node objectForKey:@"children"] objectAtIndex:0] objectForKey:@"response"];
    
    NSInteger i = arc4random() % [[node objectForKey:@"children"] count];
    return [self returnActionFromNode:[[node objectForKey:@"children"] objectAtIndex:i]];
}

+ (NSString *)findAction:(NSString *)action byBreadthFirstFromNodes:(NSMutableArray *)nodes {
    NSMutableArray *newNodes = [[NSMutableArray alloc] init];
    if([nodes count] == 0) return nil;
    
    for (NSDictionary *n in nodes) {
        if([[n objectForKey:@"behavior"] isEqualToString:action])
            return [self returnActionFromNode:n];
        [newNodes addObjectsFromArray:[n objectForKey:@"children"]];
    }
    
    return [self findAction:action byBreadthFirstFromNodes:newNodes];
}

+ (NSString *)findAction:(NSString *)action byBreadthFirstFromNode:(NSDictionary *)node {
    return [self findAction:action byBreadthFirstFromNodes:[node objectForKey:@"children"]];
}

+ (NSString *)findAction:(NSString *)action byDepthFirstFromNode:(NSDictionary *)node {
    NSLog(@"%@ : %@", action, [node objectForKey:@"behavior"]);
    if ([[node objectForKey:@"behavior"] isEqualToString:action])
        return [self returnActionFromNode:node];
    for (NSDictionary *n in [node objectForKey:@"children"]) {
        NSString *s = [self findAction:action byDepthFirstFromNode:n];
        if(s != nil) return s;
    }
    return nil;
}

@end
