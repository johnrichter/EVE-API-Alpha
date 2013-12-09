//
//  EVEFactionalWarfareTopStats.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/3/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionalWarfareTopStats.h"

#import "EVEFactionKillsLastWeek.h"
#import "EVEFactionKillsYesterday.h"
#import "EVEFactionTotalKills.h"
#import "EVEFactionVictoryPointsLastWeek.h"
#import "EVEFactionVictoryPointsYesterday.h"
#import "EVEFactionTotalVictoryPoints.h"
#import "EVEFactionWarfarePilotKillsLastWeek.h"
#import "EVEFactionWarfarePilotKillsYesterday.h"
#import "EVEFactionWarfarePilotTotalKills.h"
#import "EVEFactionWarfarePilotVictoryPointsLastWeek.h"
#import "EVEFactionWarfarePilotVictoryPointsYesterday.h"
#import "EVEFactionWarfarePilotTotalVictoryPoints.h"
#import "EVEFactionWarfareCorporationKillsLastWeek.h"
#import "EVEFactionWarfareCorporationKillsYesterday.h"
#import "EVEFactionWarfareCorporationTotalKills.h"
#import "EVEFactionWarfareCorporationVictoryPointsLastWeek.h"
#import "EVEFactionWarfareCorporationVictoryPointsYesterday.h"
#import "EVEFactionWarfareCorporationTotalVictoryPoints.h"

@interface EVEFactionalWarfareTopStats ()

#pragma mark - EVEApiProtool Methods
-(void)configureObjectBuilders;

#pragma mark - RequestOperationProtocolMethods
-(void)requestOperationSucceededWithObjects:(NSArray *)objects;
-(void)requestOperationFailedWithError:(NSError *)error;

@end

@implementation EVEFactionalWarfareTopStats

#pragma mark - Instance Methods

