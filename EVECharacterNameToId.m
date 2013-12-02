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
      self.maxNamesPerCall = 250;
      self.namesQueryIndex = 0;
      self.numNamesLeftToQuery = 0;
      
      // Common API Properties
      self.commonName = @"Character Name to ID";
      [self.uri appendString:@"eve/CharacterID.xml.aspx"];
      
      NSMutableArray *namesToBeQueried = [NSMutableArray new];
      if ([names count] > self.maxNamesPerCall)
      {
         self.numNamesLeftToQuery = [names count] - self.maxNamesPerCall;
         
         for (unsigned int index = 0; index < self.maxNamesPerCall; ++index)
         {
            [namesToBeQueried addObject:names[index]];
         }
      }
      else
      {
         [namesToBeQueried addObjectsFromArray:names];
      }
      
      self.namesQueryIndex += [namesToBeQueried count];
      [self.uriArguments addEntriesFromDictionary:@{@"names":[namesToBeQueried
                                                            componentsJoinedByString:@","]}];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.characters = [NSMutableArray new];
      
      // Instance Properties
      self.names = names;
      
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

-(BOOL)queriedMoreNames
{
   if (self.numNamesLeftToQuery > 0)
   {
      NSMutableArray *namesToBeQueried = [NSMutableArray new];
      if (self.numNamesLeftToQuery > self.maxNamesPerCall)
      {
         self.numNamesLeftToQuery -= self.maxNamesPerCall;
         
         for (unsigned int index = self.namesQueryIndex;
              index < self.maxNamesPerCall + self.namesQueryIndex && index < [self.names count];
              ++index)
         {
            [namesToBeQueried addObject:self.names[index]];
         }
         
         self.namesQueryIndex += self.maxNamesPerCall;
      }
      else
      {
         self.numNamesLeftToQuery = 0;
         self.namesQueryIndex = 0;
         
         for (unsigned int index = self.namesQueryIndex;
              index < [self.names count];
              ++index)
         {
            [namesToBeQueried addObject:self.names[index]];
         }
      }
      
      self.uriArguments[@"names"] = [namesToBeQueried componentsJoinedByString:@","];
      
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
   
   // If we didn't query more names
   if (![self queriedMoreNames])
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
