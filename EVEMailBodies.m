//
//  EVEMailBodies.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMailBodies.h"
#import "EVEMail.h"

@interface EVEMailBodies ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEMailBodies

@synthesize missingMessageIdsString = _missingMessageIdsString;

#pragma mark - Instance Methods

-(EVEMailBodies *)initWithEveKeyId:(NSString *)keyId
                             VCode:(NSString *)vCode
                       CharacterId:(NSNumber *)characterId
                           MailIds:(NSArray *)mailIds;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Mail Bodies";
      [self.uri appendString:@"char/MailBodies.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue],
                                                    @"ids":[mailIds componentsJoinedByString:@","]}];
      self.cakAccessMask = @512;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.eveMails = [NSMutableArray new];
      self.missingMessageIds = @[];
      self.missingMessageIdsString = [EVEString new];
      
      // Instance Properties
      self.keyId = keyId;
      self.vCode = vCode;
      self.characterId = characterId;
      self.mailIds = mailIds;
      
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
   
   [api appendFormat:@"Message IDs %@ did not exist\n\n",
                     [self.missingMessageIds componentsJoinedByString:@", "]];
   
   for (id object in self.eveMails)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}

#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *evemail = [[EVEMail new] objectBlueprint];
   [evemail setXmlKeypath:@"eveapi.result.rowset.row"];
   
   ObjectBlueprint *missingMessageIds = [[EVEString new] objectBlueprint];
   [missingMessageIds setXmlKeypath:@"eveapi.result.missingMessageIDs"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[evemail, missingMessageIds]];
   
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
      if ([object class] == [EVEMail class])
      {
         [self.eveMails addObject:object];
      }
      else if ([object class] == [EVEString class])
      {
         self.missingMessageIds = [((EVEString *)object).string componentsSeparatedByString:@","];
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
