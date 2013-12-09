//
//  EVECharacterName.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECharacterIdToName.h"
#import "EVECharacter.h"

@interface EVECharacterIdToName ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVECharacterIdToName

#pragma mark - Instance Methods
-(EVECharacterIdToName *)initWithIds:(NSArray *)ids
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Character Id to Name";
      [self.uri appendString:@"eve/CharacterName.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.ids = [ids copy];
      self.idsToQuery = [NSMutableArray arrayWithArray:self.ids];
      self.maxIdsPerCall = 250;
      
      // URI argument setup
      NSMutableArray *nextIdBatchToQuery = [NSMutableArray new];
      if ([self.idsToQuery count] > self.maxIdsPerCall)
      {
         for (unsigned int index = 0; index < self.maxIdsPerCall; ++index)
         {
            [nextIdBatchToQuery addObject:self.idsToQuery[index]];
         }
      }
      else
      {
         [nextIdBatchToQuery addObjectsFromArray:self.idsToQuery];
      }
      
      // Add the batch to the URI
      [self.uriArguments addEntriesFromDictionary:@{@"ids":[nextIdBatchToQuery
                                                            componentsJoinedByString:@","]}];
      
      // Remove the next batch from our master query list
      [self.idsToQuery removeObjectsInArray:nextIdBatchToQuery];
      
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

-(BOOL)didQueryMoreIds
{
   // if there are objects in the 'idsToQuery' array then we are not finished
   if ([self.idsToQuery count] == 0)
   {
      return NO;
   }
   
   NSMutableArray *nextIdBatchToQuery = [NSMutableArray new];
   if ([self.idsToQuery count] > self.maxIdsPerCall)
   {
      for (unsigned int index = 0; index < self.maxIdsPerCall; ++index)
      {
         [nextIdBatchToQuery addObject:self.idsToQuery[index]];
      }
   }
   else
   {
      [nextIdBatchToQuery addObjectsFromArray:self.idsToQuery];
   }
   
   // remove the next batch from our master query list
   [self.idsToQuery removeObjectsInArray:nextIdBatchToQuery];
   
   self.uriArguments[@"ids"] = [nextIdBatchToQuery componentsJoinedByString:@","];
   
   // Create a new RequestOperation
   self.requestOperation = [[RequestOperation alloc] initWithDelegate:self];
   
   // Configure our RequestOperation with URI and Arguements
   [self.requestOperation setUrl:self.uri
                  WithArguements:self.uriArguments
                      Blueprints:self.objectBlueprints];
   
   NSLog(@"Retrieving more type names.");
   
   // Asynchronously fetch the next batch of type names
   [self.requestOperation start];
   
   return YES;}


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
   
   // If we didn't query more ids
   if (![self didQueryMoreIds])
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
