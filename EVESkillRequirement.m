//
//  EVESkillRequirement.m
//  EveAPI
//
//  Created by Johnathan Richter on 12/25/13.
//  Copyright (c) 2013 Johnathan Richter. All rights reserved.
//

#import "EVESkillRequirement.h"

@interface EVESkillRequirement ()

@end

@implementation EVESkillRequirement

#pragma mark - Instance Methods

-(EVESkillRequirement *)init
{
   self = [super init];
   if (self)
   {
      // Initialize XML Variables
      self.skillLevel = @0;
      self.typeId = @0;
      
      // Configure the object's blueprint
      [self configureObjectBlueprint];
   }
   
   return self;
}

-(void)configureObjectBlueprint
{
   [self.objectBlueprint setObjectClassId:[self class]];
   [self.objectBlueprint addAttributesFromDictionary:@{@"skillLevel":@"skillLevel",
                                                       @"typeID":@"typeId"}];
}

-(NSString *)description
{
   return [NSString stringWithFormat:@"Skill Requirement Type ID: %@, Level: %@",
                                       self.typeId, self.skillLevel];
}

#pragma mark - Private Instance Methods

#pragma mark - KVC Attribute and To-One Compliance Methods

-(void)setNilValueForKey:(NSString *)key
{
   if([key isEqualToString:@"typeId"])
   {
      [self setValue:@0 forKey:key];
   }
   else if([key isEqualToString:@"skillLevel"])
   {
      [self setValue:@0 forKey:key];
   }
}

@end
