//
//  MasterViewController.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/13/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Initialization code here.
    }
    
    return self;
}

-(void)loadView
{
    [super loadView];
    
    [self.xmlTextView setString:@"Hello World!"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.eveonline.com/account/APIKeyInfo.xml.aspx?keyID=1927220&vCode=JVolmWFGtr6wMewZywlpRje3XmRSiI6xKQ6TbOELHEUH7j8vymuim3D62UKOlB6Y"]];
    
    self.urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    if (self.urlConnection)
    {
        self.receivedData = [NSMutableData data];
        NSLog(@"Successfully created NSURLConnection");
    }
    else
    {
        NSLog(@"Failed to create a URLConneciton");
    }
}

- (BOOL)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    [self.receivedData setLength:0];
    return YES;
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    [self.receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // We should release the connection and data object, but with ARC we do not have to
    NSLog(@"Conneciton failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Succeeded: Received %ld bytes of data", (unsigned long)[self.receivedData length]);
    
    NSString *receivedDataString = [[NSString alloc] initWithBytes:self.receivedData.mutableBytes length:[self.receivedData length] encoding:NSUTF8StringEncoding];
    
    NSLog(@"Received data string: %@", receivedDataString);
    
    [self.xmlTextView setString:receivedDataString];
}

@end
