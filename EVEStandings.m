//
//  EVEStandings.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEStandings.h"
#import "EVEAgentStanding.h"
#import "EVENpcCorporationStanding.h"
#import "EVEFactionStanding.h"

@interface EVEStandings ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEStandings

#pragma mark - Instance Methods

-(EVEStandings *)initWithEveKeyId:(NSString *)keyId
                            VCode:(NSString *)vCode
                      CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"NPC Standings";
      [self.uri appendString:@"char/Standings.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @524288;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.agentStandings = [NSMutableArray new];
      self.npcCorporationStandings = [NSMutableArray new];
      self.factionStandings = [NSMutableArray new];
      
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
   
   for (id object in self.agentStandings)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   for (id object in self.npcCorporationStandings)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   for (id object in self.factionStandings)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *agent = [[EVEAgentStanding new] objectBlueprint];
   [agent setXmlKeypath:@"eveapi.result.characterNPCStandings.rowset.row"
     MatchingParentName:@"rowset"
    ParentXmlAttributes:@{@"name":@"agents"}];
   
   ObjectBlueprint *npcCorp = [[EVENpcCorporationStanding new] objectBlueprint];
   [npcCorp setXmlKeypath:@"eveapi.result.characterNPCStandings.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"NPCCorporations"}];
   
   ObjectBlueprint *faction = [[EVEFactionStanding new] objectBlueprint];
   [faction setXmlKeypath:@"eveapi.result.characterNPCStandings.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"factions"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[agent, npcCorp, faction]];
   
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
      if ([object class] == [EVEAgentStanding class])
      {
         [self.agentStandings addObject:object];
      }
      else if ([object class] == [EVENpcCorporationStanding class])
      {
         [self.npcCorporationStandings addObject:object];
      }
      else if ([object class] == [EVEFactionStanding class])
      {
         [self.factionStandings addObject:object];
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
