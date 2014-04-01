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
