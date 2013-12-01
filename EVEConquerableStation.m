//
//  EVEConquerableStation.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/30/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEConquerableStation.h"

@interface EVEConquerableStation ()

@end

@implementation EVEConquerableStation

#pragma mark - Instance Methods

-(EVEConquerableStation *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.stationId = @0;
      self.stationName = @"";
      self.stationTypeId = @0;
      self.solarSystemId = @0;
      self.corporationId = @0;
      self.corporationName = @"";
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"stationID":@"stationId",
                                                       @"stationName":@"stationName",
                                                       @"stationTypeID":@"stationTypeId",
                                                       @"solarSystemID":@"solarSystemId",
                                                       @"corporationID":@"corporationId",
                                                       @"corporationName":@"corporationName"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Conquerable Station ID: %@ | Name: %@ | "
                                     @"Type ID: %@ | Solar System ID: %@ | "
                                     @"Corporation { ID: %@, Name: %@ }",
                                     self.stationId, self.stationName, self.stationTypeId,
                                     self.solarSystemId, self.corporationId,
                                     self.corporationName];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"stationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"stationName"])
   {
      [self setValue:@"" forKey:key];
   }
   else if([key isEqualToString:@"stationTypeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"solarSystemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"corporationId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"corporationName"])
   {
      [self setValue:@"" forKey:key];
   }
}

@end
