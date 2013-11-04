//
//  EVECallList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVECallList.h"

#import "EVEAccountStatus.h"
#import "EVECall.h"
#import "EVECallGroup.h"

@interface EVECallList ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVECallList

#pragma mark - Instance Methods

-(EVECallList *)init
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Call List";
      [self.uri appendString:@"api/calllist.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.calls = [NSMutableArray new];
      self.callGroups = [NSMutableArray new];
      
      // Instance Properties
      
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
   
   for (id object in self.callGroups)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   for (id object in self.calls)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *callBlueprint = [[EVECall new] objectBlueprint];
   [callBlueprint setXmlKeypath:@"eveapi.result.rowset.row"
             MatchingParentName:@"rowset"
            ParentXmlAttributes:@{@"name":@"calls"}];
   
   ObjectBlueprint *callGroupBlueprint = [[EVECallGroup new] objectBlueprint];
   [callGroupBlueprint setXmlKeypath:@"eveapi.result.rowset.row"
                  MatchingParentName:@"rowset"
                 ParentXmlAttributes:@{@"name":@"callGroups"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[callBlueprint, callGroupBlueprint]];
   
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
      if ([object class] == [EVECall class])
      {
         [self.calls addObject:object];
      }
      else if ([object class] == [EVECallGroup class])
      {
         [self.callGroups addObject:object];
      }
   }
   
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:nil];
}

-(void)requestOperationFailedWithError:(NSError *)error;
{
   [[NSNotificationCenter defaultCenter] postNotificationName:NSStringFromClass([self class])
                                                       object:nil
                                                     userInfo:@{@"error":error}];
}

@end
