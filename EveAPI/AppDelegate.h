//
//  AppDelegate.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MasterViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) IBOutlet MasterViewController *masterViewController;

@end
