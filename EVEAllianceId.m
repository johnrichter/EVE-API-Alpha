//
//  EVEAllianceId.m
//  EveAPI
//
//  Created by Johnathan Richter on 10/15/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVEAllianceId.h"

@interface EVEAllianceId ()

@end

@implementation EVEAllianceId

#pragma mark - Instance Methods

-(EVEAllianceId *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.allianceId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint setObjectValue:@"allianceId"];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"%@", self.allianceId];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"allianceId"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
