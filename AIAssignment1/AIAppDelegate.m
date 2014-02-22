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
        
    // Create the File Open Dialog class.
    
     self.dict = [AIXMLParser parseXMLTreeFromString:@"<root><node behavior=\"Idle\" response=\"\"> \
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
//    [self.dict attributeKeys];
    
    NSLog(@"%@", [AISearchAlgorithms findAction:@"Combat" byDepthFirstFromNode:self.dict]);
    NSLog(@"%@", [AISearchAlgorithms findAction:@"Ranged" byBreadthFirstFromNode:self.dict]);
    
    NSOpenPanel* openDlg = [NSOpenPanel openPanel];

    
    // This method displays the panel and returns immediately.
    // The completion handler is called when the user selects an
    // item or cancels the panel.
    [openDlg beginWithCompletionHandler:^(NSInteger result){
        if (result == NSFileHandlingPanelOKButton) {
            NSURL*  theDoc = [[openDlg URLs] objectAtIndex:0];
            // Open  the document.
            self.dict = [AIXMLParser parseXMLTreeFromString:[NSString stringWithContentsOfURL:theDoc]];
        }
        
    }];

}

- (void)controlTextDidEndEditing:(NSNotification *)aNotification {
    NSString *str = self.actionField.title;
    NSString *result;
    
    if([str isEqualToString:@""]) return;
    
    if([self.depthButton state] == NSOnState)
        result = [AISearchAlgorithms findAction:str byDepthFirstFromNode:self.dict];
    else if([self.breadthButton state] == NSOnState)
        result = [AISearchAlgorithms findAction:str byBreadthFirstFromNode:self.dict];

    if (result != nil)
        self.resultField.title = result;
    else
        self.resultField.title = @"";
}



@end
