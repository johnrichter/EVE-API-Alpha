//
//  EVEMailingLists.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMailingLists.h"
#import "EVEMailingList.h"

@interface EVEMailingLists ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEMailingLists

#pragma mark - Instance Methods

-(EVEMailingLists *)initWithEveKeyId:(NSString *)keyId
                               VCode:(NSString *)vCode
                         CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Mailing Lists";
      [self.uri appendString:@"char/MailingLists.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @1024;
      self.cacheStyle = kShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.mailingLists = [NSMutableArray new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
      
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
   
   for (id object in self.mailingLists)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *mailingList = [[EVEMailingList new] objectBlueprint];
   [mailingList setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:mailingList];
   
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
      if ([object class] == [EVEMailingList class])
      {
         [self.mailingLists addObject:object];
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
