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

/** 
 * Create a class extension for private methods.
 */
@interface RequestOperation ()

- (NSSet *) getAllXmlKeyPaths;

- (NSMutableArray *) getKeyPathForElement:(NSDictionary *)element
                                 ParentKeyPath:(NSString *)currentKeyPath;

- (NSDictionary *) createKeyPathToDictionaryMapFromObjectMatches:(NSArray *)objects;

- (BOOL) buildObjects;

@end

@implementation RequestOperation

-(RequestOperation *)initWithUrl:(NSURL *)url Blueprints:(NSArray *)blueprints
{
   self = [super init];
   if (self)
   {
      // Store the bluprint objects
      self.objectBlueprints = blueprints;
      
      // Create and save the URLRequest
      self.urlRequest = [NSURLRequest requestWithURL:url];
      
      self.blueprintToDictionaryMap = [NSMutableDictionary dictionaryWithDictionary:@{}];
      
      return self;
   }
   else
   {
      return nil;
   }
}

- (NSSet *) getAllXmlKeyPaths
{
   NSSet *keyPaths = [[NSSet alloc] init];
   
   if ([self.xmlMap count] > 0)
   {
      keyPaths =
         [NSSet setWithArray:[self getKeyPathForElement:self.xmlMap ParentKeyPath:@""]];
   }
   
   NSLog(@"keypaths: %@", keyPaths);
   
   return keyPaths;
}

- (NSMutableArray *) getKeyPathForElement:(NSDictionary *)element
                            ParentKeyPath:(NSString *)parentKeyPath
{
   NSString *currentKeyPath = @"";
   NSString *currentElementName = [element allKeys][0];
   NSMutableArray *keyPaths = [[NSMutableArray alloc] init];
   
   if (!parentKeyPath || [parentKeyPath isEqualToString:@""])
   {
      currentKeyPath = currentElementName;
   }
   else
   {
      // join the parent key path with the current element name with a '.' in between
      currentKeyPath = [@[parentKeyPath, currentElementName] componentsJoinedByString:@"."];
   }
   
   // Add our current key path into the list
   [keyPaths addObject:currentKeyPath];
   
   // If we have child elements then we need to dive deeper down the path
   NSArray *children = element[currentElementName][@"children"];
   if ([children count] > 0)
   {
      for (NSDictionary *child in children)
      {
         [keyPaths addObjectsFromArray:[self getKeyPathForElement:child
                                                         ParentKeyPath:currentKeyPath]];
      }
   }
   
   return keyPaths;
}

- (NSDictionary *) createKeyPathToDictionaryMapFromObjectMatches:(NSArray *)objects
{
   if ([objects count] <= 0) return nil;
   
   // For each blueprint match create an empty array for each blueprint key path.
   // Key paths are guaranteed to be unique due to the way objects are matched.
   NSMutableDictionary *blueprintMap = [[NSMutableDictionary alloc] init];
   if ([objects count] > 0)
   {
      for (ObjectBlueprint *bp in objects)
      {
         NSMutableArray *bpPathMatches =
            [self getXmlForKeyPath:[bp xmlKeypath]
                        ForElement:self.xmlMap ParentKeyPath:@""];
         
         [blueprintMap setValue:[NSArray arrayWithArray:bpPathMatches] forKey:[bp xmlKeypath]];
      }
   }
   
   NSLog(@"blueprintMap: %@", blueprintMap);
   
   return blueprintMap;
}

- (NSMutableArray *)getXmlForKeyPath:(NSString *)path
                               ForElement:(NSDictionary *)element
                            ParentKeyPath:(NSString *)parentKeyPath
{
   NSString *currentKeyPath = @"";
   NSString *currentElementName = [element allKeys][0];
   NSMutableArray *matches = [[NSMutableArray alloc] init];
   
   if (!parentKeyPath || [parentKeyPath isEqualToString:@""])
   {
      currentKeyPath = currentElementName;
   }
   else
   {
      // join the parent key path with the current element name with a '.' in between
      currentKeyPath = [@[parentKeyPath, currentElementName] componentsJoinedByString:@"."];
   }

   if ([currentKeyPath isEqualToString:path])
   {
      [matches addObject:element[currentElementName]];
   }
   
   // If it doesn't match we still have to check the children.
   NSArray *children = element[currentElementName][@"children"];
   if ([children count] > 0)
   {
      for (NSDictionary *child in children)
      {
         [matches addObjectsFromArray:[self getXmlForKeyPath:path
                                                  ForElement:child
                                               ParentKeyPath:currentKeyPath]];
      }
   }

   return matches;
}


- (NSArray *) findObjectMatches
{
   NSMutableArray *matches = [[NSMutableArray alloc] init];
   
   NSSet *keyPaths = [self getAllXmlKeyPaths];
   
   if ([keyPaths count] > 0)
   {
      for (ObjectBlueprint *object in self.objectBlueprints)
      {
         if ([keyPaths containsObject:[object xmlKeypath]])
         {
            [matches addObject:object];
         }
      }
   }
   
   return matches;
}

- (void) buildObjects
{
   // First, find blueprints that we need to build.
   NSArray *matches = [self findObjectMatches];
   
   // Second, build object keypath to dictionary mapping for the ObjectBuilder.
   NSDictionary *keyPathMap = [self createKeyPathToDictionaryMapFromObjectMatches:matches];
   
   // Third, build our objects
   ObjectBuilder *builder = [[ObjectBuilder alloc] initWithKeyPathToXmlMap:keyPathMap
                                                               WithObjects:matches];
   NSArray * objects = [builder buildObjects];
   NSLog(@"Objects: %@", objects);
   
   // Fourth, notify our caller we are done and have built the objects.
}

#pragma mark - NSOperation Methods

// Override only the main NSOperation function for non-concurrent
-(void)main
{
   if (!self.urlConnection)
   {
      // Kick off the request
      self.receivedData = [NSMutableData data];
      self.urlConnection = [NSURLConnection connectionWithRequest:self.urlRequest delegate:self];
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
   NSLog(@"Conneciton failed! Error - %@ %@",
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
   
   BOOL success = [self buildObjects];
}

@end
