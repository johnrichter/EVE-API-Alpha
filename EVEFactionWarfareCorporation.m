//
//  EVEFactionWarfareCorporation.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/8/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionWarfareCorporation.h"

@interface EVEFactionWarfareCorporation ()

@end

@implementation EVEFactionWarfareCorporation

#pragma mark - Instance Methods

-(EVEFactionWarfareCorporation *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.corporationId = @0;
      self.corporationName = @"";
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
   [self.objectBlueprint addAttributesFromDictionary:@{@"corporationID":@"corporationId",
                                                       @"corporationName":@"corporationName",
                                                       @"kills":@"kills",
                                                       @"victoryPoints":@"victoryPoints"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Faction Warfare Corporation ID: %@, Name: %@,"
                                     @"Kills: %@, Victory Points: %@",
                                     self.corporationId, self.corporationName,
                                     self.kills, self.victoryPoints];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"corporationName"])
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
