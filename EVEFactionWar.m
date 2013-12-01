//
//  EVEFactionWar.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/1/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEFactionWar.h"

@interface EVEFactionWar ()

@end

@implementation EVEFactionWar

#pragma mark - Instance Methods

-(EVEFactionWar *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.factionId = @0;
      self.factionName = @"";
      self.againstId = @0;
      self.againstName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"factionID":@"factionId",
                                                       @"factionName":@"factionName",
                                                       @"againstID":@"againstId",
                                                       @"againstName":@"againstName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Faction War ID: %@, Name: %@ | "
                                     @"Against ID: %@, Name: %@",
                                     self.factionId, self.factionName,
                                     self.againstId, self.againstName];
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
   else if([key isEqualToString:@"againstId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"againstName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
