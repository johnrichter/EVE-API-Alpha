//
//  EVEKillVictim.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKillVictim.h"

@interface EVEKillVictim ()

@end

@implementation EVEKillVictim

#pragma mark - Instance Methods

-(EVEKillVictim *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.characterId = @0;
      self.characterName = @"";
      self.corporationId = @0;
      self.corporationName = @"";
      self.allianceId = @0;
      self.allianceName = @"";
      self.factionId = @0;
      self.factionName = @"";
      self.damageTaken = @0;
      self.shipTypeId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"characterID":@"characterId",
                                                       @"characterName":@"characterName",
                                                       @"corporationID":@"corporationId",
                                                       @"corporationName":@"corporationName",
                                                       @"allianceID":@"allianceId",
                                                       @"allianceName":@"allianceName",
                                                       @"factionID":@"factionId",
                                                       @"factionName":@"factionName",
                                                       @"damageTaken":@"damageTaken",
                                                       @"shipTypeID":@"shipTypeId"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Kill Victim Character { ID: %@, Name: %@ } | Corporation { ID: %@, Name: %@ "
           @"} | Alliance { ID: %@, Name: %@ } | Faction { ID: %@, Name: %@ } | "
           @"Damage Taken: %@ | Ship Type ID: %@",
           self.characterId, self.characterName,
           self.corporationId, self.corporationName,
           self.allianceId, self.allianceName,
           self.factionId, self.factionName,
           self.damageTaken, self.shipTypeId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"characterId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"characterName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"corporationName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"allianceId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"allianceName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"factionId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"factionName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"damageTaken"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"shipTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
