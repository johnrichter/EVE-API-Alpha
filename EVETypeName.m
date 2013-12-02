//
//  EVETypeName.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVETypeName.h"
#import "EVEType.h"

@interface EVETypeName ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVETypeName

#pragma mark - Instance Methods

-(EVETypeName *)initWithIds:(NSArray *)ids
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Type ID to Name";
      [self.uri appendString:@"eve/TypeName.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.types = [NSMutableArray new];
      
      // Instance Properties
      self.ids = [ids copy];
      self.idsToQuery = [NSMutableArray arrayWithArray:ids];
      self.maxEntriesPerCall = 250;
      
      // URI argument setup
      NSMutableArray *nextIdBatchToQuery = [NSMutableArray new];
      if ([self.idsToQuery count] > self.maxEntriesPerCall)
      {
         for (unsigned int index = 0; index < self.maxEntriesPerCall; ++index)
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
      
      [self.uriArguments addEntriesFromDictionary:@{@"ids":[nextIdBatchToQuery
                                                            componentsJoinedByString:@","]}];
      
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
   
   for (id object in self.types)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}

-(BOOL)queriedMoreIds
{
   // if there are objects in the 'idsToQuery' array then we are not finished
   if ([self.idsToQuery count] == 0)
   {
      return NO;
   }
   
   NSMutableArray *nextIdBatchToQuery = [NSMutableArray new];
   if ([self.idsToQuery count] > self.maxEntriesPerCall)
   {
      for (unsigned int index = 0; index < self.maxEntriesPerCall; ++index)
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
   
   return YES;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *type = [[EVEType new] objectBlueprint];
   [type setXmlKeypath:@"eveapi.result.rowset.row"
    MatchingParentName:@"rowset"
   ParentXmlAttributes:@{@"name":@"types"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:type];
   
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
      if ([object class] == [EVEType class])
      {
         [self.types addObject:object];
      }
   }
   
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
