//
//  EVEContactList.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEContactList.h"
#import "EVECharacterContact.h"
#import "EVECorporationContact.h"
#import "EVEAllianceContact.h"

@interface EVEContactList ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEContactList

#pragma mark - Instance Methods

-(EVEContactList *)initWithEveKeyId:(NSString *)keyId
                              VCode:(NSString *)vCode
                        CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Contact List";
      [self.uri appendString:@"char/ContactList.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @16;
      self.cacheStyle = kLongCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = YES;
      
      // Built Object Properties
      self.characterContacts = [NSMutableArray new];
      self.corporateContacts = [NSMutableArray new];
      self.allianceContacts = [NSMutableArray new];
      
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
   
   for (id object in self.characterContacts)
   {
      [api appendFormat:@"Character %@\n", object];
   }
   
   for (id object in self.corporateContacts)
   {
      [api appendFormat:@"Corporate %@\n", object];
   }
   
   for (id object in self.allianceContacts)
   {
      [api appendFormat:@"Alliance %@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *charContact = [[EVECharacterContact new] objectBlueprint];
   [charContact setXmlKeypath:@"eveapi.result.rowset.row"
           MatchingParentName:@"rowset"
          ParentXmlAttributes:@{@"name":@"contactList"}];
   
   ObjectBlueprint *corpContact = [[EVECorporationContact new] objectBlueprint];
   [corpContact setXmlKeypath:@"eveapi.result.rowset.row"
           MatchingParentName:@"rowset"
          ParentXmlAttributes:@{@"name":@"corporateContactList"}];
   
   ObjectBlueprint *alliContact = [[EVEAllianceContact new] objectBlueprint];
   [alliContact setXmlKeypath:@"eveapi.result.rowset.row"
           MatchingParentName:@"rowset"
          ParentXmlAttributes:@{@"name":@"allianceContactList"}];
   
   // Add the objects to our list
   [self.objectBlueprints addObjectsFromArray:@[charContact, corpContact, alliContact]];
   
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
      if ([object class] == [EVECharacterContact class])
      {
         [self.characterContacts addObject:object];
      }
      else if ([object class] == [EVECorporationContact class])
      {
         [self.corporateContacts addObject:object];
      }
      else if ([object class] == [EVEAllianceContact class])
      {
         [self.allianceContacts addObject:object];
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
