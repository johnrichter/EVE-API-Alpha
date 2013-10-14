//
//  AppDelegate.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
//    // Create our master view controller from the nib file
//    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
//    
//    // Add the MasterViewController to the windows content view
//    [self.window.contentView addSubview:self.mainViewController.view];
//    self.mainViewController.view.frame = ((NSView *)self.window.contentView).bounds;
   
   self.windowController =
   [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
   
   [self.windowController showWindow:nil];
   [self.windowController.window makeKeyAndOrderFront:nil];
}

@end
