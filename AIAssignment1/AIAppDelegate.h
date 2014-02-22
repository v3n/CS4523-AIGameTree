//
//  AIAppDelegate.h
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AIAppDelegate : NSObject <NSApplicationDelegate, NSControlTextEditingDelegate>

@property (retain) NSDictionary *dict;
@property (weak) IBOutlet NSTextFieldCell *actionField;
@property (weak) IBOutlet NSTextFieldCell *resultField;
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButtonCell *depthButton;
@property (weak) IBOutlet NSButtonCell *breadthButton;

- (void)textDidEndEditing:(NSNotification *)aNotification;

@end
