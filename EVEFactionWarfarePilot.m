//
//  EVEFactionWarfarePilot.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionWarfarePilot.h"

@interface EVEFactionWarfarePilot ()

@end

@implementation EVEFactionWarfarePilot

#pragma mark - Instance Methods

-(EVEFactionWarfarePilot *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.pilotId = @0;
      self.pilotName = @"";
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
   [self.objectBlueprint addAttributesFromDictionary:@{@"characterID":@"pilotId",
                                                       @"characterName":@"pilotName",
                                                       @"kills":@"kills",
                                                       @"victoryPoints":@"victoryPoints"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Faction Warfare Pilot ID: %@, Name: %@, "
                                     @"Kills: %@, Victory Points: %@",
                                     self.pilotId, self.pilotName, self.kills,
                                     self.victoryPoints];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"pilotId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"pilotName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"kills"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"victoryPoints"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