-(EVEFactionalWarfareTopStats *)init;
{
   self = [super init];
   if (self)
   {
      // Common API Properties
      self.commonName = @"Factional Warfare Top Stats";
      [self.uri appendString:@"eve/FacWarTopStats.xml.aspx"];
      
      self.cakAccessMask = @0;
      self.cacheStyle = kModifiedShortCache;
      
      // Built Object Properties
      self.pilotKillsLastWeek = [NSMutableOrderedSet new];
      self.pilotKillsYesterday = [NSMutableOrderedSet new];
      self.pilotTotalKills = [NSMutableOrderedSet new];
      self.pilotVictoryPointsYesterday = [NSMutableOrderedSet new];
      self.pilotVictoryPointsLastWeek = [NSMutableOrderedSet new];
      self.pilotTotalVictoryPoints = [NSMutableOrderedSet new];
      self.corpKillsYesterday = [NSMutableOrderedSet new];
      self.corpKillsLastWeek = [NSMutableOrderedSet new];
      self.corpTotalKills = [NSMutableOrderedSet new];
      self.corpVictoryPointsYesterday = [NSMutableOrderedSet new];
      self.corpVictoryPointsLastWeek = [NSMutableOrderedSet new];
      self.corpTotalVictoryPoints = [NSMutableOrderedSet new];
      self.factionKillsYesterday = [NSMutableOrderedSet new];
      self.factionKillsLastWeek = [NSMutableOrderedSet new];
      self.factionTotalKills = [NSMutableOrderedSet new];
      self.factionVictoryPointsYesterday = [NSMutableOrderedSet new];
      self.factionVictoryPointsLastWeek = [NSMutableOrderedSet new];
      self.factionTotalVictoryPoints = [NSMutableOrderedSet new];
      
      // Instance Properties
      self.killsSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"kills"
                                                             ascending:NO];
      
      self.victoryPtsSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"victoryPoints"
                                                                  ascending:NO];
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
   
   [api appendString:@"Pilot Kills Yesterday\n\n"];
   for (id object in self.pilotKillsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nPilot Kills Last Week\n\n"];
   for (id object in self.pilotKillsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nPilot Total Kills\n\n"];
   for (id object in self.pilotTotalKills)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nPilot Victory Points Yesterday\n\n"];
   for (id object in self.pilotVictoryPointsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nPilot Victory Points Last Week\n\n"];
   for (id object in self.pilotVictoryPointsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nPilot Total Victory Points\n\n"];
   for (id object in self.pilotTotalVictoryPoints)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Kills Yesterday\n\n"];
   for (id object in self.corpKillsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Kills Last Week\n\n"];
   for (id object in self.corpKillsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Total Kills\n\n"];
   for (id object in self.corpTotalKills)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Victory Points Yesterday\n\n"];
   for (id object in self.corpVictoryPointsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Victory Points Last Week\n\n"];
   for (id object in self.corpVictoryPointsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nCorporation Total Victory Points\n\n"];
   for (id object in self.corpTotalVictoryPoints)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Kills Yesterday\n\n"];
   for (id object in self.factionKillsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Kills Last Week\n\n"];
   for (id object in self.factionKillsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Total Kills\n\n"];
   for (id object in self.factionTotalKills)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Victory Points Yesterday\n\n"];
   for (id object in self.factionVictoryPointsYesterday)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Victory Points Last Week\n\n"];
   for (id object in self.factionVictoryPointsLastWeek)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   [api appendString:@"\nFaction Total Victory Points\n\n"];
   for (id object in self.factionTotalVictoryPoints)
   {
      [api appendFormat:@"%@\n", object];
   }
   
   return api;
}


#pragma mark - EVEApiProtool Methods

-(void)configureObjectBuilders
{
   ObjectBlueprint *pilotKY = [[EVEFactionWarfarePilotKillsYesterday new]
                               objectBlueprint];
   [pilotKY setXmlKeypath:@"eveapi.result.characters.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"KillsYesterday"}];
   
   ObjectBlueprint *pilotKLW = [[EVEFactionWarfarePilotKillsLastWeek new]
                                objectBlueprint];
   [pilotKLW setXmlKeypath:@"eveapi.result.characters.rowset.row"
        MatchingParentName:@"rowset"
       ParentXmlAttributes:@{@"name":@"KillsLastWeek"}];
   
   ObjectBlueprint *pilotTK = [[EVEFactionWarfarePilotTotalKills new]
                               objectBlueprint];
   [pilotTK setXmlKeypath:@"eveapi.result.characters.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"KillsTotal"}];
   
   ObjectBlueprint *pilotVPY = [[EVEFactionWarfarePilotVictoryPointsYesterday new]
                                objectBlueprint];
   [pilotVPY setXmlKeypath:@"eveapi.result.characters.rowset.row"
        MatchingParentName:@"rowset"
       ParentXmlAttributes:@{@"name":@"VictoryPointsYesterday"}];
   
   ObjectBlueprint *pilotVPLW = [[EVEFactionWarfarePilotVictoryPointsLastWeek new]
                                 objectBlueprint];
   [pilotVPLW setXmlKeypath:@"eveapi.result.characters.rowset.row"
         MatchingParentName:@"rowset"
        ParentXmlAttributes:@{@"name":@"VictoryPointsLastWeek"}];
   
   ObjectBlueprint *pilotTVP = [[EVEFactionWarfarePilotTotalVictoryPoints new]
                                objectBlueprint];
   [pilotTVP setXmlKeypath:@"eveapi.result.characters.rowset.row"
        MatchingParentName:@"rowset"
       ParentXmlAttributes:@{@"name":@"VictoryPointsTotal"}];
   
   ObjectBlueprint *corpKY = [[EVEFactionWarfareCorporationKillsYesterday new]
                              objectBlueprint];
   [corpKY setXmlKeypath:@"eveapi.result.corporations.rowset.row"
      MatchingParentName:@"rowset"
     ParentXmlAttributes:@{@"name":@"KillsYesterday"}];
   
   ObjectBlueprint *corpKLW = [[EVEFactionWarfareCorporationKillsLastWeek new]
                               objectBlueprint];
   [corpKLW setXmlKeypath:@"eveapi.result.corporations.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"KillsLastWeek"}];
   
   ObjectBlueprint *corpTK = [[EVEFactionWarfareCorporationTotalKills new]
                              objectBlueprint];
   [corpTK setXmlKeypath:@"eveapi.result.corporations.rowset.row"
      MatchingParentName:@"rowset"
     ParentXmlAttributes:@{@"name":@"KillsTotal"}];
   
   ObjectBlueprint *corpVPY = [[EVEFactionWarfareCorporationVictoryPointsYesterday new]
                               objectBlueprint];
   [corpVPY setXmlKeypath:@"eveapi.result.corporations.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"VictoryPointsYesterday"}];
   
   ObjectBlueprint *corpVPLW = [[EVEFactionWarfareCorporationVictoryPointsLastWeek new]
                                objectBlueprint];
   [corpVPLW setXmlKeypath:@"eveapi.result.corporations.rowset.row"
        MatchingParentName:@"rowset"
       ParentXmlAttributes:@{@"name":@"VictoryPointsLastWeek"}];
   
   ObjectBlueprint *corpTVP = [[EVEFactionWarfareCorporationTotalVictoryPoints new]
                               objectBlueprint];
   [corpTVP setXmlKeypath:@"eveapi.result.corporations.rowset.row"
       MatchingParentName:@"rowset"
      ParentXmlAttributes:@{@"name":@"VictoryPointsTotal"}];
   
   ObjectBlueprint *factionKY = [[EVEFactionKillsYesterday new] objectBlueprint];
   [factionKY setXmlKeypath:@"eveapi.result.factions.rowset.row"
         MatchingParentName:@"rowset"
        ParentXmlAttributes:@{@"name":@"KillsYesterday"}];
   
   ObjectBlueprint *factionKLW = [[EVEFactionKillsLastWeek new] objectBlueprint];
   [factionKLW setXmlKeypath:@"eveapi.result.factions.rowset.row"
          MatchingParentName:@"rowset"
         ParentXmlAttributes:@{@"name":@"KillsLastWeek"}];
   
   ObjectBlueprint *factionTK = [[EVEFactionTotalKills new] objectBlueprint];
   [factionTK setXmlKeypath:@"eveapi.result.factions.rowset.row"
         MatchingParentName:@"rowset"
        ParentXmlAttributes:@{@"name":@"KillsTotal"}];
   
   ObjectBlueprint *factionVPY = [[EVEFactionVictoryPointsYesterday new] objectBlueprint];
   [factionVPY setXmlKeypath:@"eveapi.result.factions.rowset.row"
          MatchingParentName:@"rowset"
         ParentXmlAttributes:@{@"name":@"VictoryPointsYesterday"}];
   
   ObjectBlueprint *factionVPLW = [[EVEFactionVictoryPointsLastWeek new] objectBlueprint];
   [factionVPLW setXmlKeypath:@"eveapi.result.factions.rowset.row"
           MatchingParentName:@"rowset"
          ParentXmlAttributes:@{@"name":@"VictoryPointsLastWeek"}];
   
   ObjectBlueprint *factionTVP = [[EVEFactionTotalVictoryPoints new] objectBlueprint];
   [factionTVP setXmlKeypath:@"eveapi.result.factions.rowset.row"
          MatchingParentName:@"rowset"
         ParentXmlAttributes:@{@"name":@"VictoryPointsTotal"}];
   
   // Add the blueprints to our collection
   [self.objectBlueprints addObjectsFromArray:@[pilotKY, pilotKLW, pilotTK,
                                                pilotVPY, pilotVPLW, pilotTVP,
                                                corpKY, corpKLW, corpTK,
                                                corpVPY, corpVPLW, corpTVP,
                                                factionKY, factionKLW, factionTK,
                                                factionVPY, factionVPLW, factionTVP]];

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
      if ([object class] == [EVEFactionWarfarePilotKillsYesterday class])
      {
         [self.pilotKillsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionWarfarePilotKillsLastWeek class])
      {
         [self.pilotKillsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionWarfarePilotTotalKills class])
      {
         [self.pilotTotalKills addObject:object];
      }
      else if ([object class] == [EVEFactionWarfarePilotVictoryPointsYesterday class])
      {
         [self.pilotVictoryPointsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionWarfarePilotVictoryPointsLastWeek class])
      {
         [self.pilotVictoryPointsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionWarfarePilotTotalVictoryPoints class])
      {
         [self.pilotTotalVictoryPoints addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationKillsYesterday class])
      {
         [self.corpKillsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationKillsLastWeek class])
      {
         [self.corpKillsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationTotalKills class])
      {
         [self.corpTotalKills addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationVictoryPointsYesterday class])
      {
         [self.corpVictoryPointsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationVictoryPointsLastWeek class])
      {
         [self.corpVictoryPointsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionWarfareCorporationTotalVictoryPoints class])
      {
         [self.corpTotalVictoryPoints addObject:object];
      }
      else if ([object class] == [EVEFactionKillsYesterday class])
      {
         [self.factionKillsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionKillsLastWeek class])
      {
         [self.factionKillsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionTotalKills class])
      {
         [self.factionTotalKills addObject:object];
      }
      else if ([object class] == [EVEFactionVictoryPointsYesterday class])
      {
         [self.factionVictoryPointsYesterday addObject:object];
      }
      else if ([object class] == [EVEFactionVictoryPointsLastWeek class])
      {
         [self.factionVictoryPointsLastWeek addObject:object];
      }
      else if ([object class] == [EVEFactionTotalVictoryPoints class])
      {
         [self.factionTotalVictoryPoints addObject:object];
      }
   }
   
   [self.pilotKillsYesterday sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.pilotKillsLastWeek sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.pilotTotalKills sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.pilotVictoryPointsYesterday sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.pilotVictoryPointsLastWeek sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.pilotTotalVictoryPoints sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.corpKillsYesterday sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.corpKillsLastWeek sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.corpTotalKills sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.corpVictoryPointsYesterday sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.corpVictoryPointsLastWeek sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.corpTotalVictoryPoints sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.factionKillsYesterday sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.factionKillsLastWeek sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.factionTotalKills sortUsingDescriptors:@[self.killsSortDescriptor]];
   [self.factionVictoryPointsYesterday sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.factionVictoryPointsLastWeek sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   [self.factionTotalVictoryPoints sortUsingDescriptors:@[self.victoryPtsSortDescriptor]];
   
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
