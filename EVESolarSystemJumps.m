//
//  EVESolarSystemJumps.m
//  EveAPI
//
//  Created by Johnathan Richter on 11/17/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESolarSystemJumps.h"

@interface EVESolarSystemJumps ()

@end

@implementation EVESolarSystemJumps

#pragma mark - Instance Methods

-(EVESolarSystemJumps *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.solarSystemId = @0;
      self.shipJumps = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"solarSystemID":@"solarSystemId",
                                                       @"shipJumps":@"shipJumps"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Solar System ID: %@ | Ship Jumps: %@",
                                     self.solarSystemId, self.shipJumps];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"solarSystemId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"shipJumps"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
