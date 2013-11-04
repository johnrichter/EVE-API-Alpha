//
//  EVEFactionalWarefareStats.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionalWarfareStats.h"
#import "EVEFactionId.h"
#import "EVEFactionName.h"
#import "EVEFactionEnlistDate.h"
#import "EVEFactionCurrentRank.h"
#import "EVEFactionHighestRank.h"
#import "EVEFactionKillsYesterday.h"
#import "EVEFactionKillsLastWeek.h"
#import "EVEFactionTotalKills.h"
#import "EVEFactionVictoryPointsYesterday.h"
#import "EVEFactionVictoryPointsLastWeek.h"
#import "EVEFactionTotalVictoryPoints.h"

@interface EVEFactionalWarfareStats ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEFactionalWarfareStats

#pragma mark - Instance Methods

-(EVEFactionalWarfareStats *)initWithEveKeyId:(NSString *)keyId
                                        VCode:(NSString *)vCode
                                  CharacterId:(NSNumber *)characterId
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Faction Warfare Stats";
      [self.uri appendString:@"char/FacWarStats.xml.aspx"];
      [self.uriArguments addEntriesFromDictionary:@{@"keyID":keyId,
                                                    @"vCode":vCode,
                                                    @"characterID":[characterId stringValue]}];
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      self.legacyApiRestriction = kFullAccess;
      self.isLegacyApiKeyEnabled = NO;
      
      // Built Object Properties
      self.factionId = @0;
      self.factionName = @"";
      self.dateEnlisted = [[EVEDate new] date];
      self.currentRank = @0;
      self.highestRank = @0;
      self.killsYesterday = @0;
      self.killsLastWeek = @0;
      self.totalKills = @0;
      self.victoryPointsYesterday = @0;
      self.victoryPointsLastWeek = @0;
      self.totalVictoryPoints = @0;
      
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
   
   [api appendFormat:@"Faction ID: %@\n"
                     @"Faction Name: %@\n"
                     @"Date Enlisted: %@\n"
                     @"Player's Current Rank: %@\n"
                     @"Player's Highest Rank: %@\n"
                     @"Kills Yesterday: %@\n"
                     @"Kills Last Week: %@\n"
                     @"Total Kills: %@\n"
                     @"Victory Points Earned Yesterday: %@\n"
                     @"Victory Points Earned Last Week: %@\n"
                     @"Total Victory Points: %@\n",
                     self.factionId,
                     self.factionName,
                     self.dateEnlisted,
                     self.currentRank,
                     self.highestRank,
                     self.killsYesterday,
                     self.killsLastWeek,
                     self.totalKills,
                     self.victoryPointsYesterday,
                     self.victoryPointsLastWeek,
                     self.totalVictoryPoints];
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *factionId = [[EVEFactionId new] objectBlueprint];
   [factionId setXmlKeypath:@"eveapi.result.factionID"];
   
   ObjectBlueprint *factionName = [[EVEFactionName new] objectBlueprint];
   [factionName setXmlKeypath:@"eveapi.result.factionName"];
   
   ObjectBlueprint *dateEnlisted = [[EVEFactionEnlistDate new] objectBlueprint];
   [dateEnlisted setXmlKeypath:@"eveapi.result.enlisted"];
   
   ObjectBlueprint *currentRank = [[EVEFactionCurrentRank new] objectBlueprint];
   [currentRank setXmlKeypath:@"eveapi.result.currentRank"];
   
   ObjectBlueprint *highestRank = [[EVEFactionHighestRank new] objectBlueprint];
   [highestRank setXmlKeypath:@"eveapi.result.highestRank"];
   
   ObjectBlueprint *killsYesterday = [[EVEFactionKillsYesterday new] objectBlueprint];
   [killsYesterday setXmlKeypath:@"eveapi.result.killsYesterday"];
   
   ObjectBlueprint *killsLastWeek = [[EVEFactionKillsLastWeek new] objectBlueprint];
   [killsLastWeek setXmlKeypath:@"eveapi.result.killsLastWeek"];
   
   ObjectBlueprint *totalKills = [[EVEFactionTotalKills new] objectBlueprint];
   [totalKills setXmlKeypath:@"eveapi.result.killsTotal"];
   
   ObjectBlueprint *victoryPointsYesterday = [[EVEFactionVictoryPointsYesterday new] objectBlueprint];
   [victoryPointsYesterday setXmlKeypath:@"eveapi.result.victoryPointsYesterday"];
   
   ObjectBlueprint *victoryPointsLastWeek = [[EVEFactionVictoryPointsLastWeek new] objectBlueprint];
   [victoryPointsLastWeek setXmlKeypath:@"eveapi.result.victoryPointsLastWeek"];
   
   ObjectBlueprint *totalVictoryPoints = [[EVEFactionTotalVictoryPoints new] objectBlueprint];
   [totalVictoryPoints setXmlKeypath:@"eveapi.result.victoryPointsTotal"];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[factionId, factionName, dateEnlisted,
                                                currentRank, highestRank, killsYesterday,
                                                killsLastWeek, totalKills,
                                                victoryPointsYesterday, victoryPointsLastWeek,
                                                totalVictoryPoints]];
   
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
      if ([object class] == [EVEFactionId class])
      {
         self.factionId = ((EVEFactionId *)object).number;
      }
      else if ([object class] == [EVEFactionName class])
      {
         self.factionName = ((EVEFactionName *)object).string;
      }
      else if ([object class] == [EVEFactionEnlistDate class])
      {
         self.dateEnlisted = ((EVEFactionEnlistDate *)object).date;
      }
      else if ([object class] == [EVEFactionCurrentRank class])
      {
         self.currentRank = ((EVEFactionCurrentRank *)object).number;
      }
      else if ([object class] == [EVEFactionHighestRank class])
      {
         self.highestRank = ((EVEFactionHighestRank *)object).number;
      }
      else if ([object class] == [EVEFactionKillsYesterday class])
      {
         self.killsYesterday = ((EVEFactionKillsYesterday *)object).number;
      }
      else if ([object class] == [EVEFactionKillsLastWeek class])
      {
         self.killsLastWeek = ((EVEFactionKillsLastWeek *)object).number;
      }
      else if ([object class] == [EVEFactionTotalKills class])
      {
         self.totalKills = ((EVEFactionTotalKills *)object).number;
      }
      else if ([object class] == [EVEFactionVictoryPointsYesterday class])
      {
         self.victoryPointsYesterday = ((EVEFactionVictoryPointsYesterday *)object).number;
      }
      else if ([object class] == [EVEFactionVictoryPointsLastWeek class])
      {
         self.victoryPointsLastWeek = ((EVEFactionVictoryPointsLastWeek *)object).number;
      }
      else if ([object class] == [EVEFactionTotalVictoryPoints class])
      {
         self.totalVictoryPoints = ((EVEFactionTotalVictoryPoints *)object).number;
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
