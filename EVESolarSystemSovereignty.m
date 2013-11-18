//
//  EVESolarSystemSovereignty.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESolarSystemSovereignty.h"

@interface EVESolarSystemSovereignty ()

@end

@implementation EVESolarSystemSovereignty

#pragma mark - Instance Methods

-(EVESolarSystemSovereignty *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.solarSystemName = @"";
      self.solarSystemId = @0;
      self.corporationId = @0;
      self.allianceId = @0;
      self.factionId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"solarSystemName":@"solarSystemName",
                                                       @"solarSystemID":@"solarSystemId",
                                                       @"corporationID":@"corporationId",
                                                       @"allianceID":@"allianceId",
                                                       @"factionID":@"factionId"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Solar System { ID: %@, Name: %@ } | "
                                     @"Corporation ID: %@ | Alliance ID: %@ | Faction ID: %@",
                                     self.solarSystemId, self.solarSystemName,
                                     self.corporationId, self.allianceId, self.factionId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"solarSystemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"solarSystemName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"allianceId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"factionId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
