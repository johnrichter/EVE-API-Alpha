//
//  EVEKillAttacker.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEKillAttacker.h"

@interface EVEKillAttacker ()

@end

@implementation EVEKillAttacker

#pragma mark - Instance Methods

-(EVEKillAttacker *)init
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
      self.securityStatus = @0;
      self.damageDone = @0;
      self.weaponTypeId = @0;
      self.shipTypeId = @0;
      self.finalBlow = NO;
      
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
                                                       @"securityStatus":@"securityStatus",
                                                       @"damageDone":@"damageDone",
                                                       @"finalBlow":@"finalBlow",
                                                       @"weaponTypeID":@"weaponTypeId",
                                                       @"shipTypeID":@"shipTypeId"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:
           @"Attacker Character { ID: %@, Name: %@ } | "
           @"Corporation { ID: %@, Name: %@ } | "
           @"Alliance { ID: %@, Name: %@ } | "
           @"Faction { ID: %@, Name: %@ } |"
           @"Security Status: %@ | Damage Done: %@ | Weapon Type ID: %@ | "
           @"Ship Type ID: %@ | Final Blow: %s",
           self.characterId, self.characterName, self.corporationId, self.corporationName,
           self.allianceId, self.allianceName, self.factionId, self.factionName,
           self.securityStatus, self.damageDone, self.weaponTypeId, self.shipTypeId,
           self.finalBlow ? "Yes":"No"];
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
   else if([key isEqualToString:@"securityStatus"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"damageDone"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"weaponTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"shipTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"finalBlow"])
   {
      [self setValue:NO forKey:key];
   }
}

@end
