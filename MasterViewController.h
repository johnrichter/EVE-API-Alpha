//
//  MasterViewController.h
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MasterViewController : NSViewController <NSURLConnectionDelegate>


@property (strong) IBOutlet NSTextView *xmlTextView;
@property (strong) NSURLConnection *urlConnection;
@property (strong) NSMutableData *receivedData;

@end
