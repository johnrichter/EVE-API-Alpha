//
//  EVECharacterNameToId.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterNameToId.h"
#import "EVECharacter.h"

@interface EVECharacterNameToId ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVECharacterNameToId

#pragma mark - Instance Methods
-(EVECharacterNameToId *)initWithNames:(NSArray *)names
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Name to ID";
      [self.uri appendString:@"eve/CharacterID.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.names = [names copy];
      self.namesToQuery = [NSMutableArray arrayWithArray:self.names];
      self.maxNamesPerCall = 250;
      
      // URI argument setup
      NSMutableArray *nextNameBatchToQuery = [NSMutableArray new];
      if ([self.namesToQuery count] > self.maxNamesPerCall)
      {
         for (unsigned int index = 0; index < self.maxNamesPerCall; ++index)
         {
            [nextNameBatchToQuery addObject:self.namesToQuery[index]];
         }
      }
      else
      {
         [nextNameBatchToQuery addObjectsFromArray:self.namesToQuery];
      }
      
      // Add the batch to the URI
      [self.uriArguments addEntriesFromDictionary:@{@"names":[nextNameBatchToQuery
                                                              componentsJoinedByString:@","]}];
      
      // Remove the batch from our master query list
      [self.namesToQuery removeObjectsInArray:nextNameBatchToQuery];
      
      // Object Building Properties
      [self configureObjectBuilders];
   }
   
   return self;
}

-(void)queryTheApi
{
   [self.requestOperation start];
}

-(NSString *)description
{
   NSMutableString *api = [NSMutableString stringWithFormat:
                           @"%@ - Version %@\n\n"
                           @"URI:\t\t\t\t\t\t%@\n"
                           @"Legacy API Enabled:\t\t\t%s\n"
                           @"Legacy API Restriction:\t\t%@\n"
                           @"CAK Access Mask Required:\t%@\n"
                           @"Date Last Queried:\t\t\t%@\n"
                           @"Cached Until:\t\t\t\t%@\n"
                           @"Cache Style:\t\t\t\t%@\n"
                           @"API Error:\t\t\t\t\t%@\n\n",
                           self.commonName,
                           self.apiVersion,
                           self.uri,
                           self.isLegacyApiKeyEnabled ? "Yes":"No",
                           [EVEApiObject legacyApiRestrictionToString:self.legacyApiRestriction],
                           self.cakAccessMask,
                           self.lastQueried,
                           self.cachedUntil,
                           [EVEApiObject cacheStyleToString:self.cacheStyle],
                           self.apiError];
   
   for (id object in self.characters)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}

-(BOOL)didQueryMoreNames
{
   if([self.namesToQuery count] == 0)
   {
      return NO;
   }
   
   NSMutableArray *nextNameBatchToQuery = [NSMutableArray new];
   if ([self.namesToQuery count] > self.maxNamesPerCall)
   {
      for (unsigned int index = 0; index < self.maxNamesPerCall; ++index)
      {
         [nextNameBatchToQuery addObject:self.namesToQuery[index]];
      }
   }
   else
   {
      [nextNameBatchToQuery addObjectsFromArray:self.namesToQuery];
   }
   
   // remove the next batch from our master query list
   [self.namesToQuery removeObjectsInArray:nextNameBatchToQuery];
   
   self.uriArguments[@"ids"] = [nextNameBatchToQuery componentsJoinedByString:@","];
   
   // Create a new RequestOperation
   self.requestOperation = [[RequestOperation alloc] initWithDelegate:self];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
   
   NSLog(@"Retrieving more type names.");
   
   // Asynchronously fetch the next batch of type names
   [self.requestOperation start];

   return YES;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *character = [[EVECharacter new] objectBlueprint];
   [character setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:character];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
}

#pragma mark - RequestOperationProtocolMethods

-(void)requestOperationSucceededWithObjects:(NSArray *)objects
{
   // Call our base classes protocol function
   [super requestOperationSucceededWithObjects:objects];
   
   for (id object in objects)
   {
      if ([object class] == [EVECharacter class])
      {
         [self.characters addObject:object];
      }
   }
   
   // If we didn't query more names
   if (![self didQueryMoreNames])
   {
      [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                          object:nil
                                                        userInfo:nil];
   }
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}


@end
