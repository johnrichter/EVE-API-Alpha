//
//  EVEMedals.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEMedals.h"
#import "EVEMedal.h"

@interface EVEMedals ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEMedals

#pragma mark - Instance Methods

-(EVEMedals *)initWithEveKeyId:(NSString *)keyId
                         VCode:(NSString *)vCode
                   CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Medals";
      [self.uri appendString:@"char/Medals.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @8192;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.currentCorporationMedals = [NSMutableArray new];
      self.otherMedals = [NSMutableArray new];
      
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
   
   [api appendString:@"Medals from current corporation:\n"];
   for (id object in self.currentCorporationMedals)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"Medals from all other corporations:\n"];
   for (id object in self.otherMedals)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *medal = [[EVEMedal new] objectBlueprint];
   [medal setXmlKeypath:@"eveapi.result.rowset.row"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObject:medal];
   
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
      if ([object class] == [EVEMedal class])
      {
         EVEMedal *medal = (EVEMedal *)object;
         
         if ([medal.fromCorporationId isEqualToNumber:@0] &&
             [medal.title isEqualToString:@""] &&
             [medal.description isEqualToString:@""])
         {
            [self.currentCorporationMedals addObject:medal];
         }
         else
         {
            [self.otherMedals addObject:medal];
         }
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
