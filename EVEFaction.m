//
//  EVEFaction.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFaction.h"

@interface EVEFaction ()

@end

@implementation EVEFaction

#pragma mark - Instance Methods

-(EVEFaction *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.factionId = @0;
      self.factionName = @"";
      self.pilotCount = @0;
      self.systemsControlled = @0;
      self.killsYesterday = @0;
      self.killsLastWeek = @0;
      self.totalKills = @0;
      self.victoryPointsYesterday = @0;
      self.victoryPointsLastWeek = @0;
      self.totalVictoryPoints = @0;
      
      self.kills = @0;
      self.victoryPoints = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:
      @{@"factionID":@"factionId",
        @"factionName":@"factionName",
        @"pilots":@"pilotCount",
        @"systemsControlled":@"systemsControlled",
        @"kills":@"kills",
        @"killsYesterday":@"killsYesterday",
        @"killsLastWeek":@"killsLastWeek",
        @"killsTotal":@"totalKills",
        @"victoryPoints":@"victoryPoints",
        @"victoryPointsYesterday":@"victoryPointsYesterday",
        @"victoryPointsLastWeek":@"victoryPointsLastWeek",
        @"victoryPointsTotal":@"totalVictoryPoints"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Faction ID: %@, Name: %@ | Pilots: %@ | "
                                     @"Total Systems Controlled: %@ | "
                                     @"Kills Yesterday: %@, Last Week: %@, Total: %@ | "
                                     @"Victory Points Yesterday: %@, Last Week: %@, "
                                     @"Total: %@ | Kills: %@, Victory Points: %@",
                                     self.factionId, self.factionName, self.pilotCount,
                                     self.systemsControlled, self.killsYesterday,
                                     self.killsLastWeek, self.totalKills,
                                     self.victoryPointsYesterday,
                                     self.victoryPointsLastWeek, self.totalVictoryPoints,
                                     self.kills, self.victoryPoints];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"factionId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"factionName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"pilotCount"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"systemsControlled"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"kills"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"killsYesterday"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"killsLastWeek"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"totalKills"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"victoryPoints"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"victoryPointsYesterday"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"victoryPointsLastWeek"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"totalVictoryPoints"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
