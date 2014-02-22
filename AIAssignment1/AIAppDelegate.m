//
//  AIAppDelegate.m
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import "AIAppDelegate.h"
#import "AIXMLParser.h"
#import "AISearchAlgorithms.h"

@implementation AIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    NSDictionary *dict = [AIXMLParser parseXMLTreeFromString:@"<root><node behavior=\"Idle\" response=\"\"> \
     <node behavior=\"\" response=\"Use Computer\"/> <node behavior=\"\" response=\"Patrol\"/> \
     </node> \
     <node behavior=\"Incoming Projectile\"> \
     <node behavior=\"\" response=\"Evade\"/> \
     </node> \
     <node behavior=\"Combat\" response=\"\"> \
     <node behavior=\"Melee\" response=\"\"> \
     <node behavior=\"\" response=\"Flee\"/> \
     <node behavior=\"\" response=\"Attack\"/> \
     </node> \
     <node behavior=\"Ranged\" response=\"\"> \
     <node behavior=\"\" response=\"Weapon 1\"/> \
     <node behavior=\"\" response=\"Weapon 2\"/> \
     <node behavior=\"\" response=\"Weapon 3\"/> \
     </node> \
     </node> \
     </root> \
     "];
    [dict attributeKeys];
    
    NSLog(@"%@", [AISearchAlgorithms findAction:@"Combat" byDepthFirstFromNode:dict]);
     NSLog(@"%@", [AISearchAlgorithms findAction:@"Ranged" byBreadthFirstFromNode:dict]);
    
}

@end
