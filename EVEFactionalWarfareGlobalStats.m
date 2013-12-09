//
//  EVEFactionalWarfareGlobalSummary.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionalWarfareGlobalStats.h"

#import "EVEFactionKillsYesterday.h"
#import "EVEFactionKillsLastWeek.h"
#import "EVEFactionTotalKills.h"
#import "EVEFactionVictoryPointsYesterday.h"
#import "EVEFactionVictoryPointsLastWeek.h"
#import "EVEFactionTotalVictoryPoints.h"
#import "EVEFaction.h"
#import "EVEFactionWar.h"

@interface EVEFactionalWarfareGlobalStats ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEFactionalWarfareGlobalStats

#pragma mark - Instance Methods

-(EVEFactionalWarfareGlobalStats *)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Factional Warfare Global Summary";
      [self.uri appendString:@"eve/FacWarStats.xml.aspx"];

      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.killsYesterday = @0;
      self.killsLastWeek = @0;
      self.totalKills = @0;
      self.victoryPointsYesterday = @0;
      self.victoryPointsLastWeek = @0;
      self.totalVictoryPoints = @0;
      self.factions = [NSMutableArray new];
      self.factionWars = [NSMutableArray new];
      
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
   
   [api appendFormat:@"Kills Yesterday: %@\n"
                     @"Kills Last Week: %@\n"
                     @"Total Kills: %@\n"
                     @"Victory Points Yesterday: %@\n"
                     @"Victory Points Last Week: %@\n"
                     @"Total Victory Points: %@\n",
                     self.killsYesterday, self.killsLastWeek, self.totalKills,
                     self.victoryPointsYesterday, self.victoryPointsLastWeek,
                     self.totalVictoryPoints];
   
   for (id object in self.factions)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   for (id object in self.factionWars)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *killsYesterday = [[EVEFactionKillsYesterday new] objectBlueprint];
   [killsYesterday setXmlKeypath:@"eveapi.result.totals.killsYesterday"];
   
   ObjectBlueprint *killsLastWeek = [[EVEFactionKillsLastWeek new] objectBlueprint];
   [killsLastWeek setXmlKeypath:@"eveapi.result.totals.killsLastWeek"];
   
   ObjectBlueprint *totalKills = [[EVEFactionTotalKills new] objectBlueprint];
   [totalKills setXmlKeypath:@"eveapi.result.totals.killsTotal"];
   
   ObjectBlueprint *victoryPY = [[EVEFactionVictoryPointsYesterday new] objectBlueprint];
   [victoryPY setXmlKeypath:@"eveapi.result.totals.victoryPointsYesterday"];
   
   ObjectBlueprint *victoryPLW = [[EVEFactionVictoryPointsLastWeek new] objectBlueprint];
   [victoryPLW setXmlKeypath:@"eveapi.result.totals.victoryPointsLastWeek"];
   
   ObjectBlueprint *victoryPT = [[EVEFactionTotalVictoryPoints new] objectBlueprint];
   [victoryPT setXmlKeypath:@"eveapi.result.totals.victoryPointsTotal"];
   
   ObjectBlueprint *faction = [[EVEFaction new] objectBlueprint];
   [faction setXmlKeypath:@"eveapi.result.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"factions"}];
   
   ObjectBlueprint *factionWar = [[EVEFactionWar new] objectBlueprint];
   [factionWar setXmlKeypath:@"eveapi.result.rowset.row"
          MatchingParentName:@"rowset"
         ParentXmlAttributes:@{@"name":@"factionWars"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[killsYesterday, killsLastWeek,
                                                totalKills, victoryPY, victoryPLW,
                                                victoryPT, faction, factionWar]];
   
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
      if ([object class] == [EVEFactionKillsYesterday class])
      {
         self.killsYesterday = ((EVEFactionKillsYesterday *)object).kills;
      }
      else if ([object class] == [EVEFactionKillsLastWeek class])
      {
         self.killsLastWeek = ((EVEFactionKillsLastWeek *)object).kills;
      }
      else if ([object class] == [EVEFactionTotalKills class])
      {
         self.totalKills = ((EVEFactionTotalKills *)object).kills;
      }
      else if ([object class] == [EVEFactionVictoryPointsYesterday class])
      {
         self.victoryPointsYesterday = ((EVEFactionVictoryPointsYesterday *)object).victoryPoints;
      }
      else if ([object class] == [EVEFactionVictoryPointsLastWeek class])
      {
         self.victoryPointsLastWeek = ((EVEFactionVictoryPointsLastWeek *)object).victoryPoints;
      }
      else if ([object class] == [EVEFactionTotalVictoryPoints class])
      {
         self.totalVictoryPoints = ((EVEFactionTotalVictoryPoints *)object).victoryPoints;
      }
      else if ([object class] == [EVEFaction class])
      {
         [self.factions addObject:object];
      }
      else if ([object class] == [EVEFactionWar class])
      {
         [self.factionWars addObject:object];
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
