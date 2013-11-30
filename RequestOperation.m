//
//  RequestOperation.m
//  EveAPI
//
//  Created by Johnathan Richter on 7/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "RequestOperation.h"

#import "XMLFactory.h"
#import "ObjectBlueprint.h"
#import "ObjectBuilder.h"

@implementation RequestOperation

-(RequestOperation *)init
{
   self = [super init];
   if (self)
   {
      self.objectBlueprints = [[NSMutableArray alloc] init];
      self.urlRequest = [[NSURLRequest alloc] init];
      self.aDelegate = nil;
   }
   
   return self;
}

-(RequestOperation *)initWithDelegate:(id<RequestOperationDelegate>)delegate
{
   self = [super init];
   if (self)
   {
      self.objectBlueprints = [[NSMutableArray alloc] init];
      self.urlRequest = [[NSURLRequest alloc] init];
      self.aDelegate = delegate;
   }
   
   return self;
}

-(void)setUrl:(NSString *)url WithArguements:(NSDictionary *)arguements
   Blueprints:(NSArray *)blueprints
{
   // Store the bluprint objects
   self.objectBlueprints = [NSMutableArray arrayWithArray:blueprints];
   NSMutableString *urlWithArguements = [NSMutableString stringWithString:url];
   
   if ([arguements count] != 0)
   {
      NSUInteger index = 0;
      [urlWithArguements appendString:@"?"];
      for (NSString *arguement in arguements)
      {
         index++;
         
         [urlWithArguements appendString:arguement];
         [urlWithArguements appendString:@"="];
         [urlWithArguements appendString:arguements[arguement]];
         
         if (index != [arguements count])
         {
            [urlWithArguements appendString:@"&"];
         }
      }
   }
   
   // Create and save the URLRequest
   self.urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:urlWithArguements]];
}

- (void)buildObjects
{
   // Create an object builder to handle all of our object creation.
   ObjectBuilder *builder = [[ObjectBuilder alloc] initWithXmlMap:self.xmlMap
                                                    AndBlueprints:self.objectBlueprints];
   // Create an NSError to report any errors
   NSError *error = [[NSError alloc] init];
   
   NSArray *objects = [builder buildObjects:&error];
   
   if ([error code] == 0)//kOperationSucess)
   {
      [self.aDelegate requestOperationSucceededWithObjects:objects];
   }
   else
   {
      [self.aDelegate requestOperationFailedWithError:error];
   }
}

#pragma mark - NSOperation Methods

// Override only the main NSOperation function for non-concurrent
-(void)main
{
   if (!self.urlConnection)
   {
      // Kick off the request
      self.receivedData = [NSMutableData data];
      self.urlConnection = [NSURLConnection connectionWithRequest:self.urlRequest
                                                         delegate:self];
   }
}

#pragma mark - NSConnectionDelegate Methods

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
   NSLog(@"Connection failed! Error - %@ %@",
         [error localizedDescription],
         [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   NSLog(@"Succeeded: Received %ld bytes of data", (unsigned long)[self.receivedData length]);
   
   NSError *error = [[NSError alloc] init];
   self.xmlMap = [XMLFactory xmlFromData:self.receivedData Error:error];
   
   NSLog(@"XML Dictionary:\n%@", self.xmlMap);
   
   NSString *receivedDataString = [[NSString alloc] initWithBytes:self.receivedData.mutableBytes length:[self.receivedData length] encoding:NSUTF8StringEncoding];
   
   NSLog(@"Received data string: %@", receivedDataString);
   
   [self buildObjects];
}

@end
