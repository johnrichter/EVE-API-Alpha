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
      self.maxIdsPerCall = 250;
      self.idsQueryIndex = 0;
      self.numIdsLeftToQuery = 0;
      
      // Common API Properties
      self.commonName = @"Character Id to Name";
      [self.uri appendString:@"eve/CharacterName.xml.aspx"];

      NSMutableArray *idsToBeQueried = [NSMutableArray new];
      if ([ids count] > self.maxIdsPerCall)
      {
         self.numIdsLeftToQuery = [ids count] - self.maxIdsPerCall;
         
         for (unsigned int index = 0; index < self.maxIdsPerCall; ++index)
         {
            [idsToBeQueried addObject:ids[index]];
         }
      }
      else
      {
         [idsToBeQueried addObjectsFromArray:ids];
      }
      
      self.idsQueryIndex += [idsToBeQueried count];
      [self.uriArguments addEntriesFromDictionary:@{@"ids":[idsToBeQueried
                                                            componentsJoinedByString:@","]}];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.ids = ids;
      
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

-(BOOL)queriedMoreIds
{
   if (self.numIdsLeftToQuery > 0)
   {
      NSMutableArray *idsToBeQueried = [NSMutableArray new];
      if (self.numIdsLeftToQuery > self.maxIdsPerCall)
      {
         self.numIdsLeftToQuery -= self.maxIdsPerCall;
         
         for (unsigned int index = self.idsQueryIndex;
              index < self.maxIdsPerCall + self.idsQueryIndex && index < [self.ids count];
              ++index)
         {
            [idsToBeQueried addObject:self.ids[index]];
         }
         
         self.idsQueryIndex += self.maxIdsPerCall;
      }
      else
      {
         self.numIdsLeftToQuery = 0;
         self.idsQueryIndex = 0;
         
         for (unsigned int index = self.idsQueryIndex;
              index < [self.ids count];
              ++index)
         {
            [idsToBeQueried addObject:self.ids[index]];
         }
      }
      
      self.uriArguments[@"ids"] = [idsToBeQueried componentsJoinedByString:@","];
      
      // Create a new RequestOperation
      self.requestOperation = [[RequestOperation alloc] initWithDelegate:self];
      
      // Configure our RequestOperation with URI and Arguements
      [self.requestOperation setUrl:self.uri
                     WithArguements:self.uriArguments
                         Blueprints:self.objectBlueprints];
      
      NSLog(@"Retrieving more names.  Have already obtained %lu",
            (unsigned long)[self.characters count]);
      
      // Asynchronously fetch the next wallet journal entry page
      [self.requestOperation start];
      
      return YES;
   }
   
   return NO;
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
   
   // If we didn't query more ids
   if (![self queriedMoreIds])
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
